import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'gemini_config.dart';
import 'nutrition_service.dart';

/// Internal DTO for structured AI meal analysis results.
class AiMealAnalysis {
  const AiMealAnalysis({
    required this.name,
    required this.emojis,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.aiMessage,
    this.aiTip,
  });

  final String name;
  /// Validated list of 1–3 emoji characters representing meal components.
  final List<String> emojis;
  final double proteinG;
  final double carbsG;
  final double fatG;
  final String aiMessage;
  final String? aiTip;
}

/// All AI calls go through this service.
///
/// Uses Gemini 2.0 Flash for both text and photo meal analysis.
/// Zero-judgment language is enforced in all prompts — words like
/// "bad", "excess", "unhealthy", or "too much" are never used.
abstract final class AiService {
  static const _geminiBaseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent';

  static const _mealPrompt = '''
You are a nutrition assistant integrated in a non-judgmental food tracking app.
Analyze this meal and respond ONLY with a valid JSON object.
No markdown, no explanation, no preamble, no code block — raw JSON only.

Required format:
{
  "name": "normalized meal name in English",
  "emojis": ["emoji1", "emoji2"],
  "protein_g": <number>,
  "carbs_g": <number>,
  "fat_g": <number>,
  "ai_message": "short encouraging message, mention the estimated kcal (protein_g*4 + carbs_g*4 + fat_g*9), zero-judgment tone",
  "ai_tip": "one optional practical suggestion for the rest of the day, or null"
}

Rules for the emojis field:
- Return an array of 1 to 3 emojis maximum
- Each emoji represents a distinct component of the meal
- Most important/largest component first
- Examples:
  · "pasta, salad, egg" → ["🍝", "🥗", "🍳"]
  · "Big Mac menu with fries and Coke" → ["🍔", "🍟", "🥤"]
  · "Greek salad" → ["🥗"]
  · "oat latte" → ["☕"]
  · "sushi platter" → ["🍣", "🍱"]
  · "steak with mashed potatoes and wine" → ["🥩", "🥔", "🍷"]
- Always single emoji characters — never text, never flags, never faces
- Never exceed 3 emojis
- Fallback to ["🍽"] if unsure

Absolute rules:
- Never use: bad, excess, unhealthy, too much, cheat, guilt, wrong, sinful
- ai_message must be warm, realistic and non-judgmental
- Estimates reflect a typical serving unless user specifies quantity
- Respond in the same language as the user input
- Return raw JSON only — no markdown formatting
''';

  /// Analyses a text meal description with Gemini 2.0 Flash.
  static Future<AiMealAnalysis> analyzeText(
    Session session,
    String text,
  ) async {
    final apiKey = GeminiConfig.getApiKey(session);
    final prompt = '$_mealPrompt\n\nMeal description: $text';
    final body = _buildTextRequest(prompt);
    return _callGemini(session, apiKey, body);
  }

  /// Analyses a meal photo (JPEG bytes) with Gemini 2.0 Flash Vision.
  static Future<AiMealAnalysis> analyzeImage(
    Session session,
    Uint8List imageBytes,
  ) async {
    final apiKey = GeminiConfig.getApiKey(session);
    final base64Image = base64Encode(imageBytes);
    final body = _buildImageRequest(base64Image, _mealPrompt);
    return _callGemini(session, apiKey, body);
  }

  /// Generates a zero-judgment morning recap message for a daily summary.
  static Future<Map<String, dynamic>> generateRecap(
    Session session, {
    required String userName,
    required int totalKcal,
    required double proteinG,
    required double carbsG,
    required double fatG,
    required bool hadAlcohol,
    required int targetKcal,
    bool noDataYet = false,
  }) async {
    final apiKey = GeminiConfig.getApiKey(session);
    final remaining = targetKcal - totalKcal;

    final contextBlock = noDataYet
        ? 'No data logged yesterday — this is a fresh start day.'
        : '''Yesterday's intake: $totalKcal kcal (target: $targetKcal, remaining: $remaining)
Protein: ${proteinG.round()}g | Carbs: ${carbsG.round()}g | Fat: ${fatG.round()}g
Had alcohol: $hadAlcohol''';

    final tipGuidance = StringBuffer();
    if (noDataYet) {
      tipGuidance.writeln(
        '- Since there is no data, focus tips on gentle encouragement to start tracking today.',
      );
    } else {
      if (hadAlcohol) {
        tipGuidance.writeln(
          '- First tip must be about hydration (drinking water after alcohol).',
        );
      }
      if (totalKcal < 800) {
        tipGuidance.writeln(
          '- Intake was light. Mention listening to hunger cues gently.',
        );
      }
      if (totalKcal > 2500) {
        tipGuidance.writeln(
          '- Day was satisfying. Frame it as balance — never "too much" or "excess".',
        );
      }
    }

    final prompt = '''
You are a compassionate morning coach integrated in a zero-judgment nutrition app.
Generate a morning recap JSON object with exactly these fields:
- headline: string — a warm personalised greeting using the user name
- sub_message: string — 1-2 sentences positive summary of yesterday (or fresh start if no data)
- tips: array of exactly 3 objects, each with: icon (single emoji char), title (≤5 words), subtitle (one sentence)

Rules:
- Never use: bad, excess, unhealthy, too much, cheat, guilt, wrong, sinful, overindulge
- All tips must be actionable and encouraging
- If the user name looks French (e.g. Pierre, Marie, Jean, Sophie), respond in French
- Return ONLY valid JSON — no markdown fences, no explanation

$tipGuidance
User: $userName
$contextBlock
''';

    final body = _buildTextRequest(prompt, temperature: 0.5);
    final url = Uri.parse('$_geminiBaseUrl?key=$apiKey');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      session.log(
        'Gemini recap error: ${response.statusCode} ${response.body}',
        level: LogLevel.error,
      );
      throw Exception('AI recap generation failed: ${response.statusCode}');
    }

    final text = _extractText(response.body);
    final cleaned = _stripMarkdownFences(text);
    return jsonDecode(cleaned) as Map<String, dynamic>;
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  static Map<String, dynamic> _buildTextRequest(
    String prompt, {
    double temperature = 0.4,
    int maxOutputTokens = 1024,
  }) {
    return {
      'contents': [
        {
          'parts': [
            {'text': prompt},
          ],
        },
      ],
      'generationConfig': {
        'temperature': temperature,
        'maxOutputTokens': maxOutputTokens,
        // Disable thinking: meal analysis is straightforward structured output;
        // thinking tokens would eat into maxOutputTokens and truncate the JSON.
        'thinkingConfig': {'thinkingBudget': 0},
      },
    };
  }

  static Map<String, dynamic> _buildImageRequest(
    String base64Image,
    String prompt, {
    double temperature = 0.4,
    int maxOutputTokens = 1024,
  }) {
    return {
      'contents': [
        {
          'parts': [
            {
              'inline_data': {
                'mime_type': 'image/jpeg',
                'data': base64Image,
              },
            },
            {'text': prompt},
          ],
        },
      ],
      'generationConfig': {
        'temperature': temperature,
        'maxOutputTokens': maxOutputTokens,
        'thinkingConfig': {'thinkingBudget': 0},
      },
    };
  }

  static Future<AiMealAnalysis> _callGemini(
    Session session,
    String apiKey,
    Map<String, dynamic> body, {
    bool isRetry = false,
  }) async {
    final url = Uri.parse('$_geminiBaseUrl?key=$apiKey');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      session.log(
        'Gemini error: ${response.statusCode} ${response.body}',
        level: LogLevel.error,
      );
      throw Exception('AI analysis failed: ${response.statusCode}');
    }

    final rawText = _extractText(response.body);
    final cleaned = _stripMarkdownFences(rawText);

    Map<String, dynamic> data;
    try {
      data = jsonDecode(cleaned) as Map<String, dynamic>;
    } catch (e) {
      session.log('Gemini JSON parse error: $e\nRaw: $cleaned', level: LogLevel.error);
      if (!isRetry) {
        session.log('Retrying Gemini request...', level: LogLevel.warning);
        return _callGemini(session, apiKey, body, isRetry: true);
      }
      throw Exception('AI returned invalid JSON after retry.');
    }

    if (!_hasRequiredFields(data)) {
      session.log('Gemini missing fields: ${data.keys}', level: LogLevel.error);
      if (!isRetry) {
        session.log('Retrying Gemini request...', level: LogLevel.warning);
        return _callGemini(session, apiKey, body, isRetry: true);
      }
      throw Exception('AI response missing required fields after retry.');
    }

    return AiMealAnalysis(
      name: data['name'] as String,
      emojis: _parseEmojis(data['emojis']),
      proteinG: (data['protein_g'] as num).toDouble(),
      carbsG: (data['carbs_g'] as num).toDouble(),
      fatG: (data['fat_g'] as num).toDouble(),
      aiMessage: data['ai_message'] as String,
      aiTip: data['ai_tip'] as String?,
    );
  }

  /// Parses and validates the emojis field from the AI response.
  /// Returns a non-empty list of 1–3 single emoji characters.
  /// Falls back to ['🍽'] if validation fails.
  static List<String> _parseEmojis(dynamic raw) {
    try {
      final list = (raw as List).cast<String>();
      // Keep only non-empty single-character (grapheme) entries, max 3.
      final valid = list
          .where((e) => e.isNotEmpty)
          .take(3)
          .toList();
      if (valid.isEmpty) return ['🍽'];
      return valid;
    } catch (_) {
      return ['🍽'];
    }
  }

  static String _extractText(String responseBody) {
    final decoded = jsonDecode(responseBody) as Map<String, dynamic>;
    final candidates = decoded['candidates'] as List<dynamic>;
    final content = candidates.first['content'] as Map<String, dynamic>;
    final parts = content['parts'] as List<dynamic>;
    return parts.first['text'] as String;
  }

  static String _stripMarkdownFences(String text) {
    final trimmed = text.trim();
    if (trimmed.startsWith('```')) {
      final endFence = trimmed.lastIndexOf('```');
      if (endFence > 3) {
        final inner = trimmed.substring(trimmed.indexOf('\n') + 1, endFence);
        return inner.trim();
      }
    }
    return trimmed;
  }

  static bool _hasRequiredFields(Map<String, dynamic> data) {
    return data.containsKey('name') &&
        data.containsKey('emojis') &&
        data.containsKey('protein_g') &&
        data.containsKey('carbs_g') &&
        data.containsKey('fat_g') &&
        data.containsKey('ai_message');
  }
}

/// Builds a MealResult from an AiMealAnalysis, calculating calories via
/// NutritionService (the single source of truth).
MealResult buildMealResult({
  required int mealLogId,
  required AiMealAnalysis analysis,
  MealSource source = MealSource.aiEstimated,
}) {
  return MealResult(
    mealLogId: mealLogId,
    name: analysis.name,
    emojis: jsonEncode(analysis.emojis),
    caloriesKcal: NutritionService.calculateCalories(
      proteinG: analysis.proteinG,
      carbsG: analysis.carbsG,
      fatG: analysis.fatG,
    ),
    proteinG: analysis.proteinG,
    carbsG: analysis.carbsG,
    fatG: analysis.fatG,
    aiMessage: analysis.aiMessage,
    aiTip: analysis.aiTip,
    source: source,
  );
}

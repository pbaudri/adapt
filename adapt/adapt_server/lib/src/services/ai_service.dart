import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'nutrition_service.dart';

/// Internal DTO for structured AI meal analysis results.
class AiMealAnalysis {
  const AiMealAnalysis({
    required this.name,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.aiMessage,
    this.aiTip,
  });

  final String name;
  final double proteinG;
  final double carbsG;
  final double fatG;
  final String aiMessage;
  final String? aiTip;
}

/// All AI calls go through this service.
///
/// Uses GPT-4o for both text and photo meal analysis.
/// Zero-judgment language is enforced in all prompts — words like
/// "bad", "excess", "unhealthy", or "too much" are never used.
abstract final class AiService {
  static const _openAiUrl = 'https://api.openai.com/v1/chat/completions';
  static const _model = 'gpt-4o';

  /// System prompt that enforces zero-judgment nutritional analysis.
  static const _systemPrompt = '''
You are a compassionate nutritional assistant. Your role is to estimate the
nutritional content of meals described by the user. You must:

1. Return a JSON object with exactly these keys:
   - name: string — a clean, normalised meal name (e.g. "Big Mac Menu")
   - protein_g: number — protein in grams (positive number)
   - carbs_g: number — carbohydrates in grams (positive number)
   - fat_g: number — fat in grams (positive number)
   - ai_message: string — a short, positive, non-judgmental message about the meal
   - ai_tip: string | null — an optional gentle suggestion for later in the day

2. Language rules — you MUST follow these without exception:
   - Never use words: bad, excess, unhealthy, too much, too many, cheat, guilt, problem
   - Frame all messages in neutral or positive terms
   - Focus on what the user has consumed, not what they should avoid
   - If the meal is calorie-dense, acknowledge it matter-of-factly without judgment
   - Suggestions must be framed as options, never as corrections

3. Examples of acceptable ai_message values:
   - "That is around 1,050 kcal. A lighter dinner keeps your day balanced."
   - "Solid protein and energy for the afternoon ahead."
   - "A hearty breakfast — you have room for lighter meals later if you like."

Return only valid JSON. No markdown fences.
''';

  /// Analyses a text meal description with GPT-4o.
  static Future<AiMealAnalysis> analyzeText(
    Session session,
    String text,
  ) async {
    final apiKey = _getApiKey(session);
    final payload = {
      'model': _model,
      'temperature': 0.3,
      'response_format': {'type': 'json_object'},
      'messages': [
        {'role': 'system', 'content': _systemPrompt},
        {
          'role': 'user',
          'content':
              'Analyse this meal and return nutritional estimates as JSON: $text',
        },
      ],
    };

    return _callOpenAi(session, apiKey, payload);
  }

  /// Analyses a meal photo (JPEG/PNG bytes) with GPT-4o Vision.
  static Future<AiMealAnalysis> analyzeImage(
    Session session,
    Uint8List imageBytes,
  ) async {
    final apiKey = _getApiKey(session);
    final base64Image = base64Encode(imageBytes);
    final payload = {
      'model': _model,
      'temperature': 0.3,
      'response_format': {'type': 'json_object'},
      'messages': [
        {'role': 'system', 'content': _systemPrompt},
        {
          'role': 'user',
          'content': [
            {
              'type': 'text',
              'text': 'Analyse this meal photo and return nutritional estimates as JSON.',
            },
            {
              'type': 'image_url',
              'image_url': {'url': 'data:image/jpeg;base64,$base64Image'},
            },
          ],
        },
      ],
    };

    return _callOpenAi(session, apiKey, payload);
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
  }) async {
    final remaining = targetKcal - totalKcal;

    final userContext = '''
User: $userName
Yesterday's intake: $totalKcal kcal (target: $targetKcal, remaining: $remaining)
Protein: ${proteinG.round()}g | Carbs: ${carbsG.round()}g | Fat: ${fatG.round()}g
Had alcohol: $hadAlcohol
''';

    const recapSystemPrompt = '''
You are a compassionate morning coach. Generate a morning recap JSON with:
- headline: string — a warm personalised greeting using the user's name
- sub_message: string — 1-2 sentence positive summary of yesterday
- tips: array of 3 objects, each with: icon (emoji), title (short), subtitle (one sentence)

Tips must be actionable and positive. Never use judgmental language.
Return only valid JSON. No markdown fences.
''';

    final payload = {
      'model': _model,
      'temperature': 0.5,
      'response_format': {'type': 'json_object'},
      'messages': [
        {'role': 'system', 'content': recapSystemPrompt},
        {'role': 'user', 'content': userContext},
      ],
    };

    final apiKey2 = _getApiKey(session);
    final response = await http.post(
      Uri.parse(_openAiUrl),
      headers: {
        'Authorization': 'Bearer $apiKey2',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode != 200) {
      session.log(
        'OpenAI recap error: ${response.statusCode} ${response.body}',
        level: LogLevel.error,
      );
      throw Exception('AI recap generation failed: ${response.statusCode}');
    }

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    final content =
        (responseBody['choices'] as List).first['message']['content'] as String;
    return jsonDecode(content) as Map<String, dynamic>;
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  static Future<AiMealAnalysis> _callOpenAi(
    Session session,
    String apiKey,
    Map<String, dynamic> payload,
  ) async {
    final response = await http.post(
      Uri.parse(_openAiUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode != 200) {
      session.log(
        'OpenAI error: ${response.statusCode} ${response.body}',
        level: LogLevel.error,
      );
      throw Exception('AI analysis failed: ${response.statusCode}');
    }

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    final content =
        (responseBody['choices'] as List).first['message']['content'] as String;
    final data = jsonDecode(content) as Map<String, dynamic>;

    return AiMealAnalysis(
      name: data['name'] as String,
      proteinG: (data['protein_g'] as num).toDouble(),
      carbsG: (data['carbs_g'] as num).toDouble(),
      fatG: (data['fat_g'] as num).toDouble(),
      aiMessage: data['ai_message'] as String,
      aiTip: data['ai_tip'] as String?,
    );
  }

  static String _getApiKey(Session session) {
    final key = session.passwords['openAiApiKey'];
    if (key == null || key.isEmpty) {
      throw Exception(
        'OpenAI API key not configured. '
        'Add openAiApiKey to config/passwords.yaml.',
      );
    }
    return key;
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

import 'package:serverpod/serverpod.dart';

/// Reads the Gemini API key from Serverpod's passwords config.
///
/// The key must be set in config/passwords.yaml under `shared:` (or per
/// environment) as:
/// ```yaml
/// shared:
///   geminiApiKey: 'YOUR_KEY_HERE'
/// ```
///
/// See also: development.yaml and production.yaml where the gemini section
/// is documented for reference.
abstract final class GeminiConfig {
  static String getApiKey(Session session) {
    final key = session.passwords['geminiApiKey'];

    if (key == null || key.isEmpty || key == 'GEMINI_API_KEY_PLACEHOLDER') {
      throw Exception(
        'Gemini API key is not configured. '
        'Set geminiApiKey in config/passwords.yaml under shared: (or the '
        'relevant environment section).',
      );
    }
    return key;
  }
}

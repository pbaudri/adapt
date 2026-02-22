import 'dart:convert';

import 'package:flutter/material.dart';

/// Renders a parsed emoji JSON array inline as a compact Wrap.
///
/// - [emojisJson] — JSON string like '["🍝","🥗","🍳"]'. Falls back to '🍽' on parse failure.
/// - [nbEmojis] — maximum number of emojis to show (default 3).
/// - [fontSize] — font size for each emoji character (default 18).
class EmojiListWidget extends StatelessWidget {
  const EmojiListWidget({
    super.key,
    required this.emojisJson,
    this.nbEmojis = 3,
    this.fontSize = 18,
  });

  final String? emojisJson;
  final int nbEmojis;
  final double fontSize;

  List<String> _parse() {
    if (emojisJson == null || emojisJson!.isEmpty) {
      debugPrint('EmojiListWidget: fallback used for input: $emojisJson');
      return ['🍽'];
    }
    try {
      final list = (jsonDecode(emojisJson!) as List).cast<String>();
      if (list.isEmpty) {
        debugPrint('EmojiListWidget: fallback used for input: $emojisJson');
        return ['🍽'];
      }
      return list.take(nbEmojis).toList();
    } catch (_) {
      debugPrint('EmojiListWidget: fallback used for input: $emojisJson');
      return ['🍽'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final emojis = _parse();
    return Wrap(
      spacing: 2,
      runSpacing: 0,
      children: emojis
          .map((e) => Text(e, style: TextStyle(fontSize: fontSize)))
          .toList(),
    );
  }
}

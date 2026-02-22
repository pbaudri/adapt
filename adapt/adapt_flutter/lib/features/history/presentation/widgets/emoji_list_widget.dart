import 'dart:convert';

import 'package:flutter/material.dart';

/// Renders a parsed emoji JSON array inline as a compact Row.
///
/// - [emojisJson] — JSON string like '["🍝","🥗","🍳"]'. Falls back to '🍽' on parse failure.
/// - [fontSize] — font size for each emoji character.
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
    try {
      final list = (jsonDecode(emojisJson ?? '["🍽"]') as List).cast<String>();
      if (list.isEmpty) return ['🍽'];
      return list.take(nbEmojis).toList();
    } catch (_) {
      return ['🍽'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final emojis = _parse();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: emojis
          .map((e) => Text(e, style: TextStyle(fontSize: fontSize)))
          .toList(),
    );
  }
}

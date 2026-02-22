import 'dart:convert';

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// List of morning recap tips parsed from [tipsJson].
///
/// JSON format: `[{"icon": "🌿", "title": "...", "subtitle": "..."}]`
/// The `icon` field is an emoji character used as the tip's leading visual.
class RecapTipsSection extends StatelessWidget {
  const RecapTipsSection({super.key, required this.tipsJson});

  final String tipsJson;

  static const _backgroundColors = [
    Color(0xFF1A1A2E),
    Color(0xFF1A2A1A),
    Color(0xFF2A1A1A),
  ];

  @override
  Widget build(BuildContext context) {
    final List<dynamic> tips;
    try {
      tips = jsonDecode(tipsJson) as List<dynamic>;
    } catch (_) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(tips.length, (i) {
        final t = tips[i] as Map<String, dynamic>;
        final icon = t['icon'] as String? ?? '✨';
        final title = t['title'] as String? ?? '';
        final subtitle = t['subtitle'] as String? ?? '';
        final bgColor = _backgroundColors[i % _backgroundColors.length];

        return AdaptRecapTipItem(
          leading: Text(
            icon,
            style: const TextStyle(fontSize: 20),
          ),
          backgroundColor: bgColor,
          title: title,
          subtitle: subtitle,
        );
      }),
    );
  }
}

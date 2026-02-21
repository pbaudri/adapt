import 'dart:convert';

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// List of morning recap tips parsed from [tipsJson].
/// JSON format: `[{"icon": "eco", "title": "...", "subtitle": "..."}]`
class RecapTipsSection extends StatelessWidget {
  const RecapTipsSection({super.key, required this.tipsJson});

  final String tipsJson;

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
      children: tips.map<Widget>((t) {
        final icon = t['icon'] as String? ?? 'star';
        final title = t['title'] as String? ?? '';
        final subtitle = t['subtitle'] as String? ?? '';
        return AdaptRecapTipItem(
          leading: Icon(
            _iconFromName(icon),
            color: AppColors.textPrimary,
            size: 20,
          ),
          backgroundColor: AppColors.primary,
          title: title,
          subtitle: subtitle,
        );
      }).toList(),
    );
  }

  static IconData _iconFromName(String name) {
    switch (name) {
      case 'eco':
        return Icons.eco_rounded;
      case 'fitness':
        return Icons.fitness_center_rounded;
      case 'water':
        return Icons.water_drop_rounded;
      case 'local_bar':
        return Icons.local_bar_rounded;
      default:
        return Icons.star_rounded;
    }
  }
}

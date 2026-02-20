import 'package:flutter/material.dart';

/// All colour constants for the Adapt design system.
///
/// Never reference raw [Color] literals outside this file.
abstract final class AppColors {
  /// `#0A0A0F` — screen backgrounds.
  static const Color background = Color(0xFF0A0A0F);

  /// `#12121A` — cards, inputs, nav bar.
  static const Color surface = Color(0xFF12121A);

  /// `#1C1C26` — selected states, bottom sheets.
  static const Color surfaceElevated = Color(0xFF1C1C26);

  /// `#6C63FF` — CTA buttons, active states, borders.
  static const Color primary = Color(0xFF6C63FF);

  /// `#4A4480` — bar chart inactive bars.
  static const Color primaryMuted = Color(0xFF4A4480);

  /// `#FFFFFF` — main text.
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// `#8A8A9A` — subtitles, placeholders.
  static const Color textSecondary = Color(0xFF8A8A9A);

  /// `#4A4A5A` — divider labels, disabled.
  static const Color textMuted = Color(0xFF4A4A5A);

  /// `#5B9BD5` — protein nutrient dot.
  static const Color protein = Color(0xFF5B9BD5);

  /// `#4CAF7D` — carbs nutrient dot.
  static const Color carbs = Color(0xFF4CAF7D);

  /// `#F5A623` — fat nutrient dot.
  static const Color fat = Color(0xFFF5A623);

  /// `#E05252` — destructive actions.
  static const Color error = Color(0xFFE05252);

  /// `#6C63FF` — left border on insight card.
  static const Color insightBorder = Color(0xFF6C63FF);
}

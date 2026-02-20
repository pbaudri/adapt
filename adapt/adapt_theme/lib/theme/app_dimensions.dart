import 'package:flutter/material.dart';

/// Spacing, radius, and layout constants for the Adapt design system.
///
/// Never hardcode numerical values outside this file.
abstract final class AppDimensions {
  // ── Spacing ──────────────────────────────────────────────────────────────

  /// 4 px — tightest gap.
  static const double spacing4 = 4.0;

  /// 8 px.
  static const double spacing8 = 8.0;

  /// 12 px.
  static const double spacing12 = 12.0;

  /// 16 px.
  static const double spacing16 = 16.0;

  /// 20 px.
  static const double spacing20 = 20.0;

  /// 24 px.
  static const double spacing24 = 24.0;

  /// 32 px.
  static const double spacing32 = 32.0;

  /// 48 px — largest gap.
  static const double spacing48 = 48.0;

  // ── Border Radius ────────────────────────────────────────────────────────

  /// 12 px — small chips, toggles.
  static const double radiusSmall = 12.0;

  /// 16 px — cards, inputs.
  static const double radiusMedium = 16.0;

  /// 24 px — bottom sheets top corners.
  static const double radiusLarge = 24.0;

  /// 999 px — buttons, pills, option rows.
  static const double radiusFull = 999.0;

  // ── Component sizes ──────────────────────────────────────────────────────

  /// 56 px — all primary/secondary buttons.
  static const double buttonHeight = 56.0;

  // ── Padding helpers ──────────────────────────────────────────────────────

  /// 24 px horizontal — screen edge padding.
  static const EdgeInsets screenPadding =
      EdgeInsets.symmetric(horizontal: 24.0);

  /// 16 px all sides — card internal padding.
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
}

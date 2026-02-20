import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Typography constants for the Adapt design system.
///
/// Never define [TextStyle] literals outside this file.
abstract final class AppTextStyles {
  // ── Display ──────────────────────────────────────────────────────────────

  /// 32 px / W800 — onboarding titles.
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// 64 px / W700 — large value in bottom sheets (e.g. "75").
  static const TextStyle displayValue = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.0,
  );

  /// 24 px / W400 — unit next to display value (e.g. "kg").
  static const TextStyle displayValueUnit = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // ── Titles ───────────────────────────────────────────────────────────────

  /// 24 px / W700 — screen titles.
  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// 20 px / W700 — section headings.
  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // ── Body ─────────────────────────────────────────────────────────────────

  /// 16 px / W400 — body text, buttons.
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 14 px / W400 — subtitles, descriptions.
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ── Label ────────────────────────────────────────────────────────────────

  /// 12 px / W600 + letterSpacing — section labels (TODAY, ABOUT YOU).
  static const TextStyle labelCaps = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // ── Links ────────────────────────────────────────────────────────────────

  /// 16 px / W500 / primary — sign in, sync links.
  static const TextStyle textLinkPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    height: 1.5,
  );

  /// 16 px / W500 / error — delete my data.
  static const TextStyle textLinkDestructive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.error,
    height: 1.5,
  );

  /// 14 px / W400 / secondary — "Looks good actually", Cancel.
  static const TextStyle textLinkMuted = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );
}

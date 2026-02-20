# adapt_theme — Design System Instructions

## Context7

Before implementing any widget, fetch the latest Flutter widget documentation:

```
use context7 to get the latest docs for flutter
```

Useful for verifying:
- Latest `ThemeData` API and `ColorScheme` patterns
- `TextTheme` structure in current Flutter versions
- Any deprecated widget APIs to avoid

## Rule #1 — Zero external dependencies

`adapt_theme` has **zero dependency** on `adapt_flutter`, `adapt_server`, or `adapt_client`.
It only depends on Flutter and `flutter_svg`.

If you find yourself importing anything from `adapt_flutter` inside `adapt_theme`, stop — something is wrong.

## Barrel File

Every new widget, class, or constant **must** be exported in `lib/adapt_theme.dart`.

```dart
// lib/adapt_theme.dart — add every new export here
export 'theme/app_theme.dart';
export 'theme/app_colors.dart';
export 'theme/app_text_styles.dart';
export 'theme/app_dimensions.dart';

// buttons
export 'widgets/buttons/adapt_primary_button.dart';
export 'widgets/buttons/adapt_secondary_button.dart';
export 'widgets/buttons/adapt_social_auth_button.dart';
export 'widgets/buttons/adapt_text_link.dart';
export 'widgets/buttons/adapt_action_button.dart';
// ... etc
```

## Adding a Widget — Checklist

1. Check `ARCHITECTURE.md` section 6 — does it already exist?
2. Create the file in the correct subfolder under `lib/widgets/`
3. Add a dartdoc comment documenting all parameters
4. Export it in `lib/adapt_theme.dart`
5. Never hardcode colors or dimensions inside the widget

## Widget Parameters — Standards

```dart
// leading is always Widget — never IconData, never String emoji
AdaptSelectionCard(
  leading: Image.asset('assets/icons/home_cooked.png'),  // ✅
  leading: Icon(Icons.home),                             // ✅
  leading: '🏠',                                          // ❌ never
)

// description is always nullable
AdaptSelectionCard(
  description: 'You control the ingredients.',  // ✅ optional
  description: null,                            // ✅ valid
)

// textStyle always overridable
AdaptActionButton(
  textStyle: AppTextStyles.bodyMedium,  // ✅ default provided, override allowed
)
```

## Colors — AppColors

```dart
// ALWAYS use AppColors constants
color: AppColors.primary           // ✅
color: AppColors.surface           // ✅
color: Color(0xFF6C63FF)           // ❌ never hardcode

// Full palette
AppColors.background       // #0A0A0F — screen backgrounds
AppColors.surface          // #12121A — cards, inputs, nav bar
AppColors.surfaceElevated  // #1C1C26 — selected states, bottom sheets
AppColors.primary          // #6C63FF — CTA buttons, active states
AppColors.primaryMuted     // #4A4480 — inactive bar chart bars
AppColors.textPrimary      // #FFFFFF
AppColors.textSecondary    // #8A8A9A — subtitles, placeholders
AppColors.textMuted        // #4A4A5A — divider labels, disabled
AppColors.protein          // #5B9BD5 — protein nutrient dot
AppColors.carbs            // #4CAF7D — carbs nutrient dot
AppColors.fat              // #F5A623 — fat nutrient dot
AppColors.error            // #E05252 — destructive actions
AppColors.insightBorder    // #6C63FF — left border on insight card
```

## Typography — AppTextStyles

```dart
// ALWAYS use AppTextStyles constants
style: AppTextStyles.displayLarge    // 32px W800 — onboarding titles
style: AppTextStyles.titleLarge      // 24px W700 — screen titles
style: AppTextStyles.titleMedium     // 20px W700 — section headings
style: AppTextStyles.bodyLarge       // 16px W400 — body text, buttons
style: AppTextStyles.bodyMedium      // 14px W400 — subtitles
style: AppTextStyles.labelCaps       // 12px W600 + letterSpacing — TODAY, ABOUT YOU
style: AppTextStyles.displayValue    // 64px W700 — "75" in bottom sheet
style: AppTextStyles.displayValueUnit // 24px W400 — "kg" next to value
style: AppTextStyles.textLinkPrimary      // primary color link
style: AppTextStyles.textLinkDestructive  // error color link — Delete my data
style: AppTextStyles.textLinkMuted        // muted link — Cancel, Looks good actually

// NEVER hardcode
style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)  // ❌
```

## Dimensions — AppDimensions

```dart
// ALWAYS use AppDimensions constants
AppDimensions.spacing4/8/12/16/20/24/32/48
AppDimensions.radiusSmall    // 12px — chips, toggles
AppDimensions.radiusMedium   // 16px — cards, inputs
AppDimensions.radiusLarge    // 24px — bottom sheets top corners
AppDimensions.radiusFull     // 999px — buttons, pills, option rows
AppDimensions.buttonHeight   // 56px — all buttons
AppDimensions.screenPadding  // EdgeInsets.symmetric(horizontal: 24)
AppDimensions.cardPadding    // EdgeInsets.all(16)

// NEVER hardcode
BorderRadius.circular(16)                       // ❌
EdgeInsets.symmetric(horizontal: 24)            // ❌
SizedBox(height: 56)                            // ❌ for button height
```

## Widget States

Every interactive widget must handle all states:

```dart
// AdaptPrimaryButton states
enabled   → AppColors.primary background
disabled  → AppColors.primary with 0.5 opacity
loading   → CircularProgressIndicator, no onTap
```

## Assets

SVG and PNG assets live in `adapt_theme/assets/`.

```
adapt_theme/
└── assets/
    └── icons/
        ├── apple_logo.svg
        ├── google_logo.svg
        └── ...
```

Declare in `adapt_theme/pubspec.yaml`:

```yaml
flutter:
  assets:
    - packages/adapt_theme/assets/icons/
```

## Folder Structure

```
adapt_theme/
├── lib/
│   ├── adapt_theme.dart          # Barrel file — single export entry point
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_dimensions.dart
│   └── widgets/
│       ├── buttons/
│       │   ├── adapt_primary_button.dart
│       │   ├── adapt_secondary_button.dart
│       │   ├── adapt_social_auth_button.dart
│       │   ├── adapt_text_link.dart
│       │   └── adapt_action_button.dart
│       ├── inputs/
│       │   ├── adapt_text_field.dart
│       │   ├── adapt_multiline_text_field.dart
│       │   ├── adapt_editable_field.dart
│       │   ├── adapt_unit_toggle.dart
│       │   └── adapt_password_strength_bar.dart
│       ├── cards/
│       │   ├── adapt_selection_card.dart
│       │   ├── adapt_option_row.dart
│       │   ├── adapt_info_card.dart
│       │   ├── adapt_info_form_card.dart
│       │   ├── adapt_insight_card.dart
│       │   ├── adapt_profile_row.dart
│       │   ├── adapt_nutrition_row.dart
│       │   ├── adapt_preference_toggle_row.dart
│       │   ├── adapt_auto_calc_card.dart
│       │   ├── meal_list_item.dart
│       │   └── adapt_recap_tip_item.dart
│       ├── chips/
│       │   ├── nutrient_chip.dart
│       │   └── adapt_quick_add_chip.dart
│       ├── sheets/
│       │   └── adapt_bottom_sheet.dart
│       ├── navigation/
│       │   ├── adapt_back_button.dart
│       │   └── adapt_bottom_nav_bar.dart
│       ├── indicators/
│       │   ├── adapt_step_indicator.dart
│       │   └── adapt_large_value_display.dart
│       ├── layout/
│       │   ├── adapt_page_header.dart
│       │   ├── adapt_section_title.dart
│       │   ├── adapt_divider_with_text.dart
│       │   ├── adapt_icon_hero.dart
│       │   ├── adapt_quantity_selector.dart
│       │   └── adapt_week_navigator.dart
│       └── media/
│           ├── adapt_camera_preview.dart
│           └── adapt_bar_chart.dart
├── assets/
│   └── icons/
└── pubspec.yaml
```
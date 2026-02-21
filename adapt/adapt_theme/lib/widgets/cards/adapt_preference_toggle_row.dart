import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A settings row with a label, optional subtitle, and a [Switch].
///
/// - [label] — primary setting name.
/// - [subtitle] — optional explanatory text below the label.
/// - [value] — current toggle state.
/// - [onChanged] — called when the user flips the switch.
class AdaptPreferenceToggleRow extends StatelessWidget {
  const AdaptPreferenceToggleRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing16,
        vertical: AppDimensions.spacing12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: AppTextStyles.bodyLarge),
                if (subtitle != null) ...[
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(subtitle!, style: AppTextStyles.bodyMedium),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.textPrimary,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: AppColors.textMuted,
            inactiveTrackColor: AppColors.surfaceElevated,
          ),
        ],
      ),
    );
  }
}

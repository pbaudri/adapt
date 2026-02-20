import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A labelled field with an always-visible border and pencil icon,
/// signalling that it is editable.
///
/// Tapping anywhere on the widget fires [onTap] (e.g. to open a picker sheet).
///
/// - [label] — left-side field name (e.g. "Weight").
/// - [controller] — controls the displayed value.
/// - [onTap] — called when the user taps the field.
/// - [enabled] — when `false`, renders at half opacity.
class AdaptEditableField extends StatelessWidget {
  const AdaptEditableField({
    super.key,
    required this.label,
    required this.controller,
    required this.onTap,
    this.enabled = true,
  });

  final String label;
  final TextEditingController controller;
  final VoidCallback onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          height: AppDimensions.buttonHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing16,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: Border.all(color: AppColors.primary, width: 1.5),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              Expanded(
                child: Text(
                  controller.text,
                  style: AppTextStyles.bodyLarge,
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing8),
              const Icon(
                Icons.edit_outlined,
                color: AppColors.textSecondary,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

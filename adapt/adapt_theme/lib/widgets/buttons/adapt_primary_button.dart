import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Primary CTA button with enabled, disabled, and loading states.
///
/// - [label] — button text.
/// - [onTap] — callback fired when tapped.
/// - [isLoading] — shows a [CircularProgressIndicator] and blocks interaction.
/// - [isDisabled] — renders at half opacity and blocks interaction.
/// - [trailing] — optional widget shown to the right of the label (e.g. an arrow icon).
class AdaptPrimaryButton extends StatelessWidget {
  const AdaptPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    this.trailing,
  });

  final String label;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isDisabled;
  final Widget? trailing;

  bool get _interactive => !isLoading && !isDisabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: SizedBox(
        height: AppDimensions.buttonHeight,
        width: double.infinity,
        child: Material(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            onTap: _interactive ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.textPrimary,
                      ),
                    )
                  else ...[
                    Text(label, style: AppTextStyles.bodyLarge),
                    if (trailing != null) ...[
                      const SizedBox(width: AppDimensions.spacing8),
                      trailing!,
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Secondary outlined button.
///
/// - [label] — button text.
/// - [onTap] — callback fired when tapped.
/// - [isDisabled] — renders at half opacity and blocks interaction.
class AdaptSecondaryButton extends StatelessWidget {
  const AdaptSecondaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: SizedBox(
        height: AppDimensions.buttonHeight,
        width: double.infinity,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            onTap: isDisabled ? null : onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                border: Border.all(color: AppColors.primary, width: 1.5),
              ),
              alignment: Alignment.center,
              child: Text(
                label,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

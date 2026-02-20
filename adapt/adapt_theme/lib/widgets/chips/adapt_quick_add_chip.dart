import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A tappable pill chip used for quick-add actions (e.g. add a drink type).
///
/// - [leading] — widget shown to the left of the label (icon, image, etc.).
/// - [label] — chip text.
/// - [onTap] — called when the chip is tapped.
/// - [isDisabled] — renders at half opacity and blocks interaction.
class AdaptQuickAddChip extends StatelessWidget {
  const AdaptQuickAddChip({
    super.key,
    required this.leading,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
  });

  final Widget leading;
  final String label;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing12,
            vertical: AppDimensions.spacing8,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              leading,
              const SizedBox(width: AppDimensions.spacing8),
              Text(label, style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

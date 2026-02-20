import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Tappable selection card used in onboarding (eating style, goal, etc.).
///
/// - [leading] — widget shown on the left (icon, image, emoji wrapped in Text, etc.).
/// - [title] — primary label.
/// - [description] — optional subtitle below the title.
/// - [isSelected] — highlights the card with a primary-colour border.
/// - [onTap] — callback fired when tapped.
class AdaptSelectionCard extends StatelessWidget {
  const AdaptSelectionCard({
    super.key,
    required this.leading,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.description,
  });

  final Widget leading;
  final String title;
  final String? description;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: AppDimensions.cardPadding,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceElevated : AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: AppDimensions.spacing16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodyLarge),
                  if (description != null) ...[
                    const SizedBox(height: AppDimensions.spacing4),
                    Text(description!, style: AppTextStyles.bodyMedium),
                  ],
                ],
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.textMuted,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: AppColors.textPrimary,
                      size: 14,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

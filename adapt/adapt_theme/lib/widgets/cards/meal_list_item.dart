import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A tappable list item representing a logged meal.
///
/// - [leading] — widget shown on the left (emoji in a container, image, etc.).
/// - [name] — meal name (e.g. "Big Mac Menu").
/// - [calories] — calorie count as an integer.
/// - [calorieLabelColor] — optional color for the calorie text. Defaults to `AppColors.textPrimary`.
/// - [onTap] — called when the row is tapped.
class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.leading,
    required this.name,
    required this.calories,
    required this.onTap,
    this.calorieLabelColor,
  });

  final Widget leading;
  final String name;
  final int calories;
  final Color? calorieLabelColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing16,
          vertical: AppDimensions.spacing12,
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: AppDimensions.spacing12),
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.bodyLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$calories',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: calorieLabelColor,
                  ),
                ),
                Text(
                  'kcal',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: calorieLabelColor,
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppDimensions.spacing8),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

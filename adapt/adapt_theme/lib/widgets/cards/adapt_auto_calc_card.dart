import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Static hint card explaining that calories are calculated automatically.
///
/// Place below nutrition input fields to clarify why calories are not editable.
class AdaptAutoCalcCard extends StatelessWidget {
  const AdaptAutoCalcCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppDimensions.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(
          color: AppColors.surfaceElevated,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lock_outline,
            color: AppColors.textSecondary,
            size: 18,
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Text(
              'Calories update automatically based on your macros.',
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

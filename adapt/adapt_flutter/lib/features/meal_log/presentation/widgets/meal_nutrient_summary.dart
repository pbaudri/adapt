import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Horizontal row of nutrient chips shown on the meal result screen.
class MealNutrientSummary extends StatelessWidget {
  const MealNutrientSummary({
    super.key,
    required this.calories,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
  });

  final int calories;
  final double proteinG;
  final double carbsG;
  final double fatG;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$calories',
              style: AppTextStyles.titleLarge,
            ),
            const SizedBox(width: AppDimensions.spacing4),
            Text('kcal', style: AppTextStyles.bodyMedium),
          ],
        ),
        const SizedBox(height: AppDimensions.spacing12),
        Row(
          children: [
            Expanded(
              child: NutrientChip(
                label: 'Protein',
                value: '${proteinG.round()}g',
                color: AppColors.protein,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            Expanded(
              child: NutrientChip(
                label: 'Carbs',
                value: '${carbsG.round()}g',
                color: AppColors.carbs,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            Expanded(
              child: NutrientChip(
                label: 'Fat',
                value: '${fatG.round()}g',
                color: AppColors.fat,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

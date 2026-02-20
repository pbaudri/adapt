import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';

/// Daily calorie summary card with insight and quick drink log shortcut.
class HomeDailyCard extends StatelessWidget {
  const HomeDailyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdaptInsightCard(
          title: '1 847 kcal today',
          subtitle:
              'You have around 550 kcal left. A balanced dinner and you are on track.',
        ),
        const SizedBox(height: AppDimensions.spacing12),
        Row(
          children: [
            Expanded(
              child: NutrientChip(
                label: 'Protein',
                value: '82g',
                color: AppColors.protein,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            Expanded(
              child: NutrientChip(
                label: 'Carbs',
                value: '210g',
                color: AppColors.carbs,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            Expanded(
              child: NutrientChip(
                label: 'Fat',
                value: '64g',
                color: AppColors.fat,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacing12),
        AdaptQuickAddChip(
          leading: const Icon(
            Icons.local_bar_rounded,
            color: AppColors.primary,
            size: 16,
          ),
          label: 'Log drinks',
          onTap: () => context.push(AppRoutes.drinks),
        ),
      ],
    );
  }
}

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';

/// Day detail section showing meals and drinks for the selected day.
class HistoryDaySection extends StatelessWidget {
  const HistoryDaySection({super.key, required this.dayLabel});

  final String dayLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdaptSectionTitle(label: dayLabel),
        const SizedBox(height: AppDimensions.spacing12),
        AdaptInfoCard(
          child: Column(
            children: [
              MealListItem(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                  ),
                  child: const Center(
                    child: Text('🥗', style: TextStyle(fontSize: 20)),
                  ),
                ),
                name: 'Caesar Salad',
                calories: 420,
                onTap: () => context.push(AppRoutes.mealResult),
              ),
              const Divider(),
              MealListItem(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                  ),
                  child: const Center(
                    child: Text('🍕', style: TextStyle(fontSize: 20)),
                  ),
                ),
                name: 'Margherita Pizza (2 slices)',
                calories: 580,
                onTap: () => context.push(AppRoutes.mealResult),
              ),
              const Divider(),
              MealListItem(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                  ),
                  child: const Center(
                    child: Text('🍷', style: TextStyle(fontSize: 20)),
                  ),
                ),
                name: '2× Wine',
                calories: 240,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

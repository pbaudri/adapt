import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';

/// Today's logged meals list.
class HomeMealList extends StatelessWidget {
  const HomeMealList({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptInfoCard(
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
                child: Text('🥣', style: TextStyle(fontSize: 20)),
              ),
            ),
            name: 'Greek Yogurt Bowl',
            calories: 280,
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
                child: Text('🍔', style: TextStyle(fontSize: 20)),
              ),
            ),
            name: 'Big Mac Menu',
            calories: 1040,
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
                child: Text('☕', style: TextStyle(fontSize: 20)),
              ),
            ),
            name: 'Flat White',
            calories: 120,
            onTap: () => context.push(AppRoutes.mealResult),
          ),
        ],
      ),
    );
  }
}

import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../providers/home_provider.dart';

/// Today's logged meals list.
class HomeMealList extends ConsumerWidget {
  const HomeMealList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeDataProvider);

    return homeAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const SizedBox.shrink(),
      data: (data) {
        if (data.meals.isEmpty) {
          return Center(
            child: Text(
              'No meals logged yet. Tap + to add one.',
              style: AppTextStyles.bodyMedium,
            ),
          );
        }
        return AdaptInfoCard(
          child: Column(
            children: [
              for (var i = 0; i < data.meals.length; i++) ...[
                if (i > 0) const Divider(),
                _MealItem(meal: data.meals[i]),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _MealItem extends StatelessWidget {
  const _MealItem({required this.meal});

  final MealLog meal;

  @override
  Widget build(BuildContext context) {
    return MealListItem(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
        child: const Center(
          child: Text('🍽', style: TextStyle(fontSize: 20)),
        ),
      ),
      name: meal.rawInput ?? 'Meal',
      calories: 0,
      onTap: () => context.push(AppRoutes.mealResult),
    );
  }
}

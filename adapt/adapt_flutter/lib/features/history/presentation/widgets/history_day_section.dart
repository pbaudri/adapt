import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../providers/history_provider.dart';

/// Day detail section showing meals and drinks for the selected day.
class HistoryDaySection extends ConsumerWidget {
  const HistoryDaySection({
    super.key,
    required this.dayLabel,
    required this.date,
  });

  final String dayLabel;
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayAsync = ref.watch(dayDetailProvider(date));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdaptSectionTitle(label: dayLabel),
        const SizedBox(height: AppDimensions.spacing12),
        dayAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text(
            'No data for this day.',
            style: AppTextStyles.bodyMedium,
          ),
          data: (detail) {
            if (detail.meals.isEmpty && detail.drinks.isEmpty) {
              return Center(
                child: Text(
                  'Nothing logged on this day.',
                  style: AppTextStyles.bodyMedium,
                ),
              );
            }

            // Build a map for O(1) lookup of MealResult by mealLogId.
            final resultByLogId = {
              for (final r in detail.mealResults) r.mealLogId: r,
            };

            return AdaptInfoCard(
              child: Column(
                children: [
                  for (var i = 0; i < detail.meals.length; i++) ...[
                    if (i > 0) const Divider(),
                    Builder(
                      builder: (context) {
                        final meal = detail.meals[i];
                        final result = resultByLogId[meal.id];
                        return MealListItem(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.surfaceElevated,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusSmall,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '🍽',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          name: result?.name ?? meal.rawInput ?? 'Meal',
                          calories: result?.caloriesKcal ?? 0,
                          onTap: result == null
                              ? () {}
                              : () => context.push(
                                    AppRoutes.mealResult,
                                    extra: result,
                                  ),
                        );
                      },
                    ),
                  ],
                  for (var drink in detail.drinks) ...[
                    const Divider(),
                    MealListItem(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceElevated,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusSmall,
                          ),
                        ),
                        child: const Center(
                          child: Text('🍷', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      name:
                          '${drink.quantity}× ${drink.drinkType.name[0].toUpperCase()}${drink.drinkType.name.substring(1)}',
                      calories: drink.caloriesKcal,
                      onTap: () {},
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

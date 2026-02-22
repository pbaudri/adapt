import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import 'emoji_list_widget.dart';

/// A tappable day row in the history breakdown list.
///
/// Shows the day label, meal emojis and kcal. When [isSelected] is true,
/// the expandable detail (meals + drinks) is shown below the row.
class HistoryDayRow extends StatelessWidget {
  const HistoryDayRow({
    super.key,
    required this.summary,
    required this.isSelected,
    required this.selectedDetail,
    required this.onTap,
  });

  final DailySummary summary;
  final bool isSelected;
  final DayDetail? selectedDetail;
  final VoidCallback onTap;

  static String _dayLabel(DateTime date) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return '${weekdays[date.weekday - 1]} ${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Day row ─────────────────────────────────────────────────────────
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacing16,
              vertical: AppDimensions.spacing12,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.surfaceElevated
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _dayLabel(summary.date),
                        style: AppTextStyles.titleMedium,
                      ),
                      const SizedBox(height: AppDimensions.spacing4),
                      EmojiListWidget(
                        emojisJson: summary.mealEmojis,
                        nbEmojis: 5,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${summary.totalKcal} kcal',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(width: AppDimensions.spacing8),
                Icon(
                  isSelected
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textMuted,
                  size: 20,
                ),
              ],
            ),
          ),
        ),

        // ── Expanded detail ──────────────────────────────────────────────────
        if (isSelected) _ExpandedDetail(detail: selectedDetail),
      ],
    );
  }
}

class _ExpandedDetail extends StatelessWidget {
  const _ExpandedDetail({required this.detail});

  final DayDetail? detail;

  @override
  Widget build(BuildContext context) {
    if (detail == null) {
      return const Padding(
        padding: EdgeInsets.all(AppDimensions.spacing16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final d = detail!;
    final resultByLogId = {
      for (final r in d.mealResults) r.mealLogId: r,
    };

    final confirmedMeals = d.meals.where((m) => !m.estimated).toList()
      ..sort((a, b) => b.loggedAt.compareTo(a.loggedAt));

    if (confirmedMeals.isEmpty && d.drinks.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing16,
          vertical: AppDimensions.spacing12,
        ),
        child: Text(
          'Nothing logged this day.',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
        ),
      );
    }

    final hasBoth = confirmedMeals.isNotEmpty && d.drinks.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.spacing8,
        right: AppDimensions.spacing8,
        bottom: AppDimensions.spacing12,
      ),
      child: AdaptInfoCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Meals
            for (var i = 0; i < confirmedMeals.length; i++) ...[
              if (i > 0) const Divider(),
              Builder(
                builder: (context) {
                  final meal = confirmedMeals[i];
                  final result = resultByLogId[meal.id];
                  return MealListItem(
                    leading: _EmojiLeading(
                      child: EmojiListWidget(
                        emojisJson: result?.emojis,
                        fontSize: 16,
                      ),
                    ),
                    name: result?.name ?? meal.rawInput ?? 'Meal',
                    calories: result?.caloriesKcal ?? 0,
                    calorieLabelColor: AppColors.textSecondary,
                    onTap: result == null
                        ? () {}
                        : () =>
                              context.push(AppRoutes.mealResult, extra: result),
                  );
                },
              ),
            ],

            // Labeled divider between meals and drinks
            if (hasBoth)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimensions.spacing4),
                child: AdaptDividerWithText(label: 'Drinks'),
              ),

            // Drinks
            for (var i = 0; i < d.drinks.length; i++) ...[
              if (i > 0) const Divider(),
              Builder(
                builder: (context) {
                  final drink = d.drinks[i];
                  final qty = drink.quantity;
                  return MealListItem(
                    leading: _EmojiLeading(
                      child: Text(
                        _ExpandedDetail._drinkEmojiFor(drink.drinkType),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    name:
                        '$qty ${qty == 1 ? 'glass' : 'glasses'} of ${_ExpandedDetail._drinkLabelFor(drink.drinkType)}',
                    calories: drink.caloriesKcal,
                    calorieLabelColor: AppColors.textSecondary,
                    onTap: () {},
                  );
                },
              ),
            ],

            // Total kcal
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.spacing12,
                right: AppDimensions.spacing16,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total: ${d.summary.totalKcal} kcal',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _drinkEmojiFor(DrinkType type) => switch (type) {
    DrinkType.beer => '🍺',
    DrinkType.wine => '🍷',
    DrinkType.champagne => '🥂',
    DrinkType.cocktail => '🍹',
    DrinkType.spirit => '🥃',
    DrinkType.shooter => '🥃',
    DrinkType.liqueur => '🍶',
    DrinkType.longDrink => '🧃',
    DrinkType.hardSeltzer => '💧',
    DrinkType.other => '➕',
  };

  static String _drinkLabelFor(DrinkType type) => switch (type) {
    DrinkType.beer => 'Beer',
    DrinkType.wine => 'Wine',
    DrinkType.champagne => 'Champagne',
    DrinkType.cocktail => 'Cocktail',
    DrinkType.spirit => 'Spirit',
    DrinkType.shooter => 'Shooter',
    DrinkType.liqueur => 'Liqueur',
    DrinkType.longDrink => 'Long drink',
    DrinkType.hardSeltzer => 'Hard seltzer',
    DrinkType.other => 'Other',
  };
}

class _EmojiLeading extends StatelessWidget {
  const _EmojiLeading({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Center(child: child),
    );
  }
}

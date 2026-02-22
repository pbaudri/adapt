import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../history/presentation/widgets/emoji_list_widget.dart';
import '../providers/home_provider.dart';

/// Interleaved list of today's meals and drinks, ordered most-recent first.
class HomeMealList extends ConsumerWidget {
  const HomeMealList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeDataProvider);

    return homeAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const SizedBox.shrink(),
      data: (data) {
        final resultByLogId = {
          for (final r in data.mealResults) r.mealLogId: r,
        };

        // Build a unified list of items sorted by loggedAt descending.
        final items = <_FeedItem>[
          for (final meal in data.meals)
            _FeedItem.meal(meal, resultByLogId[meal.id]),
          for (final drink in data.todayDrinks) _FeedItem.drink(drink),
        ]..sort((a, b) => b.loggedAt.compareTo(a.loggedAt));

        if (items.isEmpty) {
          return Center(
            child: Text(
              'Nothing logged yet today.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          );
        }

        return AdaptInfoCard(
          child: Column(
            children: [
              for (var i = 0; i < items.length; i++) ...[
                if (i > 0) const Divider(),
                items[i].when(
                  meal: (meal, result) => _MealRow(
                    meal: meal,
                    result: result,
                    onTap: result != null
                        ? () =>
                              context.push(AppRoutes.mealResult, extra: result)
                        : null,
                  ),
                  drink: (drink) => _DrinkRow(drink: drink),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

// ── Domain helpers ─────────────────────────────────────────────────────────

sealed class _FeedItem {
  const _FeedItem();

  factory _FeedItem.meal(MealLog meal, MealResult? result) = _MealFeedItem;

  factory _FeedItem.drink(DrinkLog drink) = _DrinkFeedItem;

  DateTime get loggedAt;

  T when<T>({
    required T Function(MealLog meal, MealResult? result) meal,
    required T Function(DrinkLog drink) drink,
  });
}

final class _MealFeedItem extends _FeedItem {
  const _MealFeedItem(this.meal, this.result);
  final MealLog meal;
  final MealResult? result;

  @override
  DateTime get loggedAt => meal.loggedAt;

  @override
  T when<T>({
    required T Function(MealLog meal, MealResult? result) meal,
    required T Function(DrinkLog drink) drink,
  }) => meal(this.meal, result);
}

final class _DrinkFeedItem extends _FeedItem {
  const _DrinkFeedItem(this.drink);
  final DrinkLog drink;

  @override
  DateTime get loggedAt => drink.loggedAt;

  @override
  T when<T>({
    required T Function(MealLog meal, MealResult? result) meal,
    required T Function(DrinkLog drink) drink,
  }) => drink(this.drink);
}

// ── Row widgets ────────────────────────────────────────────────────────────

class _MealRow extends StatelessWidget {
  const _MealRow({
    required this.meal,
    required this.result,
    required this.onTap,
  });

  final MealLog meal;
  final MealResult? result;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MealListItem(
      leading: Container(
        width: 56,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
        child: Center(
          child: EmojiListWidget(
            emojisJson: result?.emojis,
            nbEmojis: 1,
            fontSize: 16,
          ),
        ),
      ),
      name: result?.name ?? meal.rawInput ?? 'Meal',
      calories: result?.caloriesKcal ?? 0,
      onTap: onTap ?? () {},
    );
  }
}

class _DrinkRow extends StatelessWidget {
  const _DrinkRow({required this.drink});

  final DrinkLog drink;

  static String _emojiFor(DrinkType type) => switch (type) {
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

  static String _labelFor(DrinkType type) => switch (type) {
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

  @override
  Widget build(BuildContext context) {
    final qty = drink.quantity;
    final label =
        '$qty ${qty == 1 ? 'glass' : 'glasses'} of ${_labelFor(drink.drinkType)}';

    return MealListItem(
      leading: Container(
        width: 56,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
        child: Center(
          child: Text(
            _emojiFor(drink.drinkType),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      name: label,
      calories: drink.caloriesKcal,
      onTap: () {},
    );
  }
}

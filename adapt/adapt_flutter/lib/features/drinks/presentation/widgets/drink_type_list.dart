import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Grid of drink type option rows built from server-side reference data.
class DrinkTypeList extends StatelessWidget {
  const DrinkTypeList({
    super.key,
    required this.references,
    required this.selected,
    required this.onSelect,
  });

  final List<DrinkReference> references;
  final DrinkType? selected;
  final ValueChanged<DrinkType> onSelect;

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
    return SizedBox(
      height:
          (((references.length / 2).ceil()) * (AppDimensions.spacing8 + 72.0)) +
          AppDimensions.spacing8,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimensions.spacing8,
        mainAxisSpacing: AppDimensions.spacing8,
        childAspectRatio: 1.5,
        children: references
            .map(
              (ref) => AdaptOptionRow(
                leading: Text(
                  _emojiFor(ref.drinkType),
                  style: const TextStyle(fontSize: 20),
                ),
                title: _labelFor(ref.drinkType),
                subtitle: ref.servingDescription != null
                    ? '${ref.caloriesPerUnit} kcal · ${ref.servingDescription}'
                    : '${ref.caloriesPerUnit} kcal',
                isSelected: selected == ref.drinkType,
                onTap: () => onSelect(ref.drinkType),
              ),
            )
            .toList(),
      ),
    );
  }
}

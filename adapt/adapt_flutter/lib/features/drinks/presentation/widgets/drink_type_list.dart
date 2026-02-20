import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Grid of drink type option rows for the drinks logging screen.
class DrinkTypeList extends StatelessWidget {
  const DrinkTypeList({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  final String? selected;
  final ValueChanged<String> onSelect;

  static const _drinks = [
    (value: 'beer', label: 'Beer', icon: '🍺', calories: 150),
    (value: 'wine', label: 'Wine', icon: '🍷', calories: 120),
    (value: 'champagne', label: 'Champagne', icon: '🥂', calories: 90),
    (value: 'cocktail', label: 'Cocktail', icon: '🍹', calories: 180),
    (value: 'whisky', label: 'Whisky', icon: '🥃', calories: 70),
    (value: 'long_drink', label: 'Long drink', icon: '🧃', calories: 200),
    (value: 'hard_seltzer', label: 'Hard seltzer', icon: '🫧', calories: 100),
    (value: 'other', label: 'Other', icon: '🍶', calories: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _drinks
          .map(
            (d) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spacing8),
              child: AdaptOptionRow(
                leading: Text(
                  d.icon,
                  style: const TextStyle(fontSize: 20),
                ),
                title: d.label,
                subtitle: d.calories != null ? '${d.calories} kcal / glass' : null,
                isSelected: selected == d.value,
                onTap: () => onSelect(d.value),
              ),
            ),
          )
          .toList(),
    );
  }
}

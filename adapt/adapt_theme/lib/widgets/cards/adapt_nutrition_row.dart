import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// An editable row showing a nutrient label, a colour dot, and an underline field.
///
/// - [label] — nutrient name (e.g. "Protein").
/// - [value] — initial value displayed in the text field (e.g. "28").
/// - [color] — dot colour (use [AppColors.protein], [AppColors.carbs], or [AppColors.fat]).
/// - [controller] — text editing controller for the value field.
/// - [onChanged] — called on every keystroke with the raw string value.
class AdaptNutritionRow extends StatelessWidget {
  const AdaptNutritionRow({
    super.key,
    required this.label,
    required this.color,
    required this.controller,
    this.onChanged,
  });

  final String label;
  final Color color;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing16,
        vertical: AppDimensions.spacing12,
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Text(label, style: AppTextStyles.bodyLarge),
          ),
          SizedBox(
            width: 80,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.end,
              style: AppTextStyles.bodyLarge,
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.spacing4,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textMuted,
                    width: 1,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.spacing4),
          Text(
            'g',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Segmented toggle used for unit/category selection (kg/lbs, cm/ft, Male/Female).
///
/// - [options] — list of labels to display as segments.
/// - [selected] — currently selected label; must be one of [options].
/// - [onChanged] — called with the newly selected label.
class AdaptUnitToggle extends StatelessWidget {
  const AdaptUnitToggle({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<String> options;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Row(
        children: options.map((option) {
          final isSelected = option == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.surfaceElevated
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall - 2),
                ),
                alignment: Alignment.center,
                child: Text(
                  option,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

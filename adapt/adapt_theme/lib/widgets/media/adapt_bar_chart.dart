import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Data model for a single bar in [AdaptBarChart].
class DayBarData {
  const DayBarData({required this.label, required this.value});

  /// Short day label (e.g. "Mon").
  final String label;

  /// Value for this day (e.g. total kcal).
  final double value;
}

/// A horizontal bar chart showing one bar per day, used in the history screen.
///
/// - [data] — list of [DayBarData] entries (typically 7 days).
/// - [selectedIndex] — index of the highlighted bar; `-1` means none.
/// - [maxBarHeight] — maximum rendered height of a bar in logical pixels.
class AdaptBarChart extends StatelessWidget {
  const AdaptBarChart({
    super.key,
    required this.data,
    this.selectedIndex = -1,
    this.maxBarHeight = 120,
  });

  final List<DayBarData> data;
  final int selectedIndex;
  final double maxBarHeight;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox.shrink();

    final maxValue = data.map((d) => d.value).reduce(max);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(data.length, (index) {
        final item = data[index];
        final isSelected = index == selectedIndex;
        final ratio = maxValue > 0 ? item.value / maxValue : 0.0;
        final barHeight = (ratio * maxBarHeight).clamp(4.0, maxBarHeight);

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacing4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isSelected && item.value > 0)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppDimensions.spacing4,
                    ),
                    child: Text(
                      '${item.value.round()}',
                      style: AppTextStyles.labelCaps.copyWith(
                        color: AppColors.primary,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  height: barHeight,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.primaryMuted,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing8),
                Text(item.label, style: AppTextStyles.labelCaps),
              ],
            ),
          ),
        );
      }),
    );
  }
}

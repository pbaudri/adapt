import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Data model for a single bar in [AdaptBarChart].
class DayBarData {
  const DayBarData({
    required this.label,
    required this.heightFactor,
    this.value = 0,
    this.hadAlcohol = false,
  });

  /// Short day label (e.g. "Mon").
  final String label;

  /// Pre-normalised height factor in [0.0, 1.0].
  /// The bar will be rendered at [heightFactor] × [AdaptBarChart.maxBarHeight].
  final double heightFactor;

  /// Raw value shown as a label when the bar is selected (e.g. total kcal).
  /// Pass 0 to suppress the label.
  final double value;

  /// When true, a 🍷 badge is shown below the day label.
  final bool hadAlcohol;
}

/// A horizontal bar chart showing one bar per day, used in the history screen.
///
/// - [data] — list of [DayBarData] entries (typically 7 days).
/// - [selectedIndex] — index of the highlighted bar; `-1` means none.
/// - [onBarTap] — called with the tapped bar's index when a bar is tapped.
/// - [maxBarHeight] — maximum rendered height of a bar in logical pixels.
class AdaptBarChart extends StatelessWidget {
  const AdaptBarChart({
    super.key,
    required this.data,
    this.selectedIndex = -1,
    this.onBarTap,
    this.maxBarHeight = 120,
  });

  final List<DayBarData> data;
  final int selectedIndex;
  final ValueChanged<int>? onBarTap;
  final double maxBarHeight;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(data.length, (index) {
        final item = data[index];
        final isSelected = index == selectedIndex;
        final barHeight =
            (item.heightFactor * maxBarHeight).clamp(0.0, maxBarHeight);

        return Expanded(
          child: GestureDetector(
            onTap: onBarTap != null ? () => onBarTap!(index) : null,
            behavior: HitTestBehavior.opaque,
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
                  if (item.hadAlcohol)
                    const Text('🍷', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'dart:math';

import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/date_formatter.dart';

/// Week bar chart with navigation for the history screen.
class HistoryChartSection extends StatelessWidget {
  const HistoryChartSection({
    super.key,
    required this.weekLabel,
    required this.selectedIndex,
    required this.summaries,
    required this.canGoNext,
    required this.onPrevious,
    required this.onNext,
    required this.onBarTap,
  });

  final String weekLabel;
  final int selectedIndex;
  final List<DailySummary> summaries;
  final bool canGoNext;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ValueChanged<int> onBarTap;

  @override
  Widget build(BuildContext context) {
    // summaries already has exactly 7 rows (server fills zeros for missing days).
    // Use a minimum reference of 2000 kcal so bars are proportional on low-data weeks.
    final maxKcal = summaries.fold(0, (acc, s) => max(acc, s.totalKcal));
    final weekMaxKcal = max(maxKcal, 2000);

    final barData = List.generate(summaries.length, (i) {
      final s = summaries[i];
      final heightFactor =
          s.totalKcal == 0 ? 0.05 : s.totalKcal / weekMaxKcal;
      return DayBarData(
        label: DateFormatter.dayShort(s.date),
        heightFactor: heightFactor,
        value: s.totalKcal.toDouble(),
        hadAlcohol: s.hadAlcohol,
      );
    });

    return AdaptInfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdaptWeekNavigator(
            label: weekLabel,
            canGoNext: canGoNext,
            onPrevious: onPrevious,
            onNext: onNext,
          ),
          const SizedBox(height: AppDimensions.spacing16),
          AdaptBarChart(
            data: barData,
            selectedIndex: selectedIndex,
            onBarTap: onBarTap,
          ),
        ],
      ),
    );
  }
}

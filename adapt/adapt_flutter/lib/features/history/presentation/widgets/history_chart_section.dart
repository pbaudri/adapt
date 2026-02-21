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
    required this.onPrevious,
    required this.onNext,
    required this.onBarTap,
  });

  final String weekLabel;
  final int selectedIndex;
  final List<DailySummary> summaries;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ValueChanged<int> onBarTap;

  @override
  Widget build(BuildContext context) {
    // Build bar data from real summaries (7 days Mon–Sun).
    // Fill missing days with 0 kcal.
    final barData = List.generate(7, (i) {
      if (i < summaries.length) {
        final s = summaries[i];
        return DayBarData(
          label: DateFormatter.dayShort(s.date),
          value: s.totalKcal.toDouble(),
        );
      }
      return DayBarData(
        label: _weekdayLabel(i),
        value: 0,
      );
    });

    return AdaptInfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdaptWeekNavigator(
            label: weekLabel,
            onPrevious: onPrevious,
            onNext: onNext,
          ),
          const SizedBox(height: AppDimensions.spacing16),
          GestureDetector(
            onTapDown: (details) {},
            child: AdaptBarChart(
              data: barData,
              selectedIndex: selectedIndex,
            ),
          ),
        ],
      ),
    );
  }

  static String _weekdayLabel(int index) {
    const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return labels[index % 7];
  }
}

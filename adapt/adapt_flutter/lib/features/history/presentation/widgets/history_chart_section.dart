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
    // Match each summary to its correct weekday slot (0=Mon…6=Sun) so that
    // a partial week (e.g. only Sunday logged) renders in the right position.
    final summaryBySlot = <int, DailySummary>{
      for (final s in summaries)
        (s.date.weekday - 1): s, // weekday: Mon=1…Sun=7 → slot: Mon=0…Sun=6
    };
    final barData = List.generate(7, (i) {
      final s = summaryBySlot[i];
      return DayBarData(
        label: s != null ? DateFormatter.dayShort(s.date) : _weekdayLabel(i),
        value: s != null ? s.totalKcal.toDouble() : 0,
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

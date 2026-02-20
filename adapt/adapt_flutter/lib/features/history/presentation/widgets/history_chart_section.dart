import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Week bar chart with navigation for the history screen.
class HistoryChartSection extends StatelessWidget {
  const HistoryChartSection({
    super.key,
    required this.weekLabel,
    required this.selectedIndex,
    required this.onPrevious,
    required this.onNext,
    required this.onBarTap,
  });

  final String weekLabel;
  final int selectedIndex;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ValueChanged<int> onBarTap;

  static final _demoData = [
    const DayBarData(label: 'Mon', value: 1820),
    const DayBarData(label: 'Tue', value: 2100),
    const DayBarData(label: 'Wed', value: 1650),
    const DayBarData(label: 'Thu', value: 2340),
    const DayBarData(label: 'Fri', value: 1980),
    const DayBarData(label: 'Sat', value: 2600),
    const DayBarData(label: 'Sun', value: 1847),
  ];

  @override
  Widget build(BuildContext context) {
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
            onTapDown: (details) {
              // Delegate bar tap to parent (simplified for static UI)
            },
            child: AdaptBarChart(
              data: _demoData,
              selectedIndex: selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}

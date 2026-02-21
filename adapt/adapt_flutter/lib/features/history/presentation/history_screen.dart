import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/utils/date_formatter.dart';
import 'providers/history_provider.dart';
import 'widgets/history_chart_section.dart';
import 'widgets/history_day_section.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  int _selectedBarIndex = 6;
  late DateTime _weekStart;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    // Monday of the current week.
    _weekStart = now.subtract(Duration(days: now.weekday - 1));
  }

  DateTime get _selectedDate =>
      _weekStart.add(Duration(days: _selectedBarIndex));

  @override
  Widget build(BuildContext context) {
    final weekAsync = ref.watch(weekSummaryProvider(_weekStart));
    final weekLabel = DateFormatter.weekRange(_weekStart);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: SliverToBoxAdapter(
                child: Text('History', style: AppTextStyles.titleLarge),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: SliverToBoxAdapter(
                child: weekAsync.when(
                  loading: () => const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (e, _) => Text(
                    'Could not load history.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                  data: (summaries) => HistoryChartSection(
                    weekLabel: weekLabel,
                    selectedIndex: _selectedBarIndex,
                    summaries: summaries,
                    onPrevious: () => setState(
                      () => _weekStart = _weekStart.subtract(
                        const Duration(days: 7),
                      ),
                    ),
                    onNext: () => setState(
                      () =>
                          _weekStart = _weekStart.add(const Duration(days: 7)),
                    ),
                    onBarTap: (i) => setState(() => _selectedBarIndex = i),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: AppDimensions.spacing24,
              ),
              sliver: SliverToBoxAdapter(
                child: HistoryDaySection(
                  dayLabel: DateFormatter.dayFull(_selectedDate),
                  date: _selectedDate,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdaptBottomNavBar(
        currentIndex: 1,
        onTap: (index) => _onNavTap(context, index),
      ),
    );
  }

  void _onNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
      case 1:
        context.go(AppRoutes.history);
      case 2:
        context.go(AppRoutes.profile);
    }
  }
}

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_formatter.dart';
import '../../home/presentation/providers/home_provider.dart';
import 'providers/history_provider.dart';
import 'widgets/history_chart_section.dart';
import 'widgets/history_day_section.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  late int _selectedBarIndex;
  late DateTime _weekStart;

  @override
  void initState() {
    super.initState();
    _initWeek();
  }

  void _initWeek() {
    final now = DateTime.now();
    final localMonday = now.subtract(Duration(days: now.weekday - 1));
    // Normalise to a UTC DateTime using local date components so the server
    // always extracts the correct year/month/day regardless of timezone.
    _weekStart = DateTime.utc(
      localMonday.year,
      localMonday.month,
      localMonday.day,
    );
    _selectedBarIndex = now.weekday - 1; // Mon=0 … Sun=6
  }

  DateTime get _selectedDate =>
      _weekStart.add(Duration(days: _selectedBarIndex));

  void _refresh() {
    ref.invalidate(weekSummaryProvider(_weekStart));
    ref.invalidate(dayDetailProvider(_selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    // Auto-refresh history when home data changes (e.g. after a meal is
    // confirmed). StatefulShellRoute keeps this screen alive so providers
    // would otherwise remain stale.
    ref.listen(homeDataProvider, (previous, next) {
      if (previous != null) _refresh();
    });

    final weekAsync = ref.watch(weekSummaryProvider(_weekStart));
    final weekLabel = DateFormatter.weekRange(_weekStart);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async => _refresh(),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                        () => _weekStart =
                            _weekStart.add(const Duration(days: 7)),
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
      ),
    );
  }
}

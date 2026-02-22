import 'package:adapt_client/adapt_client.dart';
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
  // Bar chart selected index — local UI state (0=Mon…6=Sun).
  int _selectedBarIndex = _todayBarIndex();

  static int _todayBarIndex() {
    final now = DateTime.now();
    return (now.weekday - 1).clamp(0, 6);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Auto-refresh when home data changes (e.g. after confirming a meal).
    ref.listen(homeDataProvider, (previous, next) {
      if (previous != null) {
        ref.read(historyNotifierProvider.notifier).refresh();
      }
    });

    final historyState = ref.watch(historyNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () =>
              ref.read(historyNotifierProvider.notifier).refresh(),
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
              historyState.maybeWhen(
                success: (week, selectedDay, weekStart) =>
                    _buildContent(week, selectedDay, weekStart),
                loading: () => const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                error: (msg) => SliverToBoxAdapter(
                  child: Padding(
                    padding: AppDimensions.screenPadding.copyWith(
                      top: AppDimensions.spacing24,
                    ),
                    child: Text(
                      'Could not load history.',
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.error),
                    ),
                  ),
                ),
                orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    List<DailySummary> week,
    DayDetail? selectedDay,
    DateTime weekStart,
  ) {
    final notifier = ref.read(historyNotifierProvider.notifier);
    final daysLogged = week.where((s) => s.totalKcal > 0).length;
    final today = DateTime.now();
    final daysToShow = week
        .where((s) {
          final isToday = s.date.year == today.year &&
              s.date.month == today.month &&
              s.date.day == today.day;
          return s.totalKcal > 0 || isToday;
        })
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    final selectedDate = selectedDay?.summary.date;

    return SliverList(
      delegate: SliverChildListDelegate([
        // ── Bar chart ──────────────────────────────────────────────────────
        Padding(
          padding: AppDimensions.screenPadding.copyWith(
            top: AppDimensions.spacing24,
            bottom: 0,
          ),
          child: HistoryChartSection(
            weekLabel: DateFormatter.weekRange(weekStart),
            selectedIndex: _selectedBarIndex,
            summaries: week,
            canGoNext: notifier.canGoNext(),
            onPrevious: () => notifier.previousWeek(),
            onNext: () => notifier.nextWeek(),
            onBarTap: (i) {
              setState(() => _selectedBarIndex = i);
              final date = weekStart.add(Duration(days: i));
              notifier.selectDay(date);
            },
          ),
        ),

        // ── ADAPT NOTICED card ─────────────────────────────────────────────
        Padding(
          padding: AppDimensions.screenPadding.copyWith(
            top: AppDimensions.spacing24,
            bottom: 0,
          ),
          child: AdaptInsightCard(
            title: _insightTitle(daysLogged),
            subtitle: 'Consistency matters more than perfection.',
          ),
        ),

        // ── Daily breakdown ────────────────────────────────────────────────
        Padding(
          padding: AppDimensions.screenPadding.copyWith(
            top: AppDimensions.spacing24,
            bottom: 0,
          ),
          child: const AdaptSectionTitle(label: 'Breakdown'),
        ),

        Padding(
          padding: AppDimensions.screenPadding.copyWith(
            top: AppDimensions.spacing12,
            bottom: AppDimensions.spacing24,
          ),
          child: daysToShow.isEmpty
              ? Text(
                  'Nothing logged this week yet.',
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.textMuted),
                )
              : Column(
                  children: [
                    for (var i = 0; i < daysToShow.length; i++) ...[
                      if (i > 0) const Divider(height: 1),
                      HistoryDayRow(
                        summary: daysToShow[i],
                        isSelected: selectedDate != null &&
                            _sameDay(daysToShow[i].date, selectedDate),
                        selectedDetail: selectedDate != null &&
                                _sameDay(daysToShow[i].date, selectedDate)
                            ? selectedDay
                            : null,
                        onTap: () => notifier.selectDay(daysToShow[i].date),
                      ),
                    ],
                  ],
                ),
        ),
      ]),
    );
  }

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static String _insightTitle(int daysLogged) {
    if (daysLogged >= 7) {
      return 'You logged every day this week. That\'s your best streak.';
    }
    if (daysLogged >= 5) return 'Almost a full week. Consistency is building.';
    if (daysLogged >= 3) {
      return 'More than half the week logged. Keep going.';
    }
    if (daysLogged >= 1) return 'Every log counts, even the small ones.';
    return 'Nothing logged this week yet. Start whenever.';
  }
}

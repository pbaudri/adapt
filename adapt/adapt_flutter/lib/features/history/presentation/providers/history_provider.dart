import 'package:adapt_client/adapt_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/history_repository.dart';
import '../../domain/history_state.dart';

part 'history_provider.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  HistoryState build() {
    Future.microtask(_init);
    return const HistoryState.initial();
  }

  bool get _isGuest => ref.read(authNotifierProvider).maybeWhen(
        authenticated: (token) => token.isGuest,
        orElse: () => false,
      );

  DateTime _currentWeekStart() {
    final now = DateTime.now();
    final localMonday = now.subtract(Duration(days: now.weekday - 1));
    return DateTime.utc(localMonday.year, localMonday.month, localMonday.day);
  }

  bool _isCurrentWeek(DateTime weekStart) {
    final current = _currentWeekStart();
    return weekStart.year == current.year &&
        weekStart.month == current.month &&
        weekStart.day == current.day;
  }

  Future<void> _init() => _loadWeek(_currentWeekStart());

  Future<void> _loadWeek(DateTime weekStart, {DayDetail? selectedDay}) async {
    state = const HistoryState.loading();
    try {
      final week = _isGuest
          ? _emptyWeek(weekStart)
          : await ref.read(historyRepositoryProvider).getWeekSummary(weekStart);
      state = HistoryState.success(week, selectedDay, weekStart);
    } catch (e) {
      state = HistoryState.error(e.toString());
    }
  }

  Future<void> previousWeek() async {
    final weekStart = state.maybeWhen(
      success: (_, _, ws) => ws,
      orElse: _currentWeekStart,
    );
    await _loadWeek(weekStart.subtract(const Duration(days: 7)));
  }

  Future<void> nextWeek() async {
    final weekStart = state.maybeWhen(
      success: (_, _, ws) => ws,
      orElse: _currentWeekStart,
    );
    if (_isCurrentWeek(weekStart)) return;
    await _loadWeek(weekStart.add(const Duration(days: 7)));
  }

  Future<void> selectDay(DateTime date) async {
    final currentState = state;
    List<DailySummary> currentWeek = [];
    DateTime currentWeekStart = _currentWeekStart();
    currentState.maybeWhen(
      success: (week, _, ws) {
        currentWeek = week;
        currentWeekStart = ws;
      },
      orElse: () {},
    );

    // Toggle off if same day is tapped again.
    final alreadySelected = currentState.maybeWhen(
      success: (_, selectedDay, _) =>
          selectedDay != null &&
          _sameDay(selectedDay.summary.date, date),
      orElse: () => false,
    );
    if (alreadySelected) {
      state = HistoryState.success(currentWeek, null, currentWeekStart);
      return;
    }

    try {
      final detail = _isGuest
          ? _emptyDayDetail(date)
          : await ref.read(historyRepositoryProvider).getDayDetail(date);
      state = HistoryState.success(currentWeek, detail, currentWeekStart);
    } catch (e) {
      // Keep week data; silently drop the day detail on error.
      state = HistoryState.success(currentWeek, null, currentWeekStart);
    }
  }

  Future<void> refresh() async {
    final weekStart = state.maybeWhen(
      success: (_, _, ws) => ws,
      orElse: _currentWeekStart,
    );
    await _loadWeek(weekStart);
  }

  bool canGoNext() => !state.maybeWhen(
        success: (_, _, ws) => _isCurrentWeek(ws),
        orElse: () => true,
      );

  // ── Helpers ───────────────────────────────────────────────────────────────

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static List<DailySummary> _emptyWeek(DateTime weekStart) =>
      List.generate(7, (i) => _emptyDailySummary(weekStart.add(Duration(days: i))));

  static DailySummary _emptyDailySummary(DateTime date) => DailySummary(
        userId: 'guest',
        date: date,
        totalKcal: 0,
        totalProteinG: 0,
        totalCarbsG: 0,
        totalFatG: 0,
        hadAlcohol: false,
        mealEmojis: '[]',
        morningRecapSent: false,
      );

  static DayDetail _emptyDayDetail(DateTime date) => DayDetail(
        summary: _emptyDailySummary(date),
        meals: [],
        mealResults: [],
        drinks: [],
      );
}

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/daily_summary_service.dart';

/// Provides historical nutrition data: weekly summaries and day details.
class HistoryEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns exactly 7 DailySummary rows starting at [weekStartDate] (Mon–Sun).
  /// Days with no data are filled with zero-value synthetic rows so the
  /// bar chart always has 7 data points.
  Future<List<DailySummary>> getWeekSummary(
    Session session,
    DateTime weekStartDate,
  ) async {
    final userId = session.authenticated!.userIdentifier;
    final weekStart = DateTime.utc(
      weekStartDate.year,
      weekStartDate.month,
      weekStartDate.day,
    );

    final rows = await DailySummaryService.getWeekSummaries(
      session,
      userId: userId,
      weekStart: weekStart,
    );

    // Index existing rows by date for O(1) lookup.
    final byDate = {for (final r in rows) r.date: r};

    // Generate all 7 days, substituting zeros where there is no data.
    return List.generate(7, (i) {
      final day = weekStart.add(Duration(days: i));
      return byDate[day] ??
          DailySummary(
            userId: userId,
            date: day,
            totalKcal: 0,
            totalProteinG: 0,
            totalCarbsG: 0,
            totalFatG: 0,
            hadAlcohol: false,
            mealEmojis: '[]',
            morningRecapSent: false,
          );
    });
  }

  /// Returns the full detail for a single day: summary + meals + drinks.
  Future<DayDetail> getDayDetail(Session session, DateTime date) async {
    final userId = session.authenticated!.userIdentifier;
    // Build a [dayStart, dayEnd) half-open interval covering exactly 24 hours
    // starting at UTC midnight on the requested calendar day.
    final dayStart = DateTime.utc(date.year, date.month, date.day);
    final dayEnd = dayStart.add(const Duration(hours: 24));

    final summary = await DailySummaryService.getOrCreate(
      session,
      userId: userId,
      date: dayStart,
    );

    final meals = await MealLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          (t.loggedAt >= dayStart) &
          (t.loggedAt < dayEnd),
      orderBy: (t) => t.loggedAt,
    );

    final mealLogIds = meals.map((m) => m.id!).toSet();
    final mealResults = mealLogIds.isEmpty
        ? <MealResult>[]
        : await MealResult.db.find(
            session,
            where: (t) => t.mealLogId.inSet(mealLogIds),
          );

    final drinks = await DrinkLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          (t.loggedAt >= dayStart) &
          (t.loggedAt < dayEnd),
      orderBy: (t) => t.loggedAt,
    );

    return DayDetail(
      summary: summary,
      meals: meals,
      mealResults: mealResults,
      drinks: drinks,
    );
  }
}

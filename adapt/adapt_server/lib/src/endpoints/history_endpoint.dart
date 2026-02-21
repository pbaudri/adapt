import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/daily_summary_service.dart';

/// Provides historical nutrition data: weekly summaries and day details.
class HistoryEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns the seven DailySummary rows starting at [weekStartDate].
  Future<List<DailySummary>> getWeekSummary(
    Session session,
    DateTime weekStartDate,
  ) async {
    final userId = session.authenticated!.userIdentifier;
    return DailySummaryService.getWeekSummaries(
      session,
      userId: userId,
      weekStart: weekStartDate,
    );
  }

  /// Returns the full detail for a single day: summary + meals + drinks.
  Future<DayDetail> getDayDetail(Session session, DateTime date) async {
    final userId = session.authenticated!.userIdentifier;
    final dayStart = DateTime.utc(date.year, date.month, date.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    final summary = await DailySummaryService.getOrCreate(
      session,
      userId: userId,
      date: dayStart,
    );

    final meals = await MealLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.loggedAt.between(dayStart, dayEnd),
      orderBy: (t) => t.loggedAt,
    );

    final drinks = await DrinkLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.loggedAt.between(dayStart, dayEnd),
      orderBy: (t) => t.loggedAt,
    );

    return DayDetail(
      summary: summary,
      meals: meals,
      drinks: drinks,
    );
  }
}

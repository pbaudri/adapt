import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Manages DailySummary aggregation and updates.
///
/// Called after every meal or drink log to keep the daily totals consistent.
abstract final class DailySummaryService {
  /// Returns (or creates) the DailySummary for [userId] on [date].
  ///
  /// The [date] is normalised to midnight UTC so each day has exactly one row.
  static Future<DailySummary> getOrCreate(
    Session session, {
    required String userId,
    required DateTime date,
  }) async {
    final dayStart = _startOfDay(date);

    var summary = await DailySummary.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.date.equals(dayStart),
    );

    if (summary == null) {
      summary = DailySummary(
        userId: userId,
        date: dayStart,
        totalKcal: 0,
        totalProteinG: 0,
        totalCarbsG: 0,
        totalFatG: 0,
        hadAlcohol: false,
        mealEmojis: '[]',
        morningRecapSent: false,
      );
      summary = await DailySummary.db.insertRow(session, summary);
    }

    return summary;
  }

  /// Updates the daily summary after a meal result is confirmed.
  static Future<DailySummary> addMealResult(
    Session session, {
    required String userId,
    required MealResult result,
  }) async {
    final summary = await getOrCreate(
      session,
      userId: userId,
      date: DateTime.now(),
    );

    final updated = summary.copyWith(
      totalKcal: summary.totalKcal + result.caloriesKcal,
      totalProteinG: summary.totalProteinG + result.proteinG,
      totalCarbsG: summary.totalCarbsG + result.carbsG,
      totalFatG: summary.totalFatG + result.fatG,
    );

    return DailySummary.db.updateRow(session, updated);
  }

  /// Removes a meal result's contribution from the daily summary.
  ///
  /// Used when a meal log is deleted or corrected.
  static Future<DailySummary> removeMealResult(
    Session session, {
    required String userId,
    required MealResult result,
  }) async {
    final summary = await getOrCreate(
      session,
      userId: userId,
      date: DateTime.now(),
    );

    final updated = summary.copyWith(
      totalKcal: (summary.totalKcal - result.caloriesKcal).clamp(0, 99999),
      totalProteinG: (summary.totalProteinG - result.proteinG).clamp(0, 9999),
      totalCarbsG: (summary.totalCarbsG - result.carbsG).clamp(0, 9999),
      totalFatG: (summary.totalFatG - result.fatG).clamp(0, 9999),
    );

    return DailySummary.db.updateRow(session, updated);
  }

  /// Updates the daily summary after a drink log is added.
  static Future<DailySummary> addDrinkLog(
    Session session, {
    required String userId,
    required DrinkLog drinkLog,
  }) async {
    final summary = await getOrCreate(
      session,
      userId: userId,
      date: drinkLog.loggedAt,
    );

    final updated = summary.copyWith(
      totalKcal: summary.totalKcal + drinkLog.caloriesKcal,
      hadAlcohol: true,
    );

    return DailySummary.db.updateRow(session, updated);
  }

  /// Returns the DailySummary rows for the week starting at [weekStart].
  static Future<List<DailySummary>> getWeekSummaries(
    Session session, {
    required String userId,
    required DateTime weekStart,
  }) async {
    final start = _startOfDay(weekStart);
    final end = start.add(const Duration(days: 7));

    return DailySummary.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.date.between(start, end),
      orderBy: (t) => t.date,
    );
  }

  /// Marks the morning recap as sent for [userId] on [date].
  static Future<void> markRecapSent(
    Session session, {
    required String userId,
    required DateTime date,
  }) async {
    final summary = await getOrCreate(
      session,
      userId: userId,
      date: date,
    );
    await DailySummary.db.updateRow(
      session,
      summary.copyWith(morningRecapSent: true),
    );
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  static DateTime _startOfDay(DateTime dt) =>
      DateTime.utc(dt.year, dt.month, dt.day);
}

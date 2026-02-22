import 'dart:convert';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Manages DailySummary aggregation and updates.
///
/// The single source of truth for a day's summary is always recomputed from
/// the raw meal_logs, meal_results, and drink_logs rows — never maintained
/// incrementally.  This prevents drift from partial updates.
///
/// Rules:
/// - One row per (user_id, date).  date is always UTC midnight.
/// - A summary row is ONLY created when there is real data to store
///   (confirmed meal or drink log).
/// - getWeekSummaries is read-only and never creates rows.
/// - getDayDetail (via HistoryEndpoint) never creates rows either.
abstract final class DailySummaryService {
  // ── Public write API ──────────────────────────────────────────────────────

  /// Full recompute + upsert of the daily summary for the calendar day that
  /// contains [loggedAt] (UTC).
  ///
  /// Call this after ANY write that could change a day's totals:
  /// - confirmMeal / correctMeal  → pass mealLog.loggedAt
  /// - logDrinks                  → pass drinkLog.loggedAt
  static Future<DailySummary> updateSummary(
    Session session, {
    required String userId,
    required DateTime loggedAt,
  }) async {
    final dayStart = _startOfDay(loggedAt);
    final dayEnd = dayStart.add(const Duration(hours: 24));

    // ── Step 1: all confirmed meals for the day ────────────────────────────
    final mealLogs = await MealLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          (t.loggedAt >= dayStart) &
          (t.loggedAt < dayEnd) &
          t.estimated.equals(false),
    );

    final mealLogIds = mealLogs.map((m) => m.id!).toSet();
    final mealResults = mealLogIds.isEmpty
        ? <MealResult>[]
        : await MealResult.db.find(
            session,
            where: (t) => t.mealLogId.inSet(mealLogIds),
          );

    // ── Step 2: all drink logs for the day ────────────────────────────────
    final drinkLogs = await DrinkLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          (t.loggedAt >= dayStart) &
          (t.loggedAt < dayEnd),
    );

    // ── Step 3: aggregate from scratch ────────────────────────────────────
    var totalKcal = 0;
    var totalProteinG = 0.0;
    var totalCarbsG = 0.0;
    var totalFatG = 0.0;

    for (final r in mealResults) {
      totalKcal += r.caloriesKcal;
      totalProteinG += r.proteinG;
      totalCarbsG += r.carbsG;
      totalFatG += r.fatG;
    }
    for (final d in drinkLogs) {
      totalKcal += d.caloriesKcal;
    }

    final hadAlcohol = drinkLogs.isNotEmpty;
    final mealEmojis = _buildMealEmojis(mealResults, drinkLogs);

    // ── Step 4: upsert (user_id + date is the unique key) ─────────────────
    final existing = await DailySummary.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.date.equals(dayStart),
    );

    if (existing != null) {
      return DailySummary.db.updateRow(
        session,
        existing.copyWith(
          totalKcal: totalKcal,
          totalProteinG: totalProteinG,
          totalCarbsG: totalCarbsG,
          totalFatG: totalFatG,
          hadAlcohol: hadAlcohol,
          mealEmojis: mealEmojis,
        ),
      );
    } else {
      return DailySummary.db.insertRow(
        session,
        DailySummary(
          userId: userId,
          date: dayStart,
          totalKcal: totalKcal,
          totalProteinG: totalProteinG,
          totalCarbsG: totalCarbsG,
          totalFatG: totalFatG,
          hadAlcohol: hadAlcohol,
          mealEmojis: mealEmojis,
          morningRecapSent: false,
        ),
      );
    }
  }

  // ── Public read API ───────────────────────────────────────────────────────

  /// Returns the DailySummary rows for the 7-day window starting at
  /// [weekStart] (UTC midnight Monday).  Never creates rows.
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
          (t.date >= start) &
          (t.date < end),
      orderBy: (t) => t.date,
    );
  }

  /// Returns the DailySummary for [userId] on [date], or null if it does not
  /// exist.  Never creates a row.
  static Future<DailySummary?> findDay(
    Session session, {
    required String userId,
    required DateTime date,
  }) async {
    final dayStart = _startOfDay(date);
    return DailySummary.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.date.equals(dayStart),
    );
  }

  /// Marks the morning recap as sent for [userId] on [date].
  /// Only updates an existing row — never creates one proactively.
  static Future<void> markRecapSent(
    Session session, {
    required String userId,
    required DateTime date,
  }) async {
    final dayStart = _startOfDay(date);
    final summary = await DailySummary.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.date.equals(dayStart),
    );
    if (summary == null) return; // no data for this day — nothing to mark
    await DailySummary.db.updateRow(
      session,
      summary.copyWith(morningRecapSent: true),
    );
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  static DateTime _startOfDay(DateTime dt) =>
      DateTime.utc(dt.year, dt.month, dt.day);

  /// Builds the mealEmojis JSON string from confirmed meal results and drink
  /// logs.  Deduplicates and caps at 6 total.
  static String _buildMealEmojis(
    List<MealResult> mealResults,
    List<DrinkLog> drinkLogs,
  ) {
    final emojis = <String>[];

    for (final result in mealResults) {
      List<String> parsed;
      try {
        parsed =
            (jsonDecode(result.emojis ?? '["🍽"]') as List).cast<String>();
      } catch (_) {
        parsed = ['🍽'];
      }
      for (final emoji in parsed) {
        if (!emojis.contains(emoji) && emojis.length < 6) {
          emojis.add(emoji);
        }
      }
    }

    for (final drink in drinkLogs) {
      final emoji = _drinkEmojiFor(drink.drinkType);
      if (!emojis.contains(emoji) && emojis.length < 6) {
        emojis.add(emoji);
      }
    }

    return jsonEncode(emojis);
  }

  static String _drinkEmojiFor(DrinkType type) => switch (type) {
        DrinkType.beer => '🍺',
        DrinkType.wine => '🍷',
        DrinkType.champagne => '🥂',
        DrinkType.cocktail => '🍹',
        DrinkType.spirit => '🥃',
        DrinkType.shooter => '🥃',
        DrinkType.liqueur => '🍶',
        DrinkType.longDrink => '🧃',
        DrinkType.hardSeltzer => '💧',
        DrinkType.other => '➕',
      };
}

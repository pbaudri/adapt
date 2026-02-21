import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/daily_summary_service.dart';

/// Handles drink reference lookups and drink logging.
class DrinkEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns the full list of drink reference items (static seed data).
  Future<List<DrinkReference>> getDrinkReference(Session session) async {
    return DrinkReference.db.find(
      session,
      orderBy: (t) => t.drinkType,
    );
  }

  /// Logs a drink for the authenticated user and returns the updated summary.
  Future<DailySummary> logDrinks(
    Session session,
    String drinkType,
    int quantity,
  ) async {
    final userId = session.authenticated!.userIdentifier;

    // Look up reference calories for this drink type
    final ref = await DrinkReference.db.findFirstRow(
      session,
      where: (t) => t.drinkType.equals(drinkType),
    );
    if (ref == null) throw Exception('Unknown drink type: $drinkType');

    final caloriesKcal = ref.caloriesPerUnit * quantity;
    final now = DateTime.now();

    final drinkLog = await DrinkLog.db.insertRow(
      session,
      DrinkLog(
        userId: userId,
        loggedAt: now,
        drinkType: drinkType,
        quantity: quantity,
        caloriesKcal: caloriesKcal,
      ),
    );

    return DailySummaryService.addDrinkLog(
      session,
      userId: userId,
      drinkLog: drinkLog,
    );
  }

  /// Returns today's drink logs for the authenticated user.
  Future<List<DrinkLog>> getTodayDrinks(Session session) async {
    final userId = session.authenticated!.userIdentifier;
    final now = DateTime.now();
    final dayStart = DateTime.utc(now.year, now.month, now.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    return DrinkLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.loggedAt.between(dayStart, dayEnd),
      orderBy: (t) => t.loggedAt,
      orderDescending: true,
    );
  }
}

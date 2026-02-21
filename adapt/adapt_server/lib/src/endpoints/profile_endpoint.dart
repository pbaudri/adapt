import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Manages the user's profile — reads and per-field updates.
class ProfileEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<UserProfile> getProfile(Session session) async {
    final userId = session.authenticated!.userIdentifier;
    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    if (profile == null) throw Exception('Profile not found.');
    return profile;
  }

  Future<UserProfile> updateWeight(Session session, double weightKg) async {
    return _update(session, (p) => p.copyWith(weightKg: weightKg));
  }

  Future<UserProfile> updateHeight(Session session, double heightCm) async {
    return _update(session, (p) => p.copyWith(heightCm: heightCm));
  }

  Future<UserProfile> updateAge(Session session, int age) async {
    return _update(session, (p) => p.copyWith(age: age));
  }

  Future<UserProfile> updateGoal(Session session, String goal) async {
    return _update(session, (p) => p.copyWith(goal: goal));
  }

  Future<UserProfile> updateWeightUnit(Session session, String unit) async {
    return _update(session, (p) => p.copyWith(weightUnit: unit));
  }

  Future<UserProfile> updateHeightUnit(Session session, String unit) async {
    return _update(session, (p) => p.copyWith(heightUnit: unit));
  }

  Future<UserProfile> updatePreferences(
    Session session,
    bool alcoholTracking,
    bool morningRecap,
  ) async {
    return _update(
      session,
      (p) => p.copyWith(
        alcoholTracking: alcoholTracking,
        morningRecap: morningRecap,
      ),
    );
  }

  /// Deletes all user-generated data. Profile itself is retained.
  Future<void> deleteAllData(Session session) async {
    final userId = session.authenticated!.userIdentifier;

    // Delete meal logs (cascade or manual depending on schema)
    final mealLogs = await MealLog.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    for (final log in mealLogs) {
      // Delete associated meal results first
      final results = await MealResult.db.find(
        session,
        where: (t) => t.mealLogId.equals(log.id!),
      );
      await MealResult.db.delete(session, results);
    }
    await MealLog.db.delete(session, mealLogs);

    // Delete drink logs
    final drinkLogs = await DrinkLog.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    await DrinkLog.db.delete(session, drinkLogs);

    // Delete daily summaries
    final summaries = await DailySummary.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    await DailySummary.db.delete(session, summaries);

    // Delete morning recaps
    final recaps = await MorningRecap.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    await MorningRecap.db.delete(session, recaps);
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  Future<UserProfile> _update(
    Session session,
    UserProfile Function(UserProfile) updater,
  ) async {
    final userId = session.authenticated!.userIdentifier;
    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    if (profile == null) throw Exception('Profile not found.');
    final updated = updater(profile.copyWith(updatedAt: DateTime.now()));
    return UserProfile.db.updateRow(session, updated);
  }
}

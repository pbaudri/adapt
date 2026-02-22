import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/nutrition_service.dart';

/// Provides the aggregated home screen data.
class HomeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<HomeData> getHomeData(Session session) async {
    final userId = session.authenticated!.userIdentifier;
    final now = DateTime.now();
    final dayStart = DateTime.utc(now.year, now.month, now.day);
    final dayEnd = dayStart.add(const Duration(hours: 24));

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    // Last 3 confirmed meals for today (estimated = false), most recent first.
    final allMeals = await MealLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          (t.loggedAt >= dayStart) &
          (t.loggedAt < dayEnd) &
          t.estimated.equals(false),
      orderBy: (t) => t.loggedAt,
      orderDescending: true,
      limit: 3,
    );

    final summary = await DailySummary.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.date.equals(dayStart),
    );

    final mealLogIds = allMeals.map((m) => m.id!).toSet();
    final mealResults = mealLogIds.isEmpty
        ? <MealResult>[]
        : await MealResult.db.find(
            session,
            where: (t) => t.mealLogId.inSet(mealLogIds),
          );

    final todayDrinks = await DrinkLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          (t.loggedAt >= dayStart) &
          (t.loggedAt < dayEnd),
      orderBy: (t) => t.loggedAt,
      orderDescending: true,
    );

    final dailyKcal = summary?.totalKcal ?? 0;
    final targetKcal = _computeTarget(profile);

    return HomeData(
      greeting: _buildGreeting(profile?.name),
      dailyKcal: dailyKcal,
      targetKcal: targetKcal,
      adaptiveMessage: _buildAdaptiveMessage(dailyKcal),
      meals: allMeals,
      mealResults: mealResults,
      totalProteinG: summary?.totalProteinG ?? 0.0,
      totalCarbsG: summary?.totalCarbsG ?? 0.0,
      totalFatG: summary?.totalFatG ?? 0.0,
      hadAlcohol: summary?.hadAlcohol ?? false,
      todayDrinks: todayDrinks,
    );
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  String _buildGreeting(String? name) {
    final hour = DateTime.now().hour;
    final period = hour < 12
        ? 'morning'
        : hour < 17
            ? 'afternoon'
            : 'evening';
    final displayName = (name?.isNotEmpty == true) ? name! : 'there';
    return 'Good $period, $displayName.';
  }

  int _computeTarget(UserProfile? profile) {
    if (profile == null) return 2000;
    if (profile.weightKg == null ||
        profile.heightCm == null ||
        profile.age == null ||
        profile.biologicalSex == null) {
      return 2000;
    }
    return NutritionService.estimateDailyTarget(
      weightKg: profile.weightKg!,
      heightCm: profile.heightCm!,
      age: profile.age!,
      biologicalSex: profile.biologicalSex!,
      goal: profile.goal,
    );
  }

  String _buildAdaptiveMessage(int consumed) {
    if (consumed == 0) return 'Nothing logged yet — start whenever you\'re ready.';
    if (consumed < 800) return 'Light day so far. No rush.';
    if (consumed <= 1500) return 'Good balance so far.';
    return 'Solid day. Keep listening to your body.';
  }
}

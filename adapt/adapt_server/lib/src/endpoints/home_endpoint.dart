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
    final dayEnd = dayStart.add(const Duration(days: 1));

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final meals = await MealLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.loggedAt.between(dayStart, dayEnd),
      orderBy: (t) => t.loggedAt,
      orderDescending: true,
    );

    final summary = await DailySummary.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.date.equals(dayStart),
    );

    // Fetch MealResult for each meal log so the client can show the
    // AI-generated name and per-meal calorie count.
    final mealLogIds = meals.map((m) => m.id!).toSet();
    final mealResults = mealLogIds.isEmpty
        ? <MealResult>[]
        : await MealResult.db.find(
            session,
            where: (t) => t.mealLogId.inSet(mealLogIds),
          );

    final dailyKcal = summary?.totalKcal ?? 0;
    final targetKcal = _computeTarget(profile);

    return HomeData(
      greeting: _buildGreeting(profile?.name),
      dailyKcal: dailyKcal,
      targetKcal: targetKcal,
      adaptiveMessage: _buildAdaptiveMessage(dailyKcal, targetKcal),
      meals: meals,
      mealResults: mealResults,
      totalProteinG: summary?.totalProteinG ?? 0.0,
      totalCarbsG: summary?.totalCarbsG ?? 0.0,
      totalFatG: summary?.totalFatG ?? 0.0,
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

  String _buildAdaptiveMessage(int consumed, int target) {
    final remaining = target - consumed;
    if (remaining > 600) {
      return 'Plenty of room ahead. Enjoy your meals today.';
    } else if (remaining > 300) {
      return 'A balanced lunch and light dinner keeps you right on track.';
    } else if (remaining > 0) {
      return 'A light snack or small dinner fits well here.';
    } else {
      return "You've reached your target. Listen to your body — that's what matters.";
    }
  }
}

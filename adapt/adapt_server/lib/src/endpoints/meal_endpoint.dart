import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/ai_service.dart';
import '../services/daily_summary_service.dart';
import '../services/nutrition_service.dart';

/// Handles meal logging, analysis, confirmation, and correction.
class MealEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Analyses free-text input and returns a MealResult (not yet confirmed).
  Future<MealResult> logMealByText(Session session, String text) async {
    final userId = session.authenticated!.userIdentifier;

    final mealLog = await MealLog.db.insertRow(
      session,
      MealLog(
        userId: userId,
        loggedAt: DateTime.now(),
        mealType: _guessMealType(),
        inputMethod: InputMethod.text,
        rawInput: text,
        estimated: true,
      ),
    );

    final analysis = await AiService.analyzeText(session, text);
    return MealResult.db.insertRow(
      session,
      buildMealResult(mealLogId: mealLog.id!, analysis: analysis),
    );
  }

  /// Analyses a photo (bytes) and returns a MealResult (not yet confirmed).
  Future<MealResult> logMealByPhoto(Session session, ByteData imageBytes) async {
    final userId = session.authenticated!.userIdentifier;

    final mealLog = await MealLog.db.insertRow(
      session,
      MealLog(
        userId: userId,
        loggedAt: DateTime.now(),
        mealType: _guessMealType(),
        inputMethod: InputMethod.photo,
        estimated: true,
      ),
    );

    final bytes = imageBytes.buffer.asUint8List();
    final analysis = await AiService.analyzeImage(session, bytes);
    return MealResult.db.insertRow(
      session,
      buildMealResult(mealLogId: mealLog.id!, analysis: analysis),
    );
  }

  /// Confirms a meal: marks it as not estimated and updates the daily summary.
  Future<DailySummary> confirmMeal(Session session, int mealLogId) async {
    final userId = session.authenticated!.userIdentifier;

    final mealLog = await MealLog.db.findById(session, mealLogId);
    if (mealLog == null || mealLog.userId != userId) {
      throw Exception('Meal log not found.');
    }

    await MealLog.db.updateRow(session, mealLog.copyWith(estimated: false));

    final result = await MealResult.db.findFirstRow(
      session,
      where: (t) => t.mealLogId.equals(mealLogId),
    );
    if (result == null) throw Exception('Meal result not found.');

    return DailySummaryService.addMealResult(
      session,
      userId: userId,
      result: result,
    );
  }

  /// Corrects macros for a meal. caloriesKcal is always recalculated.
  Future<MealResult> correctMeal(
    Session session,
    int mealLogId,
    MealCorrectionInput correctedData,
  ) async {
    final userId = session.authenticated!.userIdentifier;

    final mealLog = await MealLog.db.findById(session, mealLogId);
    if (mealLog == null || mealLog.userId != userId) {
      throw Exception('Meal log not found.');
    }

    final existing = await MealResult.db.findFirstRow(
      session,
      where: (t) => t.mealLogId.equals(mealLogId),
    );
    if (existing == null) throw Exception('Meal result not found.');

    final newProtein = correctedData.proteinG ?? existing.proteinG;
    final newCarbs = correctedData.carbsG ?? existing.carbsG;
    final newFat = correctedData.fatG ?? existing.fatG;
    final newCalories = NutritionService.calculateCalories(
      proteinG: newProtein,
      carbsG: newCarbs,
      fatG: newFat,
    );

    if (!mealLog.estimated) {
      await DailySummaryService.removeMealResult(
        session,
        userId: userId,
        result: existing,
      );
    }

    final updated = await MealResult.db.updateRow(
      session,
      existing.copyWith(
        name: correctedData.name ?? existing.name,
        proteinG: newProtein,
        carbsG: newCarbs,
        fatG: newFat,
        caloriesKcal: newCalories,
        source: MealSource.userCorrected,
      ),
    );

    await MealLog.db.updateRow(session, mealLog.copyWith(estimated: false));

    await DailySummaryService.addMealResult(
      session,
      userId: userId,
      result: updated,
    );

    return updated;
  }

  /// Returns today's meal logs for the authenticated user.
  Future<List<MealLog>> getTodayMeals(Session session) async {
    final userId = session.authenticated!.userIdentifier;
    final now = DateTime.now();
    final dayStart = DateTime.utc(now.year, now.month, now.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    return MealLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.loggedAt.between(dayStart, dayEnd),
      orderBy: (t) => t.loggedAt,
      orderDescending: true,
    );
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  MealType _guessMealType() {
    final hour = DateTime.now().hour;
    if (hour < 10) return MealType.breakfast;
    if (hour < 14) return MealType.lunch;
    if (hour < 18) return MealType.snack;
    return MealType.dinner;
  }
}

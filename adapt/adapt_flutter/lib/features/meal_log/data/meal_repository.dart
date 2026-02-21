import 'dart:typed_data';

import 'package:adapt_client/src/protocol/client.dart';
import 'package:adapt_client/src/protocol/daily_summary.dart';
import 'package:adapt_client/src/protocol/meal_correction_input.dart';
import 'package:adapt_client/src/protocol/meal_log.dart';
import 'package:adapt_client/src/protocol/meal_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'meal_repository.g.dart';

@riverpod
MealRepository mealRepository(MealRepositoryRef ref) {
  return MealRepository(ref.watch(adaptClientProvider));
}

class MealRepository {
  const MealRepository(this._client);

  final Client _client;

  Future<MealResult> logMealByText(String text) {
    return _client.meal.logMealByText(text);
  }

  Future<MealResult> logMealByPhoto(ByteData imageBytes) {
    return _client.meal.logMealByPhoto(imageBytes);
  }

  Future<DailySummary> confirmMeal(int mealLogId) {
    return _client.meal.confirmMeal(mealLogId);
  }

  /// [correctedData] must NOT include caloriesKcal — always auto-calculated
  /// server-side as (proteinG×4) + (carbsG×4) + (fatG×9).
  Future<MealResult> correctMeal(
    int mealLogId,
    MealCorrectionInput correctedData,
  ) {
    return _client.meal.correctMeal(mealLogId, correctedData);
  }

  Future<List<MealLog>> getTodayMeals() {
    return _client.meal.getTodayMeals();
  }
}

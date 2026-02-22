import 'dart:io';
import 'dart:typed_data';

import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'meal_repository.g.dart';

@riverpod
MealRepository mealRepository(Ref ref) {
  return MealRepository(ref.watch(adaptClientProvider));
}

class MealRepository {
  const MealRepository(this._client);

  final Client _client;

  Future<MealResult> logMealByText(String text) {
    return _client.meal.logMealByText(text);
  }

  /// Reads [imageFile] bytes, converts to [ByteData] and sends to the endpoint.
  Future<MealResult> logMealByPhoto(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final byteData = ByteData.view(bytes.buffer);
    return _client.meal.logMealByPhoto(byteData);
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

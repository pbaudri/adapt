import 'dart:typed_data';

import 'package:adapt_client/src/protocol/meal_correction_input.dart';
import 'package:adapt_client/src/protocol/meal_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/meal_repository.dart';
import '../../domain/meal_state.dart';

part 'meal_provider.g.dart';

@riverpod
class MealNotifier extends _$MealNotifier {
  @override
  MealState build() => const MealState.initial();

  Future<void> analyseByText(String text) async {
    state = const MealState.loading();
    try {
      final result = await ref.read(mealRepositoryProvider).logMealByText(text);
      state = MealState.result(result);
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  Future<void> analyseByPhoto(ByteData imageBytes) async {
    state = const MealState.loading();
    try {
      final result =
          await ref.read(mealRepositoryProvider).logMealByPhoto(imageBytes);
      state = MealState.result(result);
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  Future<void> confirmMeal(int mealLogId) async {
    state = const MealState.loading();
    try {
      await ref.read(mealRepositoryProvider).confirmMeal(mealLogId);
      state = const MealState.confirmed();
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  /// Corrects macros then re-confirms. caloriesKcal is excluded and
  /// recalculated server-side.
  Future<void> correctAndConfirm({
    required int mealLogId,
    required String? name,
    required double? proteinG,
    required double? carbsG,
    required double? fatG,
  }) async {
    state = const MealState.loading();
    try {
      final corrected = MealCorrectionInput(
        name: name,
        proteinG: proteinG,
        carbsG: carbsG,
        fatG: fatG,
      );
      final result = await ref
          .read(mealRepositoryProvider)
          .correctMeal(mealLogId, corrected);
      state = MealState.result(result);
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  void reset() => state = const MealState.initial();
}

/// Today's meal logs — refreshed after every confirmation.
@riverpod
Future<List<dynamic>> todayMeals(TodayMealsRef ref) {
  return ref.watch(mealRepositoryProvider).getTodayMeals();
}

/// Exposes the currently-pending MealResult for the result and edit screens.
@riverpod
MealResult? pendingMealResult(PendingMealResultRef ref) {
  final state = ref.watch(mealNotifierProvider);
  return state.maybeWhen(result: (r) => r, orElse: () => null);
}

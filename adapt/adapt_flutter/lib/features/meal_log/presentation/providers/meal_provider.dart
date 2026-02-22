import 'dart:io';

import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/meal_repository.dart';
import '../../domain/meal_state.dart';

part 'meal_provider.g.dart';

@riverpod
class MealNotifier extends _$MealNotifier {
  @override
  MealState build() => const MealState.initial();

  Future<void> logByText(String text) async {
    state = const MealState.loading('Analysing your meal…');
    try {
      final result = await ref.read(mealRepositoryProvider).logMealByText(text);
      state = MealState.success(result);
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  Future<void> logByPhoto(File imageFile) async {
    state = const MealState.loading('Analysing your meal…');
    try {
      final result =
          await ref.read(mealRepositoryProvider).logMealByPhoto(imageFile);
      state = MealState.success(result);
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  Future<void> confirm(int mealLogId) async {
    state = const MealState.loading('Adding to your day…');
    try {
      final summary =
          await ref.read(mealRepositoryProvider).confirmMeal(mealLogId);
      state = MealState.confirmed(summary);
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  /// Corrects macros. caloriesKcal is excluded and recalculated server-side.
  Future<void> correct(int mealLogId, MealCorrectionInput correction) async {
    state = const MealState.loading('Saving corrections…');
    try {
      final result = await ref
          .read(mealRepositoryProvider)
          .correctMeal(mealLogId, correction);
      state = MealState.success(result);
    } catch (e) {
      state = MealState.error(e.toString());
    }
  }

  /// Loads an existing [MealResult] into the provider so the result screen
  /// can display a previously confirmed meal (from home or history lists).
  void loadResult(MealResult result) => state = MealState.success(result);

  void reset() => state = const MealState.initial();
}

/// Today's meal logs — refreshed after every confirmation.
@riverpod
Future<List<MealLog>> todayMeals(Ref ref) {
  return ref.watch(mealRepositoryProvider).getTodayMeals();
}

/// Exposes the currently-pending MealResult for the result and edit screens.
@riverpod
MealResult? pendingMealResult(Ref ref) {
  final state = ref.watch(mealNotifierProvider);
  return state.maybeWhen(success: (r) => r, orElse: () => null);
}

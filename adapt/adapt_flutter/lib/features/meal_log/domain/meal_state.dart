import 'package:adapt_client/adapt_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_state.freezed.dart';

@freezed
sealed class MealState with _$MealState {
  const factory MealState.initial() = _Initial;
  const factory MealState.loading(String message) = _Loading;
  const factory MealState.success(MealResult result) = _Success;
  const factory MealState.confirmed(DailySummary summary) = _Confirmed;
  const factory MealState.error(String message) = _Error;
}

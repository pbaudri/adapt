import 'package:adapt_client/src/protocol/meal_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_state.freezed.dart';

@freezed
sealed class MealState with _$MealState {
  const factory MealState.initial() = _Initial;
  const factory MealState.loading() = _Loading;
  const factory MealState.result(MealResult result) = _Result;
  const factory MealState.confirmed() = _Confirmed;
  const factory MealState.error(String message) = _Error;
}

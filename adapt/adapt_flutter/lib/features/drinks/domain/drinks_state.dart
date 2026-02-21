import 'package:adapt_client/src/protocol/daily_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drinks_state.freezed.dart';

@freezed
sealed class DrinksState with _$DrinksState {
  const factory DrinksState.initial() = _Initial;
  const factory DrinksState.loading() = _Loading;
  const factory DrinksState.logged(DailySummary summary) = _Logged;
  const factory DrinksState.error(String message) = _Error;
}

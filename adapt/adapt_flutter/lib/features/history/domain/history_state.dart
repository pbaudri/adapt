import 'package:adapt_client/adapt_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
sealed class WeekState with _$WeekState {
  const factory WeekState.loading() = _WeekLoading;
  const factory WeekState.success(List<DailySummary> summaries) = _WeekSuccess;
  const factory WeekState.error(String message) = _WeekError;
}

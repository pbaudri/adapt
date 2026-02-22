import 'package:adapt_client/adapt_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.success(
    List<DailySummary> week,
    DayDetail? selectedDay,
    DateTime weekStartDate,
  ) = _Success;
  const factory HistoryState.error(String message) = _Error;
}

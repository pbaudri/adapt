import 'package:adapt_client/src/protocol/day_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_detail_state.freezed.dart';

@freezed
sealed class DayDetailState with _$DayDetailState {
  const factory DayDetailState.initial() = _DayDetailInitial;
  const factory DayDetailState.loading() = _DayDetailLoading;
  const factory DayDetailState.success(DayDetail detail) = _DayDetailSuccess;
  const factory DayDetailState.error(String message) = _DayDetailError;
}

import 'package:adapt_client/src/protocol/morning_recap.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'morning_recap_state.freezed.dart';

@freezed
sealed class MorningRecapState with _$MorningRecapState {
  const factory MorningRecapState.loading() = _Loading;
  const factory MorningRecapState.success(MorningRecap recap) = _Success;
  const factory MorningRecapState.noRecap() = _NoRecap;
  const factory MorningRecapState.error(String message) = _Error;
}

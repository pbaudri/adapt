import 'package:adapt_client/adapt_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success(UserProfile profile) = _Success;
  const factory ProfileState.error(String message) = _Error;
}

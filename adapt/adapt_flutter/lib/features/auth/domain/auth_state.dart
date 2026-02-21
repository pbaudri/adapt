import 'package:adapt_client/adapt_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  /// Restoring a previous session from secure storage on app launch.
  const factory AuthState.checking() = _Checking;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(AuthToken token) = _Authenticated;
  const factory AuthState.error(String message) = _Error;
}

import 'package:adapt_client/src/protocol/auth_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(AuthToken token) = _Authenticated;
  const factory AuthState.error(String message) = _Error;
}

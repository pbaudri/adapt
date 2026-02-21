import 'package:adapt_client/src/protocol/auth_token.dart';
import 'package:adapt_client/src/protocol/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_core_flutter/serverpod_auth_core_flutter.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(adaptClientProvider));
}

class AuthRepository {
  const AuthRepository(this._client);

  final Client _client;

  /// Sign in with email and password.
  /// Returns the Adapt AuthToken after Serverpod email IDP login.
  Future<AuthToken> signInWithEmail(String email, String password) async {
    final success = await _client.emailIdp.login(
      email: email,
      password: password,
    );
    await _applyAuthSuccess(success);
    return _client.auth.ensureProfile();
  }

  /// Start registration for a new account.
  /// Returns the account request UUID needed to complete registration.
  /// An email verification link is sent to [email].
  Future<UuidValue> startRegistration(String email) {
    return _client.emailIdp.startRegistration(email: email);
  }

  /// Complete registration after the user verifies their email.
  Future<AuthToken> finishRegistration(
    String registrationToken,
    String password,
  ) async {
    final success = await _client.emailIdp.finishRegistration(
      registrationToken: registrationToken,
      password: password,
    );
    await _applyAuthSuccess(success);
    return _client.auth.ensureProfile();
  }

  /// Create a guest session. No account required.
  Future<AuthToken> continueAsGuest() {
    return _client.auth.continueAsGuest();
  }

  /// Apply Serverpod AuthSuccess so subsequent calls are authenticated.
  /// The session manager persists the JWT to secure storage.
  Future<void> _applyAuthSuccess(AuthSuccess success) async {
    final manager = _client.authKeyProvider as FlutterAuthSessionManager;
    await manager.updateSignedInUser(success);
  }
}

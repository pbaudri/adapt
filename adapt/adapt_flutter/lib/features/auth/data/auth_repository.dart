import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_core_flutter/serverpod_auth_core_flutter.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
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

  /// Restore a previous session from secure storage on app launch.
  ///
  /// Returns a valid [AuthToken] if a session was found, or null if the
  /// user needs to sign in.
  Future<AuthToken?> initialize() async {
    final manager = _client.authKeyProvider as FlutterAuthSessionManager;
    // Restore JWT from secure storage — no network call.
    await manager.restore();
    if (manager.authInfo == null) return null;
    // Session exists: ensure the server profile is in sync.
    try {
      return await _client.auth.ensureProfile();
    } catch (_) {
      // Token may be expired or server unreachable — sign in again.
      return null;
    }
  }

  /// Create a new account directly, bypassing email verification.
  ///
  /// Suitable for development. After the account is created the user is
  /// logged in via the standard email IDP flow so a JWT is persisted.
  Future<AuthToken> signUp(String email, String password) async {
    // Create account server-side (no email verification required).
    await _client.auth.signUpWithEmail(email, password);
    // Obtain a JWT by logging in with the newly created credentials.
    final success = await _client.emailIdp.login(
      email: email,
      password: password,
    );
    await _applyAuthSuccess(success);
    return _client.auth.ensureProfile();
  }

  /// Sign out from the current device and clear secure storage.
  Future<void> signOut() async {
    final manager = _client.authKeyProvider as FlutterAuthSessionManager;
    await manager.signOutDevice();
  }

  /// Apply Serverpod AuthSuccess so subsequent calls are authenticated.
  /// The session manager persists the JWT to secure storage.
  Future<void> _applyAuthSuccess(AuthSuccess success) async {
    final manager = _client.authKeyProvider as FlutterAuthSessionManager;
    await manager.updateSignedInUser(success);
  }
}

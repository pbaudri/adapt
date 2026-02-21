import 'package:adapt_client/src/protocol/auth_token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';
import '../../domain/auth_state.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState.initial();

  Future<void> signIn(String email, String password) async {
    state = const AuthState.loading();
    try {
      final token = await ref
          .read(authRepositoryProvider)
          .signInWithEmail(email, password);
      state = AuthState.authenticated(token);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<AuthToken?> startSignUp(String email) async {
    state = const AuthState.loading();
    try {
      // Registration is a two-step flow:
      // 1. startRegistration sends a verification email.
      // 2. After the user clicks the link they get a registrationToken.
      // The verification screen is not yet implemented — set state back to
      // initial so the caller can show a "check your email" message.
      await ref.read(authRepositoryProvider).startRegistration(email);
      state = const AuthState.initial();
      return null;
    } catch (e) {
      state = AuthState.error(e.toString());
      return null;
    }
  }

  Future<void> finishSignUp(String registrationToken, String password) async {
    state = const AuthState.loading();
    try {
      final token = await ref
          .read(authRepositoryProvider)
          .finishRegistration(registrationToken, password);
      state = AuthState.authenticated(token);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> continueAsGuest() async {
    state = const AuthState.loading();
    try {
      final token =
          await ref.read(authRepositoryProvider).continueAsGuest();
      state = AuthState.authenticated(token);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void clearError() {
    state = const AuthState.initial();
  }
}

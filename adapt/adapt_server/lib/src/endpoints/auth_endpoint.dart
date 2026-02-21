import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Handles guest session creation.
///
/// Email sign-in and sign-up are handled by the built-in EmailIdpEndpoint.
/// This endpoint creates user profiles for newly authenticated users and
/// provides guest-mode access.
class AuthEndpoint extends Endpoint {
  /// Creates a guest-mode user profile and returns a placeholder token.
  Future<AuthToken> continueAsGuest(Session session) async {
    final guestKey = 'guest_${DateTime.now().millisecondsSinceEpoch}';
    return AuthToken(key: guestKey, userId: 'guest', isGuest: true);
  }

  /// Ensures a UserProfile exists for the authenticated user.
  ///
  /// Called by the client after a successful sign-in or sign-up via
  /// the email IDP flow. Creates a default profile on first sign-in.
  Future<AuthToken> ensureProfile(Session session) async {
    final auth = session.authenticated;
    if (auth == null) throw Exception('Not authenticated.');

    final userId = auth.userIdentifier;

    var profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (profile == null) {
      profile = UserProfile(
        userId: userId,
        isGuest: false,
        weightUnit: WeightUnit.kg,
        heightUnit: HeightUnit.cm,
        goal: UserGoal.stayAware,
        eatingStyle: EatingStyle.mixed,
        alcoholHabit: AlcoholHabit.rarely,
        alcoholTracking: true,
        morningRecap: true,
        updatedAt: DateTime.now(),
      );
      profile = await UserProfile.db.insertRow(session, profile);
    }

    return AuthToken(key: '', userId: userId, isGuest: false);
  }
}

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart' hide UserProfile;
import 'package:serverpod_auth_idp_server/providers/email.dart';

import '../generated/protocol.dart';

/// Handles guest session creation.
///
/// Email sign-in and sign-up are handled by the built-in EmailIdpEndpoint.
/// This endpoint creates user profiles for newly authenticated users and
/// provides guest-mode access.
class AuthEndpoint extends Endpoint {
  /// Creates a guest-mode user profile and returns a placeholder token.
  ///
  /// A UserProfile row is inserted into the DB with [isGuest] = true so that
  /// server-side history and profile queries can reference the guest.
  /// The guest session key is not a real Serverpod auth token; authenticated
  /// endpoints remain inaccessible from the client — all guest data operations
  /// are handled client-side.
  Future<AuthToken> continueAsGuest(Session session) async {
    final guestId = 'guest_${DateTime.now().millisecondsSinceEpoch}';

    final profile = UserProfile(
      userId: guestId,
      isGuest: true,
      weightUnit: WeightUnit.kg,
      heightUnit: HeightUnit.cm,
      goal: UserGoal.stayAware,
      eatingStyle: EatingStyle.mixed,
      alcoholHabit: AlcoholHabit.rarely,
      alcoholTracking: true,
      morningRecap: true,
      updatedAt: DateTime.now(),
    );
    await UserProfile.db.insertRow(session, profile);

    return AuthToken(key: guestId, userId: guestId, isGuest: true);
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

  /// Creates a new account directly, bypassing email verification.
  ///
  /// Intended for development/testing environments where the email
  /// verification flow cannot be completed. In production this should be
  /// replaced by the standard startRegistration → verify → finishRegistration
  /// flow exposed by Serverpod's built-in EmailIdpEndpoint.
  ///
  /// On success returns an [AuthToken] the client can use to authenticate
  /// immediately (the caller should follow up with a normal sign-in to obtain
  /// a JWT via [EmailIdpEndpoint.login]).
  Future<AuthToken> signUpWithEmail(
    Session session,
    String email,
    String password,
  ) async {
    // 1. Create a Serverpod auth user record.
    final authUser = await AuthServices.instance.authUsers.create(session);

    // 2. Attach an email/password credential to that user — no verification
    //    code needed because we go through the admin API.
    await AuthServices.instance.emailIdp.admin.createEmailAuthentication(
      session,
      authUserId: authUser.id,
      email: email,
      password: password,
    );

    // 3. Create an Adapt UserProfile for the new user so onboarding works.
    final userId = authUser.id.toString();
    final profile = UserProfile(
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
    await UserProfile.db.insertRow(session, profile);

    return AuthToken(key: '', userId: userId, isGuest: false);
  }
}

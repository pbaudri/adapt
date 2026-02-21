import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Saves onboarding step data to the user's profile.
///
/// Each method corresponds to one onboarding screen. All writes go to
/// user_profiles and keep units in SI (kg, cm).
class OnboardingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> saveName(Session session, String name) async {
    final userId = session.authenticated!.userIdentifier;
    await _updateProfile(session, userId, (p) => p.copyWith(name: name));
  }

  Future<void> saveEatingStyle(Session session, EatingStyle style) async {
    final userId = session.authenticated!.userIdentifier;
    await _updateProfile(
      session,
      userId,
      (p) => p.copyWith(eatingStyle: style),
    );
  }

  Future<void> saveGoal(Session session, UserGoal goal) async {
    final userId = session.authenticated!.userIdentifier;
    await _updateProfile(session, userId, (p) => p.copyWith(goal: goal));
  }

  Future<void> saveAlcoholHabit(Session session, AlcoholHabit habit) async {
    final userId = session.authenticated!.userIdentifier;
    await _updateProfile(
      session,
      userId,
      (p) => p.copyWith(alcoholHabit: habit),
    );
  }

  /// Saves personal info. All values must already be in SI units.
  ///
  /// [weightKg] — weight in kg (conversion happens on client, never here).
  /// [heightCm] — height in cm (conversion happens on client, never here).
  Future<void> savePersonalInfo(
    Session session,
    int age,
    BiologicalSex biologicalSex,
    double weightKg,
    double heightCm,
  ) async {
    final userId = session.authenticated!.userIdentifier;
    await _updateProfile(
      session,
      userId,
      (p) => p.copyWith(
        age: age,
        biologicalSex: biologicalSex,
        weightKg: weightKg,
        heightCm: heightCm,
        updatedAt: DateTime.now(),
      ),
    );
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  Future<void> _updateProfile(
    Session session,
    String userId,
    UserProfile Function(UserProfile) updater,
  ) async {
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

    await UserProfile.db.updateRow(session, updater(profile));
  }
}

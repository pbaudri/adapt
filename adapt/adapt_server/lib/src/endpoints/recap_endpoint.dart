import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/nutrition_service.dart';
import '../services/recap_service.dart';

/// Provides morning recap data for the authenticated user.
class RecapEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns today's morning recap, generating one if needed.
  ///
  /// Returns `null` if there is no data for yesterday (first day of use).
  Future<MorningRecap?> getMorningRecap(Session session) async {
    final userId = session.authenticated!.userIdentifier;

    final profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final targetKcal = _computeTarget(profile);
    final userName = profile?.name ?? 'there';

    return RecapService.getOrGenerate(
      session,
      userId: userId,
      userName: userName,
      targetKcal: targetKcal,
    );
  }

  /// Marks a recap as seen by the user.
  Future<void> markRecapSeen(Session session, int recapId) async {
    await RecapService.markSeen(session, recapId: recapId);
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  int _computeTarget(UserProfile? profile) {
    if (profile == null) return 2000;
    if (profile.weightKg == null ||
        profile.heightCm == null ||
        profile.age == null ||
        profile.biologicalSex == null) {
      return 2000;
    }
    return NutritionService.estimateDailyTarget(
      weightKg: profile.weightKg!,
      heightCm: profile.heightCm!,
      age: profile.age!,
      biologicalSex: profile.biologicalSex!,
      goal: profile.goal,
    );
  }
}

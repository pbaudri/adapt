import 'package:adapt_client/src/protocol/client.dart';
import 'package:adapt_client/src/protocol/enums/alcohol_habit.dart';
import 'package:adapt_client/src/protocol/enums/biological_sex.dart';
import 'package:adapt_client/src/protocol/enums/eating_style.dart';
import 'package:adapt_client/src/protocol/enums/user_goal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'onboarding_repository.g.dart';

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  return OnboardingRepository(ref.watch(adaptClientProvider));
}

class OnboardingRepository {
  const OnboardingRepository(this._client);

  final Client _client;

  Future<void> saveName(String name) {
    return _client.onboarding.saveName(name);
  }

  Future<void> saveEatingStyle(EatingStyle style) {
    return _client.onboarding.saveEatingStyle(style);
  }

  Future<void> saveGoal(UserGoal goal) {
    return _client.onboarding.saveGoal(goal);
  }

  Future<void> saveAlcoholHabit(AlcoholHabit habit) {
    return _client.onboarding.saveAlcoholHabit(habit);
  }

  /// [weightKg] and [heightCm] must already be in SI units.
  /// Unit conversion must happen before calling this method.
  Future<void> savePersonalInfo({
    required int age,
    required BiologicalSex biologicalSex,
    required double weightKg,
    required double heightCm,
  }) {
    return _client.onboarding.savePersonalInfo(
      age,
      biologicalSex,
      weightKg,
      heightCm,
    );
  }
}

import 'package:adapt_client/adapt_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/onboarding_repository.dart';
import '../../domain/onboarding_state.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() => const OnboardingState.initial();

  Future<bool> saveName(String name) => _run(
    () => ref.read(onboardingRepositoryProvider).saveName(name),
  );

  Future<bool> saveEatingStyle(EatingStyle style) => _run(
    () => ref.read(onboardingRepositoryProvider).saveEatingStyle(style),
  );

  Future<bool> saveGoal(UserGoal goal) => _run(
    () => ref.read(onboardingRepositoryProvider).saveGoal(goal),
  );

  Future<bool> saveAlcoholHabit(AlcoholHabit habit) => _run(
    () => ref.read(onboardingRepositoryProvider).saveAlcoholHabit(habit),
  );

  Future<bool> savePersonalInfo({
    required int age,
    required BiologicalSex biologicalSex,
    required double weightKg,
    required double heightCm,
  }) => _run(
    () => ref.read(onboardingRepositoryProvider).savePersonalInfo(
      age: age,
      biologicalSex: biologicalSex,
      weightKg: weightKg,
      heightCm: heightCm,
    ),
  );

  /// Returns true on success, false on error.
  /// Guest users skip server calls — their preferences stay local.
  Future<bool> _run(Future<void> Function() action) async {
    final isGuest = ref.read(authNotifierProvider).maybeWhen(
      authenticated: (token) => token.isGuest,
      orElse: () => false,
    );
    if (isGuest) {
      state = const OnboardingState.success();
      return true;
    }

    state = const OnboardingState.loading();
    try {
      await action();
      state = const OnboardingState.success();
      return true;
    } catch (e) {
      state = OnboardingState.error(e.toString());
      return false;
    }
  }

  void reset() => state = const OnboardingState.initial();
}

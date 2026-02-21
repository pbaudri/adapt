import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/profile_repository.dart';

part 'profile_provider.g.dart';

UserProfile _guestProfile() => UserProfile(
  userId: 'guest',
  isGuest: true,
  weightUnit: WeightUnit.kg,
  heightUnit: HeightUnit.cm,
  goal: UserGoal.eatBetter,
  eatingStyle: EatingStyle.mixed,
  alcoholHabit: AlcoholHabit.rarely,
  alcoholTracking: false,
  morningRecap: false,
  updatedAt: DateTime.now(),
  heightCm: 190,
  weightKg: 90,
);

/// Loads and caches the user profile.
@riverpod
Future<UserProfile> userProfile(Ref ref) {
  final isGuest = ref
      .watch(authNotifierProvider)
      .maybeWhen(
        authenticated: (token) => token.isGuest,
        orElse: () => false,
      );
  if (isGuest) return Future.value(_guestProfile());
  return ref.watch(profileRepositoryProvider).getProfile();
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<UserProfile> build() {
    final isGuest = ref
        .watch(authNotifierProvider)
        .maybeWhen(
          authenticated: (token) => token.isGuest,
          orElse: () => false,
        );
    if (isGuest) return Future.value(_guestProfile());
    return ref.watch(profileRepositoryProvider).getProfile();
  }

  Future<void> updateWeight(double weightKg) => _update(
    () => ref.read(profileRepositoryProvider).updateWeight(weightKg),
  );

  Future<void> updateHeight(double heightCm) => _update(
    () => ref.read(profileRepositoryProvider).updateHeight(heightCm),
  );

  Future<void> updateAge(int age) => _update(
    () => ref.read(profileRepositoryProvider).updateAge(age),
  );

  Future<void> updateGoal(UserGoal goal) => _update(
    () => ref.read(profileRepositoryProvider).updateGoal(goal),
  );

  Future<void> updateWeightUnit(WeightUnit unit) => _update(
    () => ref.read(profileRepositoryProvider).updateWeightUnit(unit),
  );

  Future<void> updateHeightUnit(HeightUnit unit) => _update(
    () => ref.read(profileRepositoryProvider).updateHeightUnit(unit),
  );

  Future<void> updatePreferences({
    required bool alcoholTracking,
    required bool morningRecap,
  }) => _update(
    () => ref
        .read(profileRepositoryProvider)
        .updatePreferences(
          alcoholTracking: alcoholTracking,
          morningRecap: morningRecap,
        ),
  );

  Future<void> deleteAllData() async {
    await ref.read(profileRepositoryProvider).deleteAllData();
    ref.invalidateSelf();
  }

  bool get _isGuest => ref
      .read(authNotifierProvider)
      .maybeWhen(
        authenticated: (token) => token.isGuest,
        orElse: () => false,
      );

  Future<void> _update(Future<UserProfile> Function() action) async {
    if (_isGuest) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(action);
  }
}

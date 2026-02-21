import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'profile_repository.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(adaptClientProvider));
}

class ProfileRepository {
  const ProfileRepository(this._client);

  final Client _client;

  Future<UserProfile> getProfile() {
    return _client.profile.getProfile();
  }

  /// [weightKg] must be in SI (kg). Use unit_converter.dart before calling.
  Future<UserProfile> updateWeight(double weightKg) {
    return _client.profile.updateWeight(weightKg);
  }

  /// [heightCm] must be in SI (cm). Use unit_converter.dart before calling.
  Future<UserProfile> updateHeight(double heightCm) {
    return _client.profile.updateHeight(heightCm);
  }

  Future<UserProfile> updateAge(int age) {
    return _client.profile.updateAge(age);
  }

  Future<UserProfile> updateGoal(UserGoal goal) {
    return _client.profile.updateGoal(goal);
  }

  Future<UserProfile> updateWeightUnit(WeightUnit unit) {
    return _client.profile.updateWeightUnit(unit);
  }

  Future<UserProfile> updateHeightUnit(HeightUnit unit) {
    return _client.profile.updateHeightUnit(unit);
  }

  Future<UserProfile> updatePreferences({
    required bool alcoholTracking,
    required bool morningRecap,
  }) {
    return _client.profile.updatePreferences(alcoholTracking, morningRecap);
  }

  Future<void> deleteAllData() {
    return _client.profile.deleteAllData();
  }
}

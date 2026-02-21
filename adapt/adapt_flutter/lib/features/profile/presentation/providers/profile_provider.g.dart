// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileHash() => r'18f55a735f69310a7773018d2a0b602deee294f4';

/// Loads and caches the user profile.
///
/// Copied from [userProfile].
@ProviderFor(userProfile)
final userProfileProvider = AutoDisposeFutureProvider<UserProfile>.internal(
  userProfile,
  name: r'userProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserProfileRef = AutoDisposeFutureProviderRef<UserProfile>;
String _$profileNotifierHash() => r'0165e1b17b1ccd5a710ef58d57ab1b22948ea918';

/// See also [ProfileNotifier].
@ProviderFor(ProfileNotifier)
final profileNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProfileNotifier, UserProfile>.internal(
      ProfileNotifier.new,
      name: r'profileNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProfileNotifier = AutoDisposeAsyncNotifier<UserProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

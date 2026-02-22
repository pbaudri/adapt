// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeDataHash() => r'3f4e0141cec6218719473aa8faaac87c6b4eebd9';

/// Fetches and caches home screen data.
/// Call [ref.invalidate(homeDataProvider)] to force a refresh.
///
/// Copied from [homeData].
@ProviderFor(homeData)
final homeDataProvider = AutoDisposeFutureProvider<HomeData>.internal(
  homeData,
  name: r'homeDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HomeDataRef = AutoDisposeFutureProviderRef<HomeData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

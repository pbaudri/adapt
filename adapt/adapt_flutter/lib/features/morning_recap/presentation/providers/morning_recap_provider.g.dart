// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'morning_recap_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$morningRecapHash() => r'ae46a77aae0d420a576b125c04abd0c24cb0c800';

/// Fetches today's morning recap.
///
/// Copied from [morningRecap].
@ProviderFor(morningRecap)
final morningRecapProvider = AutoDisposeFutureProvider<MorningRecap?>.internal(
  morningRecap,
  name: r'morningRecapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$morningRecapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MorningRecapRef = AutoDisposeFutureProviderRef<MorningRecap?>;
String _$morningRecapNotifierHash() =>
    r'6a482f39e3288f1b9305192dd7214698654e2035';

/// See also [MorningRecapNotifier].
@ProviderFor(MorningRecapNotifier)
final morningRecapNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      MorningRecapNotifier,
      MorningRecap?
    >.internal(
      MorningRecapNotifier.new,
      name: r'morningRecapNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$morningRecapNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MorningRecapNotifier = AutoDisposeAsyncNotifier<MorningRecap?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

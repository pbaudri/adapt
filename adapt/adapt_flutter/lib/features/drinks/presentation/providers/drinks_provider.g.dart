// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$drinkReferenceHash() => r'd774ae941a0016c55cbfe72a13b8bd1e0676f42e';

/// Static drink reference data — loaded once and kept alive.
///
/// Copied from [drinkReference].
@ProviderFor(drinkReference)
final drinkReferenceProvider = FutureProvider<List<DrinkReference>>.internal(
  drinkReference,
  name: r'drinkReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$drinkReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DrinkReferenceRef = FutureProviderRef<List<DrinkReference>>;
String _$drinksNotifierHash() => r'8d2f9be8732c16d230b8333ab31464207b30ad3d';

/// See also [DrinksNotifier].
@ProviderFor(DrinksNotifier)
final drinksNotifierProvider =
    AutoDisposeNotifierProvider<DrinksNotifier, DrinksState>.internal(
      DrinksNotifier.new,
      name: r'drinksNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$drinksNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DrinksNotifier = AutoDisposeNotifier<DrinksState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

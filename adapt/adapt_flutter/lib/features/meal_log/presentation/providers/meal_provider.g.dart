// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todayMealsHash() => r'12a4bcfd1fd05eb21d9a6e0bfca497b9cd3b46ef';

/// Today's meal logs — refreshed after every confirmation.
///
/// Copied from [todayMeals].
@ProviderFor(todayMeals)
final todayMealsProvider = AutoDisposeFutureProvider<List<dynamic>>.internal(
  todayMeals,
  name: r'todayMealsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todayMealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodayMealsRef = AutoDisposeFutureProviderRef<List<dynamic>>;
String _$pendingMealResultHash() => r'aac68dce74068c84000b0377e8932351b6de0287';

/// Exposes the currently-pending MealResult for the result and edit screens.
///
/// Copied from [pendingMealResult].
@ProviderFor(pendingMealResult)
final pendingMealResultProvider = AutoDisposeProvider<MealResult?>.internal(
  pendingMealResult,
  name: r'pendingMealResultProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingMealResultHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingMealResultRef = AutoDisposeProviderRef<MealResult?>;
String _$mealNotifierHash() => r'71875b70cba3d5c0af7b7d4588fb06007ef7c2d2';

/// See also [MealNotifier].
@ProviderFor(MealNotifier)
final mealNotifierProvider =
    AutoDisposeNotifierProvider<MealNotifier, MealState>.internal(
      MealNotifier.new,
      name: r'mealNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$mealNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MealNotifier = AutoDisposeNotifier<MealState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

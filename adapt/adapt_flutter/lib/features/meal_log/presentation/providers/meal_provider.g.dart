// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todayMealsHash() => r'e746d9f1cb8dddc022d360afe4c87c17b013dd04';

/// Today's meal logs — refreshed after every confirmation.
///
/// Copied from [todayMeals].
@ProviderFor(todayMeals)
final todayMealsProvider = AutoDisposeFutureProvider<List<MealLog>>.internal(
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
typedef TodayMealsRef = AutoDisposeFutureProviderRef<List<MealLog>>;
String _$pendingMealResultHash() => r'dc5288eb4fcad3f9a3bdc94cd54b24d9d3c0c6b0';

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
String _$mealNotifierHash() => r'5bd38319f1a5887ebaf6928d0b7db45e0cb85a3b';

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

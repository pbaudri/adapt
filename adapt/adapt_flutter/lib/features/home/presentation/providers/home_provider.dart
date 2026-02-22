import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/home_repository.dart';

part 'home_provider.g.dart';

/// Fetches and caches home screen data.
/// Call [ref.invalidate(homeDataProvider)] to force a refresh.
@riverpod
Future<HomeData> homeData(Ref ref) {
  final isGuest = ref.watch(authNotifierProvider).maybeWhen(
    authenticated: (token) => token.isGuest,
    orElse: () => false,
  );
  if (isGuest) {
    return Future.value(HomeData(
      greeting: 'Welcome',
      dailyKcal: 0,
      targetKcal: 2000,
      adaptiveMessage: 'Sign in to start tracking your nutrition.',
      meals: [],
      mealResults: [],
      totalProteinG: 0.0,
      totalCarbsG: 0.0,
      totalFatG: 0.0,
      hadAlcohol: false,
    ));
  }
  return ref.watch(homeRepositoryProvider).getHomeData();
}

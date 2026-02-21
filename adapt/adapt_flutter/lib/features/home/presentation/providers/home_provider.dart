import 'package:adapt_client/src/protocol/home_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/home_repository.dart';

part 'home_provider.g.dart';

/// Fetches and caches home screen data.
/// Call [ref.invalidate(homeDataProvider)] to force a refresh.
@riverpod
Future<HomeData> homeData(HomeDataRef ref) {
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
    ));
  }
  return ref.watch(homeRepositoryProvider).getHomeData();
}

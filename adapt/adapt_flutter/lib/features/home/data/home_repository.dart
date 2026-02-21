import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository(ref.watch(adaptClientProvider));
}

class HomeRepository {
  const HomeRepository(this._client);

  final Client _client;

  Future<HomeData> getHomeData() {
    return _client.home.getHomeData();
  }
}

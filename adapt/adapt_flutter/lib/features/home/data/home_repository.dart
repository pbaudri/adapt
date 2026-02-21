import 'package:adapt_client/src/protocol/client.dart';
import 'package:adapt_client/src/protocol/home_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(ref.watch(adaptClientProvider));
}

class HomeRepository {
  const HomeRepository(this._client);

  final Client _client;

  Future<HomeData> getHomeData() {
    return _client.home.getHomeData();
  }
}

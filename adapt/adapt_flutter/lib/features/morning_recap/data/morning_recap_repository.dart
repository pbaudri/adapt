import 'package:adapt_client/src/protocol/client.dart';
import 'package:adapt_client/src/protocol/morning_recap.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'morning_recap_repository.g.dart';

@riverpod
MorningRecapRepository morningRecapRepository(MorningRecapRepositoryRef ref) {
  return MorningRecapRepository(ref.watch(adaptClientProvider));
}

class MorningRecapRepository {
  const MorningRecapRepository(this._client);

  final Client _client;

  /// Returns today's recap, generating one if needed.
  /// Returns null if no data exists yet (first day of use).
  Future<MorningRecap?> getMorningRecap() {
    return _client.recap.getMorningRecap();
  }

  Future<void> markRecapSeen(int recapId) {
    return _client.recap.markRecapSeen(recapId);
  }
}

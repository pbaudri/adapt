import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'morning_recap_repository.g.dart';

@riverpod
MorningRecapRepository morningRecapRepository(Ref ref) {
  return MorningRecapRepository(ref.watch(adaptClientProvider));
}

class MorningRecapRepository {
  const MorningRecapRepository(this._client);

  final Client _client;

  /// Returns today's recap, generating one if needed (AI generation).
  /// Only call this from the morning home screen trigger.
  Future<MorningRecap?> getMorningRecap() {
    return _client.recap.getMorningRecap();
  }

  /// Returns today's existing recap without generating a new one.
  /// Use this for display purposes only.
  Future<MorningRecap?> getExistingRecap() {
    return _client.recap.getExistingRecap();
  }

  Future<void> markRecapSeen(int recapId) {
    return _client.recap.markRecapSeen(recapId);
  }
}

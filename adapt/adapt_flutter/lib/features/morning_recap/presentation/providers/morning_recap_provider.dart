import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/morning_recap_repository.dart';

part 'morning_recap_provider.g.dart';

/// Fetches today's morning recap.
@riverpod
Future<MorningRecap?> morningRecap(Ref ref) {
  return ref.watch(morningRecapRepositoryProvider).getMorningRecap();
}

@riverpod
class MorningRecapNotifier extends _$MorningRecapNotifier {
  @override
  Future<MorningRecap?> build() {
    return ref.watch(morningRecapRepositoryProvider).getMorningRecap();
  }

  Future<void> markSeen(int recapId) async {
    await ref.read(morningRecapRepositoryProvider).markRecapSeen(recapId);
    ref.invalidateSelf();
  }
}

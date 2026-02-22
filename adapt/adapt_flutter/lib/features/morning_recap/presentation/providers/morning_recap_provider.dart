import 'package:adapt_client/adapt_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/morning_recap_repository.dart';

part 'morning_recap_provider.g.dart';

@riverpod
class MorningRecapNotifier extends _$MorningRecapNotifier {
  @override
  Future<MorningRecap?> build() {
    // Read-only — never triggers AI generation.
    // Generation is triggered explicitly via generate() from HomeScreen.
    return ref.watch(morningRecapRepositoryProvider).getExistingRecap();
  }

  /// Generates today's recap via the AI if none exists yet.
  /// Only called from HomeScreen during morning hours.
  Future<void> generate() async {
    // Skip if already loaded (no need to call server again).
    if (state.valueOrNull != null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(morningRecapRepositoryProvider).getMorningRecap(),
    );
  }

  /// Marks the recap as seen. Updates state locally to avoid a re-fetch flash.
  Future<void> markSeen(int recapId) async {
    final current = state.valueOrNull;
    await ref.read(morningRecapRepositoryProvider).markRecapSeen(recapId);
    // Update locally so the recap stays visible with seenAt set.
    if (current != null) {
      state = AsyncData(current.copyWith(seenAt: DateTime.now()));
    }
  }
}

import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/drinks_repository.dart';
import '../../domain/drinks_state.dart';

part 'drinks_provider.g.dart';

/// Static drink reference data — loaded once and kept alive.
@Riverpod(keepAlive: true)
Future<List<DrinkReference>> drinkReference(Ref ref) {
  return ref.watch(drinksRepositoryProvider).getDrinkReference();
}

@riverpod
class DrinksNotifier extends _$DrinksNotifier {
  @override
  DrinksState build() => const DrinksState.initial();

  Future<void> logDrinks(DrinkType drinkType, int quantity) async {
    state = const DrinksState.loading();
    try {
      final summary = await ref
          .read(drinksRepositoryProvider)
          .logDrinks(drinkType, quantity);
      state = DrinksState.logged(summary);
    } catch (e) {
      state = DrinksState.error(e.toString());
    }
  }

  void reset() => state = const DrinksState.initial();
}

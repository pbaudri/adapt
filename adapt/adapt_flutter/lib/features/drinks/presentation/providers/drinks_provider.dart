import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/drinks_repository.dart';
import '../../domain/drinks_state.dart';
import '../../../home/presentation/providers/home_provider.dart';

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

  Future<void> init() async {
    state = const DrinksState.loading();
    try {
      final references = await ref.read(drinkReferenceProvider.future);
      state = DrinksState.success(references, null, 1);
    } catch (e) {
      state = DrinksState.error(e.toString());
    }
  }

  void selectDrink(DrinkType drinkType) {
    state.maybeWhen(
      success: (references, _, quantity) {
        state = DrinksState.success(references, drinkType, quantity);
      },
      orElse: () {},
    );
  }

  void incrementQuantity() {
    state.maybeWhen(
      success: (references, selectedType, quantity) {
        state = DrinksState.success(references, selectedType, quantity + 1);
      },
      orElse: () {},
    );
  }

  void decrementQuantity() {
    state.maybeWhen(
      success: (references, selectedType, quantity) {
        state = DrinksState.success(
          references,
          selectedType,
          (quantity - 1).clamp(1, 99),
        );
      },
      orElse: () {},
    );
  }

  Future<void> logDrinks() async {
    final currentState = state;
    DrinkType? drinkType;
    int quantity = 1;

    currentState.maybeWhen(
      success: (references, selectedType, qty) {
        drinkType = selectedType;
        quantity = qty;
      },
      orElse: () {},
    );

    if (drinkType == null) return;

    state = const DrinksState.loading();
    try {
      final summary = await ref
          .read(drinksRepositoryProvider)
          .logDrinks(drinkType!, quantity);
      ref.invalidate(homeDataProvider);
      state = DrinksState.logged(summary);
    } catch (e) {
      state = DrinksState.error(e.toString());
    }
  }

  void reset() => state = const DrinksState.initial();
}

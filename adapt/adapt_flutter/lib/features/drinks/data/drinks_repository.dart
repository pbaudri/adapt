import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'drinks_repository.g.dart';

@riverpod
DrinksRepository drinksRepository(Ref ref) {
  return DrinksRepository(ref.watch(adaptClientProvider));
}

class DrinksRepository {
  const DrinksRepository(this._client);

  final Client _client;

  Future<List<DrinkReference>> getDrinkReference() {
    return _client.drink.getDrinkReference();
  }

  Future<DailySummary> logDrinks(DrinkType drinkType, int quantity) {
    return _client.drink.logDrinks(drinkType, quantity);
  }

  Future<List<DrinkLog>> getTodayDrinks() {
    return _client.drink.getTodayDrinks();
  }
}

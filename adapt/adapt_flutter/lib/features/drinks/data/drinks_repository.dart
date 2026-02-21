import 'package:adapt_client/src/protocol/client.dart';
import 'package:adapt_client/src/protocol/daily_summary.dart';
import 'package:adapt_client/src/protocol/drink_log.dart';
import 'package:adapt_client/src/protocol/drink_reference.dart';
import 'package:adapt_client/src/protocol/enums/drink_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'drinks_repository.g.dart';

@riverpod
DrinksRepository drinksRepository(DrinksRepositoryRef ref) {
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

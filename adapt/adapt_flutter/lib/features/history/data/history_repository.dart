import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'history_repository.g.dart';

@riverpod
HistoryRepository historyRepository(Ref ref) {
  return HistoryRepository(ref.watch(adaptClientProvider));
}

class HistoryRepository {
  const HistoryRepository(this._client);

  final Client _client;

  Future<List<DailySummary>> getWeekSummary(DateTime weekStartDate) {
    return _client.history.getWeekSummary(weekStartDate);
  }

  Future<DayDetail> getDayDetail(DateTime date) {
    return _client.history.getDayDetail(date);
  }
}

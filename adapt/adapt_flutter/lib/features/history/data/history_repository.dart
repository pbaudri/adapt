import 'package:adapt_client/src/protocol/client.dart';
import 'package:adapt_client/src/protocol/daily_summary.dart';
import 'package:adapt_client/src/protocol/day_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/client/adapt_client_provider.dart';

part 'history_repository.g.dart';

@riverpod
HistoryRepository historyRepository(HistoryRepositoryRef ref) {
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

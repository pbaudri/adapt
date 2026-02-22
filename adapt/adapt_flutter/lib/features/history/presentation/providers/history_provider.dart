import 'package:adapt_client/adapt_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/history_repository.dart';

part 'history_provider.g.dart';

/// Returns week summary for [weekStartDate].
/// Automatically re-fetches when [weekStartDate] changes.
@riverpod
Future<List<DailySummary>> weekSummary(
  Ref ref,
  DateTime weekStartDate,
) {
  final isGuest = ref.watch(authNotifierProvider).maybeWhen(
    authenticated: (token) => token.isGuest,
    orElse: () => false,
  );
  if (isGuest) return Future.value([]);
  return ref.watch(historyRepositoryProvider).getWeekSummary(weekStartDate);
}

/// Returns full day detail for [date].
@riverpod
Future<DayDetail> dayDetail(Ref ref, DateTime date) {
  final isGuest = ref.watch(authNotifierProvider).maybeWhen(
    authenticated: (token) => token.isGuest,
    orElse: () => false,
  );
  if (isGuest) {
    return Future.value(DayDetail(
      summary: DailySummary(
        userId: 'guest',
        date: date,
        totalKcal: 0,
        totalProteinG: 0,
        totalCarbsG: 0,
        totalFatG: 0,
        hadAlcohol: false,
        mealEmojis: '[]',
        morningRecapSent: false,
      ),
      meals: [],
      mealResults: [],
      drinks: [],
    ));
  }
  return ref.watch(historyRepositoryProvider).getDayDetail(date);
}

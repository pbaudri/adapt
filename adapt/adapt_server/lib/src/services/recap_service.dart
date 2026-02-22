import 'dart:convert';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'ai_service.dart';
import 'daily_summary_service.dart';

/// Generates and stores morning recaps.
///
/// A recap is created once per day, after the previous day's summary is final.
/// The AI generates zero-judgment content based on yesterday's intake.
abstract final class RecapService {
  /// Returns today's morning recap for [userId], generating one if needed.
  ///
  /// Returns `null` if there is no data for yesterday (new user, first day).
  static Future<MorningRecap?> getOrGenerate(
    Session session, {
    required String userId,
    required String userName,
    required int targetKcal,
  }) async {
    final today = DateTime.now();
    final todayStart = DateTime.utc(today.year, today.month, today.day);

    // Return existing recap if already generated today — always, regardless of seenAt.
    // seenAt only controls the auto-show trigger on the client; it never hides the recap.
    final existing = await MorningRecap.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.date.equals(todayStart),
    );
    if (existing != null) return existing;

    // Get yesterday's summary (may be null for new users / first day).
    final yesterday = todayStart.subtract(const Duration(days: 1));
    final summary = await DailySummary.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.date.equals(yesterday),
    );

    // Generate AI recap content.
    // When there is no summary (new user / no data), pass zeros so the AI
    // generates a warm "fresh start" message instead of being skipped.
    final aiContent = await AiService.generateRecap(
      session,
      userName: userName,
      totalKcal: summary?.totalKcal ?? 0,
      proteinG: summary?.totalProteinG ?? 0,
      carbsG: summary?.totalCarbsG ?? 0,
      fatG: summary?.totalFatG ?? 0,
      hadAlcohol: summary?.hadAlcohol ?? false,
      targetKcal: targetKcal,
      noDataYet: summary == null || summary.totalKcal == 0,
    );

    final tipsJson = jsonEncode(aiContent['tips'] ?? []);

    final recap = MorningRecap(
      userId: userId,
      date: todayStart,
      headline: aiContent['headline'] as String? ?? 'Good morning.',
      subMessage: aiContent['sub_message'] as String? ??
          'Here is how yesterday looked.',
      tips: tipsJson,
    );

    final saved = await MorningRecap.db.insertRow(session, recap);

    // Mark yesterday's summary as recap-sent (only if a summary exists).
    if (summary != null) {
      await DailySummaryService.markRecapSent(
        session,
        userId: userId,
        date: yesterday,
      );
    }

    return saved;
  }

  /// Marks a recap as seen by the user.
  static Future<void> markSeen(
    Session session, {
    required int recapId,
  }) async {
    final recap = await MorningRecap.db.findById(session, recapId);
    if (recap == null) return;

    await MorningRecap.db.updateRow(
      session,
      recap.copyWith(seenAt: DateTime.now()),
    );
  }
}

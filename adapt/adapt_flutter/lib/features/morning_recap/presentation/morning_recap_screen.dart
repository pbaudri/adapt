import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'providers/morning_recap_provider.dart';
import 'widgets/recap_tips_section.dart';

class MorningRecapScreen extends ConsumerWidget {
  const MorningRecapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recapAsync = ref.watch(morningRecapNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing16,
                bottom: 0,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.textSecondary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: recapAsync.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(
                  child: Text(
                    'Could not load your recap.',
                    style: AppTextStyles.bodyMedium,
                  ),
                ),
                data: (recap) {
                  if (recap == null) {
                    return Center(
                      child: Padding(
                        padding: AppDimensions.screenPadding,
                        child: Text(
                          'No recap yet. Come back tomorrow morning.',
                          style: AppTextStyles.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    padding: AppDimensions.screenPadding.copyWith(
                      top: AppDimensions.spacing32,
                      bottom: AppDimensions.spacing24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AdaptPageHeader(
                          title: recap.headline,
                          subtitle: recap.subMessage,
                        ),
                        const SizedBox(height: AppDimensions.spacing32),
                        const AdaptSectionTitle(label: "Today's vibe"),
                        const SizedBox(height: AppDimensions.spacing16),
                        RecapTipsSection(tipsJson: recap.tips),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing12,
                bottom: AppDimensions.spacing32,
              ),
              child: AdaptSecondaryButton(
                label: 'Got it ✓',
                onTap: () async {
                  final recap = recapAsync.valueOrNull;
                  // Only mark seen if not already seen — avoids redundant server calls.
                  if (recap?.id != null && recap!.seenAt == null) {
                    await ref
                        .read(morningRecapNotifierProvider.notifier)
                        .markSeen(recap.id!);
                  }
                  if (context.mounted) context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

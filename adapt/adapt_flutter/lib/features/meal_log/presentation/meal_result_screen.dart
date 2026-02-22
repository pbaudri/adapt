import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../home/presentation/providers/home_provider.dart';
import 'providers/meal_provider.dart';
import 'widgets/meal_nutrient_summary.dart';

class MealResultScreen extends ConsumerWidget {
  const MealResultScreen({super.key, this.preloadedResult});

  /// Set when navigating from home/history to view an already-confirmed meal.
  /// When non-null, action buttons are hidden (meal is already logged).
  final MealResult? preloadedResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingResult = ref.watch(pendingMealResultProvider);
    // preloadedResult takes priority (viewing an already-confirmed meal).
    final result = preloadedResult ?? pendingResult;
    final isViewing = preloadedResult != null;

    final mealState = ref.watch(mealNotifierProvider);
    final isConfirming = mealState.maybeWhen(
      loading: (_) => true,
      orElse: () => false,
    );

    // Navigate to home when confirmed (only relevant during active meal logging)
    ref.listen(mealNotifierProvider, (_, next) {
      next.maybeWhen(
        confirmed: (_) {
          ref.invalidate(homeDataProvider);
          context.go(AppRoutes.home);
        },
        orElse: () {},
      );
    });

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
                  AdaptBackButton(),
                  const Spacer(),
                  Text('Meal result', style: AppTextStyles.titleMedium),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: AppDimensions.screenPadding.copyWith(
                  top: AppDimensions.spacing24,
                  bottom: AppDimensions.spacing24,
                ),
                child: result == null
                    ? Center(
                        child: Text(
                          'No meal result available.',
                          style: AppTextStyles.bodyMedium,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: AdaptIconHero(
                              size: 80,
                              child: const Text(
                                '🍽',
                                style: TextStyle(fontSize: 36),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppDimensions.spacing16),
                          Text(
                            result.name,
                            style: AppTextStyles.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppDimensions.spacing8),
                          Text(
                            result.source.name == 'userCorrected'
                                ? 'User corrected'
                                : 'AI estimated',
                            style: AppTextStyles.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppDimensions.spacing24),
                          MealNutrientSummary(
                            calories: result.caloriesKcal,
                            proteinG: result.proteinG,
                            carbsG: result.carbsG,
                            fatG: result.fatG,
                          ),
                          const SizedBox(height: AppDimensions.spacing24),
                          AdaptInfoCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result.aiMessage,
                                  style: AppTextStyles.bodyLarge,
                                ),
                                if (result.aiTip != null) ...[
                                  const SizedBox(
                                    height: AppDimensions.spacing12,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: AppDimensions.spacing12,
                                  ),
                                  Text(
                                    result.aiTip!,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            if (!isViewing)
              Padding(
                padding: AppDimensions.screenPadding.copyWith(
                  top: AppDimensions.spacing12,
                  bottom: AppDimensions.spacing32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AdaptPrimaryButton(
                      label: 'Add to my day',
                      isDisabled: result == null,
                      isLoading: isConfirming,
                      onTap: () {
                        if (result == null) return;
                        ref
                            .read(mealNotifierProvider.notifier)
                            .confirm(result.mealLogId);
                      },
                      trailing: const Icon(
                        Icons.check_rounded,
                        color: AppColors.textPrimary,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing12),
                    AdaptTextLink(
                      label: 'Not right? Correct it ✏',
                      onTap: () => context.push(AppRoutes.mealEdit),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

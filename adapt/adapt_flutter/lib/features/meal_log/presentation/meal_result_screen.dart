import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../home/presentation/providers/home_provider.dart';
import 'providers/meal_provider.dart';
import 'widgets/meal_nutrient_summary.dart';

class MealResultScreen extends ConsumerWidget {
  const MealResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(pendingMealResultProvider);

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
                          const SizedBox(height: AppDimensions.spacing24),
                          MealNutrientSummary(
                            calories: result.caloriesKcal,
                            proteinG: result.proteinG,
                            carbsG: result.carbsG,
                            fatG: result.fatG,
                          ),
                          const SizedBox(height: AppDimensions.spacing24),
                          AdaptInsightCard(
                            title: result.aiTip ?? 'Looks good',
                            subtitle: result.aiMessage,
                          ),
                        ],
                      ),
              ),
            ),
            Padding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing12,
                bottom: AppDimensions.spacing32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AdaptPrimaryButton(
                    label: 'Confirm & log',
                    isDisabled: result == null,
                    onTap: () async {
                      if (result == null) return;
                      await ref
                          .read(mealNotifierProvider.notifier)
                          .confirmMeal(result.mealLogId);
                      if (context.mounted) {
                        ref.invalidate(homeDataProvider);
                        context.go(AppRoutes.home);
                      }
                    },
                  ),
                  const SizedBox(height: AppDimensions.spacing12),
                  AdaptSecondaryButton(
                    label: 'Edit values',
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

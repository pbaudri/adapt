import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/meal_nutrient_summary.dart';

class MealResultScreen extends StatelessWidget {
  const MealResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: AdaptIconHero(
                        size: 80,
                        child: const Text(
                          '🍔',
                          style: TextStyle(fontSize: 36),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing16),
                    Text(
                      'Big Mac Menu',
                      style: AppTextStyles.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimensions.spacing24),
                    const MealNutrientSummary(
                      calories: 1040,
                      proteinG: 42,
                      carbsG: 103,
                      fatG: 47,
                    ),
                    const SizedBox(height: AppDimensions.spacing24),
                    const AdaptInsightCard(
                      title: 'Solid fuel',
                      subtitle:
                          'This meal covers a good chunk of your daily protein. '
                          'You have room for a lighter dinner.',
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
                    onTap: () => context.go(AppRoutes.home),
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

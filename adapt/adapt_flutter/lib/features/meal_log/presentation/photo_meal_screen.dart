import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/meal_action_row.dart';

class PhotoMealScreen extends StatelessWidget {
  const PhotoMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.screenPadding.copyWith(
            top: AppDimensions.spacing16,
            bottom: AppDimensions.spacing32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  AdaptBackButton(),
                  const Spacer(),
                  Text('Log a meal', style: AppTextStyles.titleMedium),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing24),
              AdaptCameraPreview(
                label: 'Tap to take a photo of your meal',
                onTap: () {},
              ),
              const SizedBox(height: AppDimensions.spacing24),
              MealActionRow(
                onPhoto: () {},
                onDescribe: () => context.go(AppRoutes.mealDescribe),
                onGallery: () {},
              ),
              const Spacer(),
              AdaptPrimaryButton(
                label: 'Analyse meal',
                onTap: () => context.push(AppRoutes.mealResult),
                trailing: const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.textPrimary,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

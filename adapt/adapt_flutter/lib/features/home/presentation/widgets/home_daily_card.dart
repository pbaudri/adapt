import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../providers/home_provider.dart';

/// Daily calorie summary card with insight and quick drink log shortcut.
class HomeDailyCard extends ConsumerWidget {
  const HomeDailyCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeDataProvider);

    return homeAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text(
        "Could not load today's summary.",
        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
      ),
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdaptInsightCard(
            title: '${data.dailyKcal} kcal today',
            subtitle: data.adaptiveMessage,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          Row(
            children: [
              Expanded(
                child: NutrientChip(
                  label: 'Protein',
                  value: '${data.meals.fold<double>(0, (s, m) => s).round()}g',
                  color: AppColors.protein,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing8),
              Expanded(
                child: NutrientChip(
                  label: 'Carbs',
                  value: '—',
                  color: AppColors.carbs,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing8),
              Expanded(
                child: NutrientChip(
                  label: 'Fat',
                  value: '—',
                  color: AppColors.fat,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptQuickAddChip(
            leading: const Icon(
              Icons.local_bar_rounded,
              color: AppColors.primary,
              size: 16,
            ),
            label: 'Log drinks',
            onTap: () => context.push(AppRoutes.drinks),
          ),
        ],
      ),
    );
  }
}

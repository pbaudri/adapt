import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// List of morning recap tips with coloured icon containers.
class RecapTipsSection extends StatelessWidget {
  const RecapTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdaptRecapTipItem(
          leading: const Icon(
            Icons.eco_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
          backgroundColor: AppColors.carbs,
          title: 'Add some greens at lunch',
          subtitle:
              'Yesterday was light on vegetables. A side salad goes a long way.',
        ),
        AdaptRecapTipItem(
          leading: const Icon(
            Icons.fitness_center_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
          backgroundColor: AppColors.protein,
          title: 'Good protein day',
          subtitle: 'You hit 82 g. That is above your average — keep it up.',
        ),
        AdaptRecapTipItem(
          leading: const Icon(
            Icons.water_drop_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
          backgroundColor: AppColors.primary,
          title: 'Stay hydrated',
          subtitle: 'Alcohol dehydrates. Start the day with a big glass of water.',
        ),
      ],
    );
  }
}

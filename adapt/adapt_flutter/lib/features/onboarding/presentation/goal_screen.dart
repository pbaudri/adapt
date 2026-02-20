import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/onboarding_scaffold.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String? _selected;

  static const _options = [
    (
      value: 'lose_weight',
      title: 'Lose weight',
      description: 'Gradually, without obsessing over every calorie.',
      icon: Icons.trending_down_rounded,
    ),
    (
      value: 'eat_better',
      title: 'Eat better',
      description: 'More variety, better balance — no crash diets.',
      icon: Icons.eco_rounded,
    ),
    (
      value: 'stay_aware',
      title: 'Stay aware',
      description: 'Just curious what I eat, no specific goal.',
      icon: Icons.visibility_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 3,
      title: "What's your main goal?",
      subtitle: 'We adapt your daily target around this.',
      isNextEnabled: _selected != null,
      onNext: () => context.push(AppRoutes.onboardingAlcohol),
      content: Column(
        children: _options
            .map(
              (o) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spacing12),
                child: AdaptSelectionCard(
                  leading: Icon(
                    o.icon,
                    color: AppColors.primary,
                    size: 24,
                  ),
                  title: o.title,
                  description: o.description,
                  isSelected: _selected == o.value,
                  onTap: () => setState(() => _selected = o.value),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

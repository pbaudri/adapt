import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/onboarding_scaffold.dart';

class EatingStyleScreen extends StatefulWidget {
  const EatingStyleScreen({super.key});

  @override
  State<EatingStyleScreen> createState() => _EatingStyleScreenState();
}

class _EatingStyleScreenState extends State<EatingStyleScreen> {
  String? _selected;

  static const _options = [
    (
      value: 'home_cooked',
      title: 'Home cooked',
      description: 'I cook most of my meals myself.',
    ),
    (
      value: 'takeaway',
      title: 'Takeaway',
      description: 'I order in or grab food on the go.',
    ),
    (
      value: 'restaurants',
      title: 'Restaurants',
      description: 'I eat out regularly.',
    ),
    (
      value: 'mixed',
      title: 'A bit of everything',
      description: 'It really depends on the day.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 2,
      title: 'How do you mostly eat?',
      subtitle: 'This helps us suggest realistic meals.',
      isNextEnabled: _selected != null,
      onNext: () => context.push(AppRoutes.onboardingGoal),
      content: Column(
        children: _options
            .map(
              (o) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spacing12),
                child: AdaptSelectionCard(
                  leading: const Icon(
                    Icons.restaurant_menu_rounded,
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

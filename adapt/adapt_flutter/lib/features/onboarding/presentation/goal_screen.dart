import 'package:adapt_client/src/protocol/enums/user_goal.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'providers/onboarding_provider.dart';
import 'widgets/onboarding_scaffold.dart';

class GoalScreen extends ConsumerStatefulWidget {
  const GoalScreen({super.key});

  @override
  ConsumerState<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends ConsumerState<GoalScreen> {
  UserGoal? _selected;

  static const _options = [
    (
      value: UserGoal.loseWeight,
      title: 'Lose weight',
      description: 'Gradually, without obsessing over every calorie.',
      icon: Icons.trending_down_rounded,
    ),
    (
      value: UserGoal.eatBetter,
      title: 'Eat better',
      description: 'More variety, better balance — no crash diets.',
      icon: Icons.eco_rounded,
    ),
    (
      value: UserGoal.stayAware,
      title: 'Stay aware',
      description: 'Just curious what I eat, no specific goal.',
      icon: Icons.visibility_rounded,
    ),
  ];

  Future<void> _onNext() async {
    if (_selected == null) return;
    final ok = await ref
        .read(onboardingNotifierProvider.notifier)
        .saveGoal(_selected!);
    if (ok && mounted) context.push(AppRoutes.onboardingAlcohol);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 3,
      title: "What's your main goal?",
      subtitle: 'We adapt your daily target around this.',
      isNextEnabled: _selected != null && !isLoading,
      onNext: _onNext,
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

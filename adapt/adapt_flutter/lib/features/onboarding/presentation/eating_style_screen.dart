import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'providers/onboarding_provider.dart';
import 'widgets/onboarding_scaffold.dart';

class EatingStyleScreen extends ConsumerStatefulWidget {
  const EatingStyleScreen({super.key});

  @override
  ConsumerState<EatingStyleScreen> createState() => _EatingStyleScreenState();
}

class _EatingStyleScreenState extends ConsumerState<EatingStyleScreen> {
  EatingStyle? _selected;

  static const _options = [
    (
      value: EatingStyle.homeCooked,
      title: 'Home cooked',
      description: 'I cook most of my meals myself.',
    ),
    (
      value: EatingStyle.takeaway,
      title: 'Takeaway',
      description: 'I order in or grab food on the go.',
    ),
    (
      value: EatingStyle.restaurants,
      title: 'Restaurants',
      description: 'I eat out regularly.',
    ),
    (
      value: EatingStyle.mixed,
      title: 'A bit of everything',
      description: 'It really depends on the day.',
    ),
  ];

  Future<void> _onNext() async {
    if (_selected == null) return;
    final ok = await ref
        .read(onboardingNotifierProvider.notifier)
        .saveEatingStyle(_selected!);
    if (ok && mounted) context.push(AppRoutes.onboardingGoal);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 2,
      title: 'How do you mostly eat?',
      subtitle: 'This helps us suggest realistic meals.',
      isNextEnabled: _selected != null && !isLoading,
      onNext: _onNext,
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

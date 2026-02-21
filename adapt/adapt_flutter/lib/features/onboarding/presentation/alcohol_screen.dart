import 'package:adapt_client/src/protocol/enums/alcohol_habit.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'providers/onboarding_provider.dart';
import 'widgets/onboarding_scaffold.dart';

class AlcoholScreen extends ConsumerStatefulWidget {
  const AlcoholScreen({super.key});

  @override
  ConsumerState<AlcoholScreen> createState() => _AlcoholScreenState();
}

class _AlcoholScreenState extends ConsumerState<AlcoholScreen> {
  AlcoholHabit? _selected;
  bool _trackAlcohol = true;

  static const _options = [
    (
      value: AlcoholHabit.rarely,
      title: 'Rarely',
      subtitle: 'A few times a month or less.',
    ),
    (
      value: AlcoholHabit.sometimes,
      title: 'Sometimes',
      subtitle: 'A couple of times a week.',
    ),
    (value: AlcoholHabit.often, title: 'Often', subtitle: 'Most days.'),
  ];

  Future<void> _onNext() async {
    if (_selected == null) return;
    final ok = await ref
        .read(onboardingNotifierProvider.notifier)
        .saveAlcoholHabit(_selected!);
    if (ok && mounted) context.push(AppRoutes.onboardingPersonalInfo);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 4,
      title: 'Do you drink alcohol?',
      subtitle: 'No judgment — this helps us give better estimates.',
      isNextEnabled: _selected != null && !isLoading,
      onNext: _onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ..._options.map(
            (o) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spacing12),
              child: AdaptOptionRow(
                leading: const Icon(
                  Icons.local_bar_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
                title: o.title,
                subtitle: o.subtitle,
                isSelected: _selected == o.value,
                onTap: () => setState(() => _selected = o.value),
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing24),
          AdaptPreferenceToggleRow(
            label: 'Track alcohol calories',
            subtitle: 'Include drinks in your daily total.',
            value: _trackAlcohol,
            onChanged: (v) => setState(() => _trackAlcohol = v),
          ),
        ],
      ),
    );
  }
}

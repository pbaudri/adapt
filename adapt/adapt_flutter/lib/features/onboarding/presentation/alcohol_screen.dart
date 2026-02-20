import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/onboarding_scaffold.dart';

class AlcoholScreen extends StatefulWidget {
  const AlcoholScreen({super.key});

  @override
  State<AlcoholScreen> createState() => _AlcoholScreenState();
}

class _AlcoholScreenState extends State<AlcoholScreen> {
  String? _selected;
  bool _trackAlcohol = true;

  static const _options = [
    (value: 'rarely', title: 'Rarely', subtitle: 'A few times a month or less.'),
    (value: 'sometimes', title: 'Sometimes', subtitle: 'A couple of times a week.'),
    (value: 'often', title: 'Often', subtitle: 'Most days.'),
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 4,
      title: 'Do you drink alcohol?',
      subtitle: 'No judgment — this helps us give better estimates.',
      isNextEnabled: _selected != null,
      onNext: () => context.push(AppRoutes.onboardingPersonalInfo),
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

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/onboarding_scaffold.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String _sex = 'Male';
  String _weightUnit = 'kg';
  String _heightUnit = 'cm';

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 5,
      title: 'A bit about you',
      subtitle: 'Helps us calculate your daily needs.',
      nextLabel: "Let's go",
      onNext: () => context.go(AppRoutes.home),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdaptTextField(
            hint: 'Age',
            controller: _ageController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppDimensions.spacing16),
          const AdaptSectionTitle(label: 'Biological sex'),
          const SizedBox(height: AppDimensions.spacing8),
          AdaptUnitToggle(
            options: const ['Male', 'Female'],
            selected: _sex,
            onChanged: (v) => setState(() => _sex = v),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          Row(
            children: [
              Expanded(
                child: AdaptTextField(
                  hint: 'Weight',
                  controller: _weightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              SizedBox(
                width: 110,
                child: AdaptUnitToggle(
                  options: const ['kg', 'lbs'],
                  selected: _weightUnit,
                  onChanged: (v) => setState(() => _weightUnit = v),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing12),
          Row(
            children: [
              Expanded(
                child: AdaptTextField(
                  hint: 'Height',
                  controller: _heightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              SizedBox(
                width: 110,
                child: AdaptUnitToggle(
                  options: const ['cm', 'ft'],
                  selected: _heightUnit,
                  onChanged: (v) => setState(() => _heightUnit = v),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing12),
          Text(
            'All values stored in SI and converted for display only.',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}

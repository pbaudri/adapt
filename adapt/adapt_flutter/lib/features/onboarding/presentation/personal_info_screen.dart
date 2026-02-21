import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/utils/unit_converter.dart';
import '../../profile/presentation/providers/profile_provider.dart';
import 'providers/onboarding_provider.dart';
import 'widgets/onboarding_scaffold.dart';

class PersonalInfoScreen extends ConsumerStatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  ConsumerState<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends ConsumerState<PersonalInfoScreen> {
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

  Future<void> _onNext() async {
    final ageText = _ageController.text.trim();
    final weightText = _weightController.text.trim();
    final heightText = _heightController.text.trim();
    if (ageText.isEmpty || weightText.isEmpty || heightText.isEmpty) return;

    final age = int.tryParse(ageText);
    if (age == null) return;

    // Convert to SI — unit_converter.dart is the only place for conversion.
    final weightKg = UnitConverter.parseWeightToKg(weightText, _weightUnit);
    final heightCm = UnitConverter.parseHeightToCm(heightText, _heightUnit);
    if (weightKg == null || heightCm == null) return;

    final sex = _sex == 'Male' ? BiologicalSex.male : BiologicalSex.female;

    final ok = await ref
        .read(onboardingNotifierProvider.notifier)
        .savePersonalInfo(
          age: age,
          biologicalSex: sex,
          weightKg: weightKg,
          heightCm: heightCm,
        );
    if (ok && mounted) {
      // Invalidate the cached profile so the router reads the updated data
      // (name + age now set) instead of the stale snapshot from sign-in.
      ref.invalidate(profileNotifierProvider);
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

    return OnboardingScaffold(
      totalSteps: 5,
      currentStep: 5,
      title: 'A bit about you',
      subtitle: 'Helps us calculate your daily needs.',
      nextLabel: "Let's go",
      isNextEnabled: !isLoading,
      onNext: _onNext,
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
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
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
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
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

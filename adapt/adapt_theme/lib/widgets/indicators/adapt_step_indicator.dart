import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';

/// Onboarding step indicator.
///
/// The current step is shown as an active pill; completed and upcoming steps
/// are shown as smaller dots.
///
/// - [totalSteps] — total number of steps.
/// - [currentStep] — 1-based index of the current step.
class AdaptStepIndicator extends StatelessWidget {
  const AdaptStepIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  final int totalSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AppDimensions.spacing8,
      children: List.generate(totalSteps, (index) {
        final isActive = index + 1 == currentStep;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.textMuted,
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          ),
        );
      }),
    );
  }
}

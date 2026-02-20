import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Shared scaffold for all onboarding screens.
///
/// Renders a back button (when [showBack] is true), the step indicator,
/// a page header, scrollable [content], and a sticky next button at the bottom.
class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.title,
    this.subtitle,
    required this.content,
    required this.onNext,
    this.nextLabel = 'Continue',
    this.showBack = true,
    this.isNextEnabled = true,
  });

  final int totalSteps;
  final int currentStep;
  final String title;
  final String? subtitle;
  final Widget content;
  final VoidCallback onNext;
  final String nextLabel;
  final bool showBack;
  final bool isNextEnabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing16,
                bottom: 0,
              ),
              child: Row(
                children: [
                  if (showBack)
                    AdaptBackButton()
                  else
                    const SizedBox(width: 40),
                  const Spacer(),
                  AdaptStepIndicator(
                    totalSteps: totalSteps,
                    currentStep: currentStep,
                  ),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spacing32),
            Padding(
              padding: AppDimensions.screenPadding.copyWith(bottom: 0),
              child: AdaptPageHeader(title: title, subtitle: subtitle),
            ),
            const SizedBox(height: AppDimensions.spacing24),
            Expanded(
              child: SingleChildScrollView(
                padding: AppDimensions.screenPadding.copyWith(top: 0),
                child: content,
              ),
            ),
            Padding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing16,
                bottom: AppDimensions.spacing32,
              ),
              child: AdaptPrimaryButton(
                label: nextLabel,
                onTap: onNext,
                isDisabled: !isNextEnabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

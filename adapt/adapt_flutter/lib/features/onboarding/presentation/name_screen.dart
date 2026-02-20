import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/onboarding_scaffold.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return OnboardingScaffold(
          totalSteps: 5,
          currentStep: 1,
          title: "What's your name?",
          subtitle: 'So we can make it personal.',
          showBack: false,
          isNextEnabled: _controller.text.trim().isNotEmpty,
          onNext: () => context.push(AppRoutes.onboardingEatingStyle),
          content: AdaptTextField(
            hint: 'Your first name',
            controller: _controller,
            autofocus: true,
            keyboardType: TextInputType.name,
          ),
        );
      },
    );
  }
}

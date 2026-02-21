import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'providers/onboarding_provider.dart';
import 'widgets/onboarding_scaffold.dart';

class NameScreen extends ConsumerStatefulWidget {
  const NameScreen({super.key});

  @override
  ConsumerState<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends ConsumerState<NameScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onNext() async {
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    final ok = await ref
        .read(onboardingNotifierProvider.notifier)
        .saveName(name);
    if (ok && mounted) context.push(AppRoutes.onboardingEatingStyle);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return OnboardingScaffold(
          totalSteps: 5,
          currentStep: 1,
          title: "What's your name?",
          subtitle: 'So we can make it personal.',
          showBack: false,
          isNextEnabled: _controller.text.trim().isNotEmpty && !isLoading,
          onNext: _onNext,
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

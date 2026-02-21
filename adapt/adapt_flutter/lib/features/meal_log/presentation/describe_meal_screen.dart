import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'providers/meal_provider.dart';

class DescribeMealScreen extends ConsumerStatefulWidget {
  const DescribeMealScreen({super.key});

  @override
  ConsumerState<DescribeMealScreen> createState() => _DescribeMealScreenState();
}

class _DescribeMealScreenState extends ConsumerState<DescribeMealScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onAnalyse() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    await ref.read(mealNotifierProvider.notifier).analyseByText(text);
    if (!mounted) return;
    ref.read(mealNotifierProvider).maybeWhen(
      result: (_) => context.push(AppRoutes.mealResult),
      error: (message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      ),
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealState = ref.watch(mealNotifierProvider);
    final isLoading = mealState.maybeWhen(loading: () => true, orElse: () => false);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.screenPadding.copyWith(
            top: AppDimensions.spacing16,
            bottom: AppDimensions.spacing32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  AdaptBackButton(),
                  const Spacer(),
                  Text('Describe your meal', style: AppTextStyles.titleMedium),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing32),
              const AdaptPageHeader(
                title: 'What did you eat?',
                subtitle:
                    'Be as specific as you can — size, brand, preparation method.',
              ),
              const SizedBox(height: AppDimensions.spacing24),
              AdaptMultilineTextField(
                hint:
                    'e.g. Large Big Mac menu with Coke, extra ketchup, medium fries',
                controller: _controller,
              ),
              const Spacer(),
              ListenableBuilder(
                listenable: _controller,
                builder: (context, _) => AdaptPrimaryButton(
                  label: 'Analyse',
                  onTap: _onAnalyse,
                  isDisabled: _controller.text.trim().isEmpty,
                  isLoading: isLoading,
                  trailing: const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.textPrimary,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

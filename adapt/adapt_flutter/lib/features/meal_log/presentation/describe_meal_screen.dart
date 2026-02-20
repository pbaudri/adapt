import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';

class DescribeMealScreen extends StatefulWidget {
  const DescribeMealScreen({super.key});

  @override
  State<DescribeMealScreen> createState() => _DescribeMealScreenState();
}

class _DescribeMealScreenState extends State<DescribeMealScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => context.push(AppRoutes.mealResult),
                  isDisabled: _controller.text.trim().isEmpty,
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

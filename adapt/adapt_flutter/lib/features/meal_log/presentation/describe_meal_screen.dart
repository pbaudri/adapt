import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'providers/meal_provider.dart';

/// Quick-add chip data: emoji + label that gets appended to the text field.
const _quickAddItems = [
  (emoji: '🍕', label: 'Pizza slice'),
  (emoji: '🥗', label: 'Caesar salad'),
  (emoji: '🍺', label: 'Beer'),
  (emoji: '🍌', label: 'Banana'),
  (emoji: '🍝', label: 'Pasta'),
];

class DescribeMealScreen extends ConsumerStatefulWidget {
  const DescribeMealScreen({super.key});

  @override
  ConsumerState<DescribeMealScreen> createState() => _DescribeMealScreenState();
}

class _DescribeMealScreenState extends ConsumerState<DescribeMealScreen> {
  final _controller = TextEditingController();
  String? _inlineError;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _appendChip(String text) {
    final current = _controller.text.trim();
    _controller.text = current.isEmpty ? text : '$current, $text';
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
    setState(() => _inlineError = null);
  }

  Future<void> _onAnalyse() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() => _inlineError = null);

    await ref.read(mealNotifierProvider.notifier).logByText(text);
    if (!mounted) return;

    ref.read(mealNotifierProvider).maybeWhen(
      success: (_) => context.push(AppRoutes.mealResult),
      error: (message) => setState(() => _inlineError = message),
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealState = ref.watch(mealNotifierProvider);
    final isLoading =
        mealState.maybeWhen(loading: (_) => true, orElse: () => false);

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
              const SizedBox(height: AppDimensions.spacing12),
              // QUICK ADD chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _quickAddItems
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(
                              right: AppDimensions.spacing8),
                          child: AdaptQuickAddChip(
                            leading: Text(
                              item.emoji,
                              style: const TextStyle(fontSize: 14),
                            ),
                            label: item.label,
                            isDisabled: isLoading,
                            onTap: () => _appendChip(item.label),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              if (_inlineError != null) ...[
                const SizedBox(height: AppDimensions.spacing12),
                Text(
                  _inlineError!,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.error),
                ),
              ],
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

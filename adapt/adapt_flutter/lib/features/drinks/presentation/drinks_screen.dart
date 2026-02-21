import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../home/presentation/providers/home_provider.dart';
import 'providers/drinks_provider.dart';
import 'widgets/drink_type_list.dart';

class DrinksScreen extends ConsumerStatefulWidget {
  const DrinksScreen({super.key});

  @override
  ConsumerState<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends ConsumerState<DrinksScreen> {
  DrinkType? _selectedDrink;
  int _quantity = 1;

  Future<void> _onLog() async {
    if (_selectedDrink == null) return;
    await ref.read(drinksNotifierProvider.notifier).logDrinks(
      _selectedDrink!,
      _quantity,
    );
    if (!mounted) return;
    ref.read(drinksNotifierProvider).maybeWhen(
      logged: (_) {
        ref.invalidate(homeDataProvider);
        context.go(AppRoutes.home);
      },
      error: (message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      ),
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final drinksState = ref.watch(drinksNotifierProvider);
    final isLoading = drinksState.maybeWhen(loading: () => true, orElse: () => false);

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
                  AdaptBackButton(),
                  const Spacer(),
                  Text('Log drinks', style: AppTextStyles.titleMedium),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: AppDimensions.screenPadding.copyWith(
                  top: AppDimensions.spacing24,
                  bottom: AppDimensions.spacing24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AdaptSectionTitle(label: 'What are you having?'),
                    const SizedBox(height: AppDimensions.spacing12),
                    DrinkTypeList(
                      selected: _selectedDrink,
                      onSelect: (v) => setState(() => _selectedDrink = v),
                    ),
                    const SizedBox(height: AppDimensions.spacing24),
                    const AdaptSectionTitle(label: 'How many glasses?'),
                    const SizedBox(height: AppDimensions.spacing16),
                    AdaptQuantitySelector(
                      value: _quantity,
                      label: 'glasses',
                      minValue: 1,
                      onDecrement: () =>
                          setState(() => _quantity = (_quantity - 1).clamp(1, 99)),
                      onIncrement: () => setState(() => _quantity++),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing12,
                bottom: AppDimensions.spacing32,
              ),
              child: AdaptPrimaryButton(
                label: 'Log $_quantity ${_quantity == 1 ? 'glass' : 'glasses'}',
                onTap: _onLog,
                isDisabled: _selectedDrink == null,
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/drink_type_list.dart';

class DrinksScreen extends StatefulWidget {
  const DrinksScreen({super.key});

  @override
  State<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
  String? _selectedDrink;
  int _quantity = 1;

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
                      onDecrement: () => setState(() => _quantity--),
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
                onTap: () => context.go(AppRoutes.home),
                isDisabled: _selectedDrink == null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/drinks_provider.dart';
import 'widgets/drink_type_list.dart';

class DrinksScreen extends ConsumerStatefulWidget {
  const DrinksScreen({super.key});

  @override
  ConsumerState<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends ConsumerState<DrinksScreen> {
  @override
  void initState() {
    super.initState();
    // Load drink reference data on screen open.
    Future.microtask(() => ref.read(drinksNotifierProvider.notifier).init());
  }

  Future<void> _onLog() async {
    await ref.read(drinksNotifierProvider.notifier).logDrinks();
    if (!mounted) return;
    ref.read(drinksNotifierProvider).maybeWhen(
          logged: (_) => Navigator.of(context).pop(),
          orElse: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    final drinksState = ref.watch(drinksNotifierProvider);

    final isLoading = drinksState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final errorMessage = drinksState.maybeWhen(
      error: (msg) => msg,
      orElse: () => null,
    );

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
              child: drinksState.maybeWhen(
                success: (references, selectedType, quantity) =>
                    SingleChildScrollView(
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
                        references: references,
                        selected: selectedType,
                        onSelect: (v) => ref
                            .read(drinksNotifierProvider.notifier)
                            .selectDrink(v),
                      ),
                    ],
                  ),
                ),
                orElse: () => isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: drinksState.maybeWhen(
        success: (references, selectedType, quantity) => Padding(
          padding: AppDimensions.screenPadding.copyWith(
            top: AppDimensions.spacing12,
            bottom: AppDimensions.spacing32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectedType != null) ...[
                const AdaptSectionTitle(label: 'How many glasses?'),
                const SizedBox(height: AppDimensions.spacing16),
                AdaptQuantitySelector(
                  value: quantity,
                  label: 'glasses',
                  minValue: 1,
                  onDecrement: () => ref
                      .read(drinksNotifierProvider.notifier)
                      .decrementQuantity(),
                  onIncrement: () => ref
                      .read(drinksNotifierProvider.notifier)
                      .incrementQuantity(),
                ),
                const SizedBox(height: AppDimensions.spacing12),
                _KcalPreview(
                  references: references,
                  selectedType: selectedType,
                  quantity: quantity,
                ),
                const SizedBox(height: AppDimensions.spacing16),
              ],
              if (errorMessage != null) ...[
                Text(
                  errorMessage,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.error),
                ),
                const SizedBox(height: AppDimensions.spacing8),
              ],
              AdaptPrimaryButton(
                label: selectedType != null
                    ? 'Log $quantity ${quantity == 1 ? 'glass' : 'glasses'}'
                    : 'Select a drink',
                onTap: _onLog,
                isDisabled: selectedType == null,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}

class _KcalPreview extends StatelessWidget {
  const _KcalPreview({
    required this.references,
    required this.selectedType,
    required this.quantity,
  });

  final List<DrinkReference> references;
  final DrinkType selectedType;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final drinkRef = references.where((r) => r.drinkType == selectedType).firstOrNull;
    if (drinkRef == null) return const SizedBox.shrink();
    final totalKcal = drinkRef.caloriesPerUnit * quantity;
    return Text(
      '≈ $totalKcal kcal total',
      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
    );
  }
}

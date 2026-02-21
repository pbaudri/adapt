import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'providers/meal_provider.dart';

class EditMealScreen extends ConsumerStatefulWidget {
  const EditMealScreen({super.key});

  @override
  ConsumerState<EditMealScreen> createState() => _EditMealScreenState();
}

class _EditMealScreenState extends ConsumerState<EditMealScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _proteinController;
  late final TextEditingController _carbsController;
  late final TextEditingController _fatController;

  @override
  void initState() {
    super.initState();
    final result = ref.read(pendingMealResultProvider);
    _nameController = TextEditingController(text: result?.name ?? '');
    _proteinController =
        TextEditingController(text: result?.proteinG.toStringAsFixed(0) ?? '');
    _carbsController =
        TextEditingController(text: result?.carbsG.toStringAsFixed(0) ?? '');
    _fatController =
        TextEditingController(text: result?.fatG.toStringAsFixed(0) ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    final result = ref.read(pendingMealResultProvider);
    if (result == null) return;

    await ref.read(mealNotifierProvider.notifier).correctAndConfirm(
      mealLogId: result.mealLogId,
      name: _nameController.text.trim().isEmpty
          ? null
          : _nameController.text.trim(),
      proteinG: double.tryParse(_proteinController.text),
      carbsG: double.tryParse(_carbsController.text),
      fatG: double.tryParse(_fatController.text),
    );
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final mealState = ref.watch(mealNotifierProvider);
    final isLoading = mealState.maybeWhen(loading: () => true, orElse: () => false);

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
                  Text('Edit meal', style: AppTextStyles.titleMedium),
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
                    const AdaptSectionTitle(label: 'Meal name'),
                    const SizedBox(height: AppDimensions.spacing8),
                    AdaptEditableField(
                      label: 'Meal name',
                      controller: _nameController,
                      onTap: () {},
                    ),
                    const SizedBox(height: AppDimensions.spacing24),
                    const AdaptSectionTitle(label: 'Nutrition'),
                    const SizedBox(height: AppDimensions.spacing8),
                    AdaptInfoFormCard(
                      children: [
                        AdaptNutritionRow(
                          label: 'Protein',
                          color: AppColors.protein,
                          controller: _proteinController,
                        ),
                        const Divider(),
                        AdaptNutritionRow(
                          label: 'Carbs',
                          color: AppColors.carbs,
                          controller: _carbsController,
                        ),
                        const Divider(),
                        AdaptNutritionRow(
                          label: 'Fat',
                          color: AppColors.fat,
                          controller: _fatController,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.spacing12),
                    const AdaptAutoCalcCard(),
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
                label: 'Save changes',
                onTap: _onSave,
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

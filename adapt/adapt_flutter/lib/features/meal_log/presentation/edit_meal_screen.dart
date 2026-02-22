import 'package:adapt_client/adapt_client.dart';
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
    _proteinController = TextEditingController(
      text: result?.proteinG.toStringAsFixed(0) ?? '',
    );
    _carbsController = TextEditingController(
      text: result?.carbsG.toStringAsFixed(0) ?? '',
    );
    _fatController = TextEditingController(
      text: result?.fatG.toStringAsFixed(0) ?? '',
    );

    // Rebuild calories preview when any macro changes
    _proteinController.addListener(_onMacroChanged);
    _carbsController.addListener(_onMacroChanged);
    _fatController.addListener(_onMacroChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  void _onMacroChanged() => setState(() {});

  /// Local calorie preview: (p×4) + (c×4) + (f×9). Never sent to server.
  int get _previewCalories {
    final p = double.tryParse(_proteinController.text) ?? 0;
    final c = double.tryParse(_carbsController.text) ?? 0;
    final f = double.tryParse(_fatController.text) ?? 0;
    return ((p * 4) + (c * 4) + (f * 9)).round();
  }

  Future<void> _onSave() async {
    final result = ref.read(pendingMealResultProvider);
    if (result == null) return;

    final correction = MealCorrectionInput(
      name: _nameController.text.trim().isEmpty
          ? null
          : _nameController.text.trim(),
      proteinG: double.tryParse(_proteinController.text),
      carbsG: double.tryParse(_carbsController.text),
      fatG: double.tryParse(_fatController.text),
      // caloriesKcal is NEVER included — always auto-calculated server-side
    );

    await ref
        .read(mealNotifierProvider.notifier)
        .correct(result.mealLogId, correction);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final mealState = ref.watch(mealNotifierProvider);
    final isLoading = mealState.maybeWhen(
      loading: (_) => true,
      orElse: () => false,
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
                        // Calories row — display only, auto-calculated
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppDimensions.spacing12,
                            horizontal: AppDimensions.spacing4,
                          ),
                          child: Row(
                            children: [
                              Text('Calories', style: AppTextStyles.bodyMedium),
                              const Spacer(),
                              Text(
                                '$_previewCalories kcal',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AdaptPrimaryButton(
                    label: 'Save corrections',
                    onTap: _onSave,
                    isLoading: isLoading,
                  ),
                  const SizedBox(height: AppDimensions.spacing12),
                  AdaptTextLink(
                    label: 'Looks good actually',
                    onTap: () => context.pop(),
                    textStyle: AppTextStyles.textLinkMuted,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

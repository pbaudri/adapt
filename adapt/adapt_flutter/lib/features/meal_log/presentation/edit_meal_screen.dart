import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditMealScreen extends StatefulWidget {
  const EditMealScreen({super.key});

  @override
  State<EditMealScreen> createState() => _EditMealScreenState();
}

class _EditMealScreenState extends State<EditMealScreen> {
  final _nameController = TextEditingController(text: 'Big Mac Menu');
  final _proteinController = TextEditingController(text: '42');
  final _carbsController = TextEditingController(text: '103');
  final _fatController = TextEditingController(text: '47');

  @override
  void dispose() {
    _nameController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

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
                onTap: () => context.pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

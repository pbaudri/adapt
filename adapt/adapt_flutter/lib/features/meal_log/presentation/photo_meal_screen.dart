import 'dart:io';

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/router/app_routes.dart';
import 'providers/meal_provider.dart';
import 'widgets/meal_action_row.dart';

class PhotoMealScreen extends ConsumerStatefulWidget {
  const PhotoMealScreen({super.key});

  @override
  ConsumerState<PhotoMealScreen> createState() => _PhotoMealScreenState();
}

class _PhotoMealScreenState extends ConsumerState<PhotoMealScreen> {
  File? _imageFile;
  final _picker = ImagePicker();
  String? _inlineError;

  Future<void> _pickAndAnalyse(ImageSource source) async {
    setState(() => _inlineError = null);

    XFile? picked;
    try {
      picked = await _picker.pickImage(source: source);
    } catch (e) {
      setState(() => _inlineError = 'Camera access denied. Check your permissions in Settings.');
      return;
    }

    if (picked == null) return;

    final file = File(picked.path);
    setState(() => _imageFile = file);

    await ref.read(mealNotifierProvider.notifier).logByPhoto(file);
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
                  Text('Log a meal', style: AppTextStyles.titleMedium),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing24),
              // Camera preview with loading overlay
              Stack(
                children: [
                  AdaptCameraPreview(
                    imageFile: _imageFile,
                    label: 'Tap to take a photo of your meal',
                    onTap: () => _pickAndAnalyse(ImageSource.camera),
                  ),
                  if (isLoading)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.background.withAlpha(180),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusMedium),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing24),
              MealActionRow(
                onPhoto: () => _pickAndAnalyse(ImageSource.camera),
                onDescribe: () => context.go(AppRoutes.mealDescribe),
                onGallery: () => _pickAndAnalyse(ImageSource.gallery),
              ),
              if (_inlineError != null) ...[
                const SizedBox(height: AppDimensions.spacing12),
                Text(
                  _inlineError!,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.error),
                  textAlign: TextAlign.center,
                ),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

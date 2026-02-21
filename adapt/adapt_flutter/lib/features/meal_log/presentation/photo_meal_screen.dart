import 'dart:io';
import 'dart:typed_data';

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

  Future<void> _pickFromCamera() async {
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked != null) setState(() => _imageFile = File(picked.path));
  }

  Future<void> _pickFromGallery() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _imageFile = File(picked.path));
  }

  Future<void> _onAnalyse() async {
    if (_imageFile == null) return;
    final bytes = await _imageFile!.readAsBytes();
    final byteData = ByteData.view(bytes.buffer);
    await ref.read(mealNotifierProvider.notifier).analyseByPhoto(byteData);
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
                  Text('Log a meal', style: AppTextStyles.titleMedium),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing24),
              AdaptCameraPreview(
                imageFile: _imageFile,
                label: 'Tap to take a photo of your meal',
                onTap: _pickFromCamera,
              ),
              const SizedBox(height: AppDimensions.spacing24),
              MealActionRow(
                onPhoto: _pickFromCamera,
                onDescribe: () => context.go(AppRoutes.mealDescribe),
                onGallery: _pickFromGallery,
              ),
              const Spacer(),
              AdaptPrimaryButton(
                label: 'Analyse meal',
                onTap: _onAnalyse,
                isDisabled: _imageFile == null,
                isLoading: isLoading,
                trailing: const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.textPrimary,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

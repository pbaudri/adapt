import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Row of action buttons for initiating a meal log (photo, describe, gallery).
class MealActionRow extends StatelessWidget {
  const MealActionRow({
    super.key,
    required this.onPhoto,
    required this.onDescribe,
    required this.onGallery,
  });

  final VoidCallback onPhoto;
  final VoidCallback onDescribe;
  final VoidCallback onGallery;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AdaptActionButton(
            icon: const Icon(
              Icons.camera_alt_rounded,
              color: AppColors.textPrimary,
              size: 24,
            ),
            label: 'Take photo',
            onTap: onPhoto,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing8),
        Expanded(
          child: AdaptActionButton(
            icon: const Icon(
              Icons.edit_rounded,
              color: AppColors.textPrimary,
              size: 24,
            ),
            label: 'Describe it',
            onTap: onDescribe,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing8),
        Expanded(
          child: AdaptActionButton(
            icon: const Icon(
              Icons.photo_library_rounded,
              color: AppColors.textPrimary,
              size: 24,
            ),
            label: 'Gallery',
            onTap: onGallery,
          ),
        ),
      ],
    );
  }
}

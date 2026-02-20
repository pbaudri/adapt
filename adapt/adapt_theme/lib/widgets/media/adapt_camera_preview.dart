import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A preview area for a captured photo or a placeholder prompt to take one.
///
/// - [imageFile] — when provided, displays the captured image; otherwise shows
///   a placeholder with a camera icon and [label].
/// - [label] — instructional text shown in the placeholder state.
/// - [onTap] — called when the preview area is tapped (e.g. to open the camera).
/// - [borderRadius] — corner radius; defaults to [AppDimensions.radiusMedium].
class AdaptCameraPreview extends StatelessWidget {
  const AdaptCameraPreview({
    super.key,
    this.imageFile,
    required this.label,
    this.onTap,
    this.borderRadius,
    this.height = 220,
  });

  final File? imageFile;
  final String label;
  final VoidCallback? onTap;
  final double? borderRadius;
  final double height;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? AppDimensions.radiusMedium;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: imageFile != null ? _ImagePreview(file: imageFile!) : _Placeholder(label: label),
        ),
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      file,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.textSecondary,
              size: 24,
            ),
          ),
          const SizedBox(height: AppDimensions.spacing12),
          Text(
            label,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

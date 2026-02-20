import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Standard bottom sheet wrapper with drag handle, optional title, and child content.
///
/// Pass as the `builder` body to [showModalBottomSheet]:
///
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   backgroundColor: Colors.transparent,
///   builder: (_) => AdaptBottomSheet(
///     title: 'Edit weight',
///     child: MyContent(),
///   ),
/// );
/// ```
///
/// - [child] — content rendered below the optional title.
/// - [title] — optional heading shown below the drag handle.
class AdaptBottomSheet extends StatelessWidget {
  const AdaptBottomSheet({
    super.key,
    required this.child,
    this.title,
  });

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusLarge),
          topRight: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppDimensions.spacing12),
            // Drag handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textMuted,
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
              ),
            ),
            if (title != null) ...[
              const SizedBox(height: AppDimensions.spacing20),
              Padding(
                padding: AppDimensions.screenPadding,
                child: Text(
                  title!,
                  style: AppTextStyles.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const SizedBox(height: AppDimensions.spacing20),
            child,
            const SizedBox(height: AppDimensions.spacing16),
          ],
        ),
      ),
    );
  }
}

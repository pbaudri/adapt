import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A week navigation bar with previous/next arrows and a centred label.
///
/// - [label] — current week label (e.g. "Feb 17 – Feb 23").
/// - [onPrevious] — called when the left arrow is tapped.
/// - [onNext] — called when the right arrow is tapped.
/// - [canGoNext] — when `false`, the next arrow is disabled. Defaults to `true`.
class AdaptWeekNavigator extends StatelessWidget {
  const AdaptWeekNavigator({
    super.key,
    required this.label,
    required this.onPrevious,
    required this.onNext,
    this.canGoNext = true,
  });

  final String label;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool canGoNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPrevious,
          icon: const Icon(Icons.chevron_left_rounded),
          color: AppColors.textPrimary,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.surface,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(AppDimensions.spacing8),
          ),
        ),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Opacity(
          opacity: canGoNext ? 1.0 : 0.4,
          child: IconButton(
            onPressed: canGoNext ? onNext : null,
            icon: const Icon(Icons.chevron_right_rounded),
            color: AppColors.textPrimary,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.surface,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(AppDimensions.spacing8),
            ),
          ),
        ),
      ],
    );
  }
}

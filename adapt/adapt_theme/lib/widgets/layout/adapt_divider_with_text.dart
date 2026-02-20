import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A horizontal divider with a centred text label (typically "or").
///
/// - [label] — text displayed between the two lines.
class AdaptDividerWithText extends StatelessWidget {
  const AdaptDividerWithText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.surfaceElevated, thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing16,
          ),
          child: Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.surfaceElevated, thickness: 1),
        ),
      ],
    );
  }
}

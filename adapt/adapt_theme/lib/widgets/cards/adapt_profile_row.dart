import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A tappable row showing a label and its current value, with a trailing chevron.
///
/// Used in profile and settings screens.
///
/// - [label] — field name (e.g. "Weight").
/// - [value] — current display value (e.g. "82 kg").
/// - [onTap] — called when the row is tapped.
class AdaptProfileRow extends StatelessWidget {
  const AdaptProfileRow({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing16,
          vertical: AppDimensions.spacing16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(label, style: AppTextStyles.bodyLarge),
            ),
            Text(
              value,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: AppDimensions.spacing8),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Insight card with a left purple border and an "ADAPT NOTICED" label.
///
/// - [title] — bold line of the insight.
/// - [subtitle] — supporting detail.
class AdaptInsightCard extends StatelessWidget {
  const AdaptInsightCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border(
          left: BorderSide(
            color: AppColors.insightBorder,
            width: 3,
          ),
        ),
      ),
      child: Padding(
        padding: AppDimensions.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ADAPT NOTICED', style: AppTextStyles.labelCaps),
            const SizedBox(height: AppDimensions.spacing8),
            Text(title, style: AppTextStyles.bodyLarge),
            const SizedBox(height: AppDimensions.spacing4),
            Text(subtitle, style: AppTextStyles.bodyMedium),
          ],
        ),
      ),
    );
  }
}

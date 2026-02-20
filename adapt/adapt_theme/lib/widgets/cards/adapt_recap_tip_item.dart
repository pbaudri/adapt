import 'package:flutter/material.dart';

import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A morning recap tip row with a coloured icon container, title, and subtitle.
///
/// - [leading] — widget shown inside the coloured background container (icon, etc.).
/// - [backgroundColor] — background colour of the leading container.
/// - [title] — tip heading.
/// - [subtitle] — tip detail.
class AdaptRecapTipItem extends StatelessWidget {
  const AdaptRecapTipItem({
    super.key,
    required this.leading,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
  });

  final Widget leading;
  final Color backgroundColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.spacing8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            ),
            child: Center(child: leading),
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                const SizedBox(height: AppDimensions.spacing4),
                Text(subtitle, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

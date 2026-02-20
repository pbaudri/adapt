import 'package:flutter/material.dart';

import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Screen header with a title and optional subtitle.
///
/// - [title] — primary heading text.
/// - [subtitle] — optional explanatory text below the title.
class AdaptPageHeader extends StatelessWidget {
  const AdaptPageHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.displayLarge),
        if (subtitle != null) ...[
          const SizedBox(height: AppDimensions.spacing8),
          Text(subtitle!, style: AppTextStyles.bodyMedium),
        ],
      ],
    );
  }
}

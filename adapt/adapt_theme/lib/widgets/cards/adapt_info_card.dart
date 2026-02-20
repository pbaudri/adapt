import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';

/// Free-content container card with surface background and rounded corners.
///
/// - [child] — arbitrary content to display inside.
/// - [padding] — defaults to [AppDimensions.cardPadding].
class AdaptInfoCard extends StatelessWidget {
  const AdaptInfoCard({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? AppDimensions.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: child,
    );
  }
}

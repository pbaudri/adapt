import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';

/// A circular icon container used to showcase a primary visual on a screen.
///
/// - [child] — widget displayed inside the circle (icon, image, etc.).
/// - [size] — diameter of the circle; defaults to `96`.
/// - [backgroundColor] — defaults to [AppColors.surfaceElevated].
class AdaptIconHero extends StatelessWidget {
  const AdaptIconHero({
    super.key,
    required this.child,
    this.size = 96,
    this.backgroundColor,
  });

  final Widget child;
  final double size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surfaceElevated,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(size * 0.2),
        child: Center(child: child),
      ),
    );
  }
}

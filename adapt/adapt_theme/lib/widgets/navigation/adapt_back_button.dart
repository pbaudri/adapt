import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// A back-navigation button.
///
/// - [onTap] — optional override; when `null`, calls [Navigator.of(context).pop()].
class AdaptBackButton extends StatelessWidget {
  const AdaptBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      color: AppColors.textPrimary,
      iconSize: 20,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.surface,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

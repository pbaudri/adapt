import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Action button used for Photo, Describe, and Gallery actions on the log screen.
///
/// Renders a vertical column with an icon container above a text label.
///
/// - [icon] — leading widget (e.g. [Icon]).
/// - [label] — text shown below the icon.
/// - [onTap] — callback fired when tapped.
/// - [textStyle] — defaults to [AppTextStyles.bodyMedium]; override as needed.
/// - [isDisabled] — renders at half opacity and blocks interaction.
class AdaptActionButton extends StatelessWidget {
  const AdaptActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.textStyle,
    this.isDisabled = false,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: isDisabled ? null : onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
              child: Center(child: icon),
            ),
            const SizedBox(height: AppDimensions.spacing8),
            Text(label, style: textStyle ?? AppTextStyles.bodyMedium),
          ],
        ),
      ),
    );
  }
}

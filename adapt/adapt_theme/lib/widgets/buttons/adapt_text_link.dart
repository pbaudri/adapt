import 'package:flutter/material.dart';

import '../../theme/app_text_styles.dart';

/// Tappable inline text link.
///
/// - [label] — link text.
/// - [onTap] — callback fired when tapped.
/// - [textStyle] — defaults to [AppTextStyles.textLinkPrimary]; override to
///   use [AppTextStyles.textLinkDestructive] or [AppTextStyles.textLinkMuted].
class AdaptTextLink extends StatelessWidget {
  const AdaptTextLink({
    super.key,
    required this.label,
    required this.onTap,
    this.textStyle,
  });

  final String label;
  final VoidCallback onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Text(label, style: textStyle ?? AppTextStyles.textLinkPrimary),
    );
  }
}

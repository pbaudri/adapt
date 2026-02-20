import 'package:flutter/material.dart';

import '../../theme/app_text_styles.dart';

/// Uppercased section label (e.g. "TODAY", "ABOUT YOU").
///
/// - [label] — text to display; rendered with [AppTextStyles.labelCaps].
class AdaptSectionTitle extends StatelessWidget {
  const AdaptSectionTitle({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label.toUpperCase(), style: AppTextStyles.labelCaps);
  }
}

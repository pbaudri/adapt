import 'package:flutter/material.dart';

import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Large numeric display used inside bottom sheets (e.g. "75 kg").
///
/// - [value] — the number string (e.g. "75").
/// - [unit] — the unit label (e.g. "kg").
class AdaptLargeValueDisplay extends StatelessWidget {
  const AdaptLargeValueDisplay({
    super.key,
    required this.value,
    required this.unit,
  });

  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(value, style: AppTextStyles.displayValue),
        const SizedBox(width: AppDimensions.spacing8),
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.spacing8),
          child: Text(unit, style: AppTextStyles.displayValueUnit),
        ),
      ],
    );
  }
}

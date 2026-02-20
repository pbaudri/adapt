import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// A counter widget with decrement and increment buttons.
///
/// Used for selecting drink quantities, serving sizes, etc.
///
/// - [value] — current count.
/// - [label] — unit label shown below the value (e.g. "glasses").
/// - [onDecrement] — called when the minus button is tapped.
/// - [onIncrement] — called when the plus button is tapped.
/// - [minValue] — lowest allowed value; decrement is disabled at this value. Defaults to `0`.
class AdaptQuantitySelector extends StatelessWidget {
  const AdaptQuantitySelector({
    super.key,
    required this.value,
    required this.label,
    required this.onDecrement,
    required this.onIncrement,
    this.minValue = 0,
  });

  final int value;
  final String label;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final int minValue;

  @override
  Widget build(BuildContext context) {
    final canDecrement = value > minValue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _CircleButton(
          icon: Icons.remove,
          onTap: canDecrement ? onDecrement : null,
        ),
        const SizedBox(width: AppDimensions.spacing32),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$value', style: AppTextStyles.titleLarge),
            const SizedBox(height: AppDimensions.spacing4),
            Text(label, style: AppTextStyles.bodyMedium),
          ],
        ),
        const SizedBox(width: AppDimensions.spacing32),
        _CircleButton(icon: Icons.add, onTap: onIncrement),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return Opacity(
      opacity: enabled ? 1.0 : 0.4,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            border: Border.all(
              color: enabled ? AppColors.primary : AppColors.textMuted,
              width: 1.5,
            ),
          ),
          child: Icon(icon, color: AppColors.textPrimary, size: 20),
        ),
      ),
    );
  }
}

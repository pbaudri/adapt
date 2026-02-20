import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Password strength levels.
enum PasswordStrength { weak, fair, strong, veryStrong }

/// Visual bar indicating the strength of a password.
///
/// - [strength] — current [PasswordStrength] level.
class AdaptPasswordStrengthBar extends StatelessWidget {
  const AdaptPasswordStrengthBar({super.key, required this.strength});

  final PasswordStrength strength;

  int get _filledSegments => switch (strength) {
        PasswordStrength.weak => 1,
        PasswordStrength.fair => 2,
        PasswordStrength.strong => 3,
        PasswordStrength.veryStrong => 4,
      };

  Color get _activeColor => switch (strength) {
        PasswordStrength.weak => AppColors.error,
        PasswordStrength.fair => AppColors.fat,
        PasswordStrength.strong => AppColors.carbs,
        PasswordStrength.veryStrong => AppColors.carbs,
      };

  String get _label => switch (strength) {
        PasswordStrength.weak => 'Weak',
        PasswordStrength.fair => 'Fair',
        PasswordStrength.strong => 'Strong',
        PasswordStrength.veryStrong => 'Very strong',
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: AppDimensions.spacing8,
          children: List.generate(4, (index) {
            final filled = index < _filledSegments;
            return Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 4,
                decoration: BoxDecoration(
                  color: filled ? _activeColor : AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: AppDimensions.spacing4),
        Text(
          _label,
          style: AppTextStyles.bodyMedium.copyWith(color: _activeColor),
        ),
      ],
    );
  }
}

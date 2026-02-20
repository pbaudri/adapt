import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Expandable multiline text input. Starts at 4 lines and grows with content.
///
/// - [hint] — placeholder text.
/// - [controller] — text editing controller.
/// - [onChanged] — called on every keystroke.
/// - [maxLines] — maximum number of lines before scrolling; `null` = unlimited.
class AdaptMultilineTextField extends StatelessWidget {
  const AdaptMultilineTextField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.maxLines,
    this.focusNode,
    this.autofocus = false,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      autofocus: autofocus,
      minLines: 4,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      style: AppTextStyles.bodyLarge,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: AppColors.surface,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.all(AppDimensions.spacing16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}

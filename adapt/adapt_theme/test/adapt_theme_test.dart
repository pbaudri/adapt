import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:adapt_theme/adapt_theme.dart';

void main() {
  group('AppColors', () {
    test('background colour is correct', () {
      expect(AppColors.background, const Color(0xFF0A0A0F));
    });

    test('primary colour is correct', () {
      expect(AppColors.primary, const Color(0xFF6C63FF));
    });
  });

  group('AppDimensions', () {
    test('buttonHeight is 56', () {
      expect(AppDimensions.buttonHeight, 56.0);
    });

    test('radiusFull is 999', () {
      expect(AppDimensions.radiusFull, 999.0);
    });
  });

  group('AppTheme', () {
    test('dark theme has correct scaffold background', () {
      final theme = AppTheme.dark;
      expect(theme.scaffoldBackgroundColor, AppColors.background);
    });

    test('dark theme brightness is dark', () {
      expect(AppTheme.dark.brightness, Brightness.dark);
    });
  });
}

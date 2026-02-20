import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

/// Social authentication provider type.
enum SocialAuthType { apple, google }

/// Social sign-in button for Apple or Google authentication.
///
/// - [type] — which provider to display.
/// - [onTap] — callback fired when tapped.
/// - [isDisabled] — renders at half opacity and blocks interaction.
class AdaptSocialAuthButton extends StatelessWidget {
  const AdaptSocialAuthButton({
    super.key,
    required this.type,
    required this.onTap,
    this.isDisabled = false,
  });

  final SocialAuthType type;
  final VoidCallback onTap;
  final bool isDisabled;

  String get _label =>
      type == SocialAuthType.apple
          ? 'Continue with Apple'
          : 'Continue with Google';

  String get _assetPath =>
      type == SocialAuthType.apple
          ? 'assets/icons/apple_logo.svg'
          : 'assets/icons/google_logo.svg';

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: SizedBox(
        height: AppDimensions.buttonHeight,
        width: double.infinity,
        child: Material(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            onTap: isDisabled ? null : onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    _assetPath,
                    package: 'adapt_theme',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: AppDimensions.spacing12),
                  Text(_label, style: AppTextStyles.bodyLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

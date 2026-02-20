import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';

/// The scrollable content of the sign-in screen.
class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppDimensions.screenPadding.copyWith(top: 48, bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: AdaptIconHero(
              child: Icon(
                Icons.bolt_rounded,
                size: 40,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing32),
          const AdaptPageHeader(
            title: 'Welcome back',
            subtitle: 'Sign in to continue tracking your nutrition.',
          ),
          const SizedBox(height: AppDimensions.spacing32),
          AdaptTextField(
            hint: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptTextField(
            hint: 'Password',
            controller: _passwordController,
            obscureText: _obscurePassword,
            trailing: GestureDetector(
              onTap: () => setState(() => _obscurePassword = !_obscurePassword),
              child: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing24),
          AdaptPrimaryButton(
            label: 'Sign in',
            onTap: () => context.go(AppRoutes.home),
          ),
          const SizedBox(height: AppDimensions.spacing24),
          const AdaptDividerWithText(label: 'or'),
          const SizedBox(height: AppDimensions.spacing24),
          AdaptSocialAuthButton(
            type: SocialAuthType.apple,
            onTap: () => context.go(AppRoutes.home),
          ),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptSocialAuthButton(
            type: SocialAuthType.google,
            onTap: () => context.go(AppRoutes.home),
          ),
          const SizedBox(height: AppDimensions.spacing32),
          Center(
            child: AdaptTextLink(
              label: "Don't have an account? Sign up",
              onTap: () => context.push(AppRoutes.signUp),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          Center(
            child: AdaptTextLink(
              label: 'Continue as guest',
              onTap: () => context.go(AppRoutes.onboardingName),
              textStyle: AppTextStyles.textLinkMuted,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../providers/auth_provider.dart';

/// The scrollable content of the sign-in screen.
class SignInBody extends ConsumerStatefulWidget {
  const SignInBody({super.key});

  @override
  ConsumerState<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends ConsumerState<SignInBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onSignIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) return;
    await ref.read(authNotifierProvider.notifier).signIn(email, password);
    if (!mounted) return;
    ref.read(authNotifierProvider).maybeWhen(
      authenticated: (_) => context.go(AppRoutes.home),
      error: (message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      ),
      orElse: () {},
    );
  }

  Future<void> _onContinueAsGuest() async {
    await ref.read(authNotifierProvider.notifier).continueAsGuest();
    if (!mounted) return;
    ref.read(authNotifierProvider).maybeWhen(
      authenticated: (_) => context.go(AppRoutes.onboardingName),
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.maybeWhen(loading: () => true, orElse: () => false);

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
            onTap: _onSignIn,
            isLoading: isLoading,
          ),
          const SizedBox(height: AppDimensions.spacing24),
          const AdaptDividerWithText(label: 'or'),
          const SizedBox(height: AppDimensions.spacing24),
          AdaptSocialAuthButton(
            type: SocialAuthType.apple,
            onTap: _onSignIn,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptSocialAuthButton(
            type: SocialAuthType.google,
            onTap: _onSignIn,
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
              onTap: _onContinueAsGuest,
              textStyle: AppTextStyles.textLinkMuted,
            ),
          ),
        ],
      ),
    );
  }
}

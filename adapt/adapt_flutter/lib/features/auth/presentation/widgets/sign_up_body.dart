import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../providers/auth_provider.dart';

/// The scrollable content of the sign-up screen.
class SignUpBody extends ConsumerStatefulWidget {
  const SignUpBody({super.key});

  @override
  ConsumerState<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends ConsumerState<SignUpBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  PasswordStrength _strength = PasswordStrength.weak;

  void _onPasswordChanged(String value) {
    setState(() {
      if (value.length < 6) {
        _strength = PasswordStrength.weak;
      } else if (value.length < 10) {
        _strength = PasswordStrength.fair;
      } else if (value.length < 14) {
        _strength = PasswordStrength.strong;
      } else {
        _strength = PasswordStrength.veryStrong;
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _onCreateAccount() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirm = _confirmController.text;
    if (email.isEmpty || password.isEmpty) return;
    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    // Step 1: send a verification email. The user must click the link to get
    // a registrationToken, which is used to finishRegistration (not yet
    // implemented in the UI — a verification screen would be the next step).
    await ref.read(authNotifierProvider.notifier).startSignUp(email);
    if (!mounted) return;
    final errorMessage = ref.read(authNotifierProvider).maybeWhen(
      error: (m) => m,
      orElse: () => null,
    );
    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Check your email to complete registration.'),
      ),
    );
    context.go(AppRoutes.signIn);
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
            title: 'Create account',
            subtitle: 'Start tracking without judgment.',
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
            onChanged: _onPasswordChanged,
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
          const SizedBox(height: AppDimensions.spacing8),
          AdaptPasswordStrengthBar(strength: _strength),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptTextField(
            hint: 'Confirm password',
            controller: _confirmController,
            obscureText: _obscureConfirm,
            trailing: GestureDetector(
              onTap: () => setState(() => _obscureConfirm = !_obscureConfirm),
              child: Icon(
                _obscureConfirm
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing24),
          AdaptPrimaryButton(
            label: 'Create account',
            onTap: _onCreateAccount,
            isLoading: isLoading,
          ),
          const SizedBox(height: AppDimensions.spacing24),
          const AdaptDividerWithText(label: 'or'),
          const SizedBox(height: AppDimensions.spacing24),
          AdaptSocialAuthButton(
            type: SocialAuthType.apple,
            onTap: _onCreateAccount,
            isDisabled: isLoading,
          ),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptSocialAuthButton(
            type: SocialAuthType.google,
            onTap: _onCreateAccount,
            isDisabled: isLoading,
          ),
          const SizedBox(height: AppDimensions.spacing32),
          Center(
            child: AdaptTextLink(
              label: 'Already have an account? Sign in',
              onTap: () => context.pop(),
              textStyle: AppTextStyles.textLinkMuted,
            ),
          ),
        ],
      ),
    );
  }
}

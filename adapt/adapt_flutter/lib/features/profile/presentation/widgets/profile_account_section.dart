import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/profile_provider.dart';

/// Account section on the profile screen.
///
/// - Guest: shows a prompt to sign in for cross-device sync.
/// - Signed in: shows a Sign out button that clears the session and
///   lets the router redirect to [AppRoutes.signIn].
class ProfileAccountSection extends ConsumerWidget {
  const ProfileAccountSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);
    final isGuest = profileAsync.whenOrNull(data: (p) => p.isGuest) ?? true;

    final authState = ref.watch(authNotifierProvider);
    final isSigningOut =
        authState.maybeWhen(loading: () => true, orElse: () => false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AdaptSectionTitle(label: 'Account'),
        const SizedBox(height: AppDimensions.spacing12),
        if (isGuest)
          AdaptInfoCard(
            child: Padding(
              padding: AppDimensions.cardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Using as guest', style: AppTextStyles.bodyLarge),
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(
                    'Your data is stored locally. Sign in to sync across devices.',
                    style: AppTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: AppDimensions.spacing12),
                  AdaptTextLink(
                    label: 'Sign in to sync your data',
                    onTap: () => context.push(AppRoutes.signIn),
                  ),
                ],
              ),
            ),
          )
        else
          AdaptSecondaryButton(
            label: 'Sign out',
            onTap: () =>
                ref.read(authNotifierProvider.notifier).signOut(),
            isDisabled: isSigningOut,
          ),
        const SizedBox(height: AppDimensions.spacing24),
        Center(
          child: AdaptTextLink(
            label: 'Delete all my data',
            onTap: () =>
                ref.read(profileNotifierProvider.notifier).deleteAllData(),
            textStyle: AppTextStyles.textLinkDestructive,
          ),
        ),
      ],
    );
  }
}

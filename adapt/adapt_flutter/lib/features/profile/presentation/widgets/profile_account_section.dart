import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../providers/profile_provider.dart';

/// Account section with sign-in sync link and data deletion on the profile screen.
class ProfileAccountSection extends ConsumerWidget {
  const ProfileAccountSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);
    final isGuest = profileAsync.whenOrNull(data: (p) => p.isGuest) ?? true;

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
          AdaptInfoCard(
            child: Padding(
              padding: AppDimensions.cardPadding,
              child: profileAsync.whenOrNull(
                    data: (p) => Text(
                      p.name ?? 'Account',
                      style: AppTextStyles.bodyLarge,
                    ),
                  ) ??
                  const SizedBox.shrink(),
            ),
          ),
        const SizedBox(height: AppDimensions.spacing24),
        Center(
          child: AdaptTextLink(
            label: 'Delete all my data',
            onTap: () async {
              await ref.read(profileNotifierProvider.notifier).deleteAllData();
            },
            textStyle: AppTextStyles.textLinkDestructive,
          ),
        ),
      ],
    );
  }
}

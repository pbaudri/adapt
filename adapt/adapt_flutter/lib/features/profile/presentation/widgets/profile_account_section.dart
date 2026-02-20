import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';

/// Account section with sign-in sync link and data deletion on the profile screen.
class ProfileAccountSection extends StatelessWidget {
  const ProfileAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AdaptSectionTitle(label: 'Account'),
        const SizedBox(height: AppDimensions.spacing12),
        AdaptInfoCard(
          child: Padding(
            padding: AppDimensions.cardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Using as guest',
                  style: AppTextStyles.bodyLarge,
                ),
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
        ),
        const SizedBox(height: AppDimensions.spacing24),
        Center(
          child: AdaptTextLink(
            label: 'Delete all my data',
            onTap: () {},
            textStyle: AppTextStyles.textLinkDestructive,
          ),
        ),
      ],
    );
  }
}

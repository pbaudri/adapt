import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/profile_provider.dart';

/// Notification and tracking preferences section on the profile screen.
class ProfilePreferencesSection extends ConsumerWidget {
  const ProfilePreferencesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return profileAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const SizedBox.shrink(),
      data: (profile) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AdaptSectionTitle(label: 'Preferences'),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptInfoFormCard(
            children: [
              AdaptPreferenceToggleRow(
                label: 'Track alcohol calories',
                subtitle: 'Include drinks in your daily total.',
                value: profile.alcoholTracking,
                onChanged: (v) => ref
                    .read(profileNotifierProvider.notifier)
                    .updatePreferences(
                      alcoholTracking: v,
                      morningRecap: profile.morningRecap,
                    ),
              ),
              const Divider(),
              AdaptPreferenceToggleRow(
                label: 'Morning recap',
                subtitle: 'A daily nudge each morning.',
                value: profile.morningRecap,
                onChanged: (v) => ref
                    .read(profileNotifierProvider.notifier)
                    .updatePreferences(
                      alcoholTracking: profile.alcoholTracking,
                      morningRecap: v,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

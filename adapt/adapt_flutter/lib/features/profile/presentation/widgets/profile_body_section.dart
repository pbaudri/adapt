import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/unit_converter.dart';
import '../providers/profile_provider.dart';

/// Body stats section (weight, height, age, goal) on the profile screen.
class ProfileBodySection extends ConsumerWidget {
  const ProfileBodySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return profileAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text(
        'Could not load profile.',
        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
      ),
      data: (profile) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AdaptSectionTitle(label: 'About you'),
          const SizedBox(height: AppDimensions.spacing12),
          AdaptInfoFormCard(
            children: [
              AdaptProfileRow(
                label: 'Weight',
                value: profile.weightKg != null
                    ? UnitConverter.formatWeight(
                        profile.weightKg!,
                        profile.weightUnit.name,
                      )
                    : '—',
                onTap: () {},
              ),
              const Divider(),
              AdaptProfileRow(
                label: 'Height',
                value: profile.heightCm != null
                    ? UnitConverter.formatHeight(
                        profile.heightCm!,
                        profile.heightUnit.name,
                      )
                    : '—',
                onTap: () {},
              ),
              const Divider(),
              AdaptProfileRow(
                label: 'Age',
                value: profile.age?.toString() ?? '—',
                onTap: () {},
              ),
              const Divider(),
              AdaptProfileRow(
                label: 'Goal',
                value: _goalLabel(profile.goal.name),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _goalLabel(String name) {
    switch (name) {
      case 'loseWeight':
        return 'Lose weight';
      case 'eatBetter':
        return 'Eat better';
      case 'stayAware':
        return 'Stay aware';
      default:
        return name;
    }
  }
}

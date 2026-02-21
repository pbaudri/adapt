import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/unit_converter.dart';
import '../providers/profile_provider.dart';
import 'edit_age_bottom_sheet.dart';
import 'edit_biological_sex_bottom_sheet.dart';
import 'edit_goal_bottom_sheet.dart';
import 'edit_height_bottom_sheet.dart';
import 'edit_weight_bottom_sheet.dart';

/// Body stats section (weight, height, age, biological sex, goal) on the profile screen.
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
                onTap: () => _showSheet(
                  context,
                  EditWeightBottomSheet(
                    currentWeightKg: profile.weightKg ?? 70,
                    currentUnit: profile.weightUnit.name,
                  ),
                ),
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
                onTap: () => _showSheet(
                  context,
                  EditHeightBottomSheet(
                    currentHeightCm: profile.heightCm ?? 170,
                    currentUnit: profile.heightUnit.name,
                  ),
                ),
              ),
              const Divider(),
              AdaptProfileRow(
                label: 'Age',
                value: profile.age?.toString() ?? '—',
                onTap: () => _showSheet(
                  context,
                  EditAgeBottomSheet(currentAge: profile.age ?? 25),
                ),
              ),
              const Divider(),
              AdaptProfileRow(
                label: 'Biological sex',
                value: _sexLabel(profile.biologicalSex),
                onTap: () => _showSheet(
                  context,
                  EditBiologicalSexBottomSheet(
                    currentSex: profile.biologicalSex,
                  ),
                ),
              ),
              const Divider(),
              AdaptProfileRow(
                label: 'Goal',
                value: _goalLabel(profile.goal.name),
                onTap: () => _showSheet(
                  context,
                  EditGoalBottomSheet(currentGoal: profile.goal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSheet(BuildContext context, Widget sheet) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => sheet,
    );
  }

  static String _sexLabel(BiologicalSex? sex) {
    switch (sex) {
      case BiologicalSex.male:
        return 'Male';
      case BiologicalSex.female:
        return 'Female';
      case null:
        return '—';
    }
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

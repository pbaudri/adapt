import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/profile_repository.dart';
import '../providers/profile_provider.dart';

/// Bottom sheet for editing the user's goal.
///
/// Shows the three goal options using [AdaptOptionRow]. The current goal
/// is pre-selected. On save the selection is persisted via the profile repository.
class EditGoalBottomSheet extends ConsumerStatefulWidget {
  const EditGoalBottomSheet({super.key, required this.currentGoal});

  final UserGoal currentGoal;

  @override
  ConsumerState<EditGoalBottomSheet> createState() =>
      _EditGoalBottomSheetState();
}

class _EditGoalBottomSheetState extends ConsumerState<EditGoalBottomSheet> {
  late UserGoal _selected;
  bool _isLoading = false;
  String? _error;

  static const _options = [
    (
      value: UserGoal.loseWeight,
      title: 'Lose weight',
      subtitle: 'Gradually, without obsessing over every calorie.',
      icon: Icons.trending_down_rounded,
    ),
    (
      value: UserGoal.eatBetter,
      title: 'Eat better',
      subtitle: 'More variety, better balance — no crash diets.',
      icon: Icons.eco_rounded,
    ),
    (
      value: UserGoal.stayAware,
      title: 'Stay aware',
      subtitle: 'Just curious what I eat, no specific goal.',
      icon: Icons.visibility_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selected = widget.currentGoal;
  }

  Future<void> _onSave() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      await ref.read(profileRepositoryProvider).updateGoal(_selected);
      if (mounted) {
        ref.invalidate(profileNotifierProvider);
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptBottomSheet(
      title: 'Your goal',
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._options.map(
              (o) => Padding(
                padding: const EdgeInsets.only(
                  bottom: AppDimensions.spacing12,
                ),
                child: AdaptOptionRow(
                  leading: Icon(
                    o.icon,
                    color: AppColors.primary,
                    size: 24,
                  ),
                  title: o.title,
                  subtitle: o.subtitle,
                  isSelected: _selected == o.value,
                  onTap: () => setState(() => _selected = o.value),
                ),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: AppDimensions.spacing8),
              Text(
                _error!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: AppDimensions.spacing12),
            AdaptPrimaryButton(
              label: 'Save',
              onTap: _onSave,
              isLoading: _isLoading,
            ),
            const SizedBox(height: AppDimensions.spacing12),
            AdaptTextLink(
              label: 'Cancel',
              onTap: () => Navigator.of(context).pop(),
              textStyle: AppTextStyles.textLinkMuted,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/profile_repository.dart';
import '../providers/profile_provider.dart';

/// Bottom sheet for editing the user's age.
///
/// Displays the current age with [AdaptLargeValueDisplay] and lets the user
/// increment or decrement via [AdaptQuantitySelector].
class EditAgeBottomSheet extends ConsumerStatefulWidget {
  const EditAgeBottomSheet({super.key, required this.currentAge});

  final int currentAge;

  @override
  ConsumerState<EditAgeBottomSheet> createState() => _EditAgeBottomSheetState();
}

class _EditAgeBottomSheetState extends ConsumerState<EditAgeBottomSheet> {
  late int _age;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _age = widget.currentAge;
  }

  Future<void> _onSave() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      await ref.read(profileRepositoryProvider).updateAge(_age);
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
      title: 'Age',
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdaptLargeValueDisplay(value: '$_age', unit: 'yrs'),
            const SizedBox(height: AppDimensions.spacing24),
            AdaptQuantitySelector(
              value: _age,
              label: 'years',
              onDecrement: () => setState(() => _age--),
              onIncrement: () => setState(() => _age++),
              minValue: 1,
            ),
            if (_error != null) ...[
              const SizedBox(height: AppDimensions.spacing16),
              Text(
                _error!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: AppDimensions.spacing24),
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

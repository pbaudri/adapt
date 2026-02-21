import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/profile_repository.dart';
import '../providers/profile_provider.dart';

/// Bottom sheet for editing the user's biological sex.
class EditBiologicalSexBottomSheet extends ConsumerStatefulWidget {
  const EditBiologicalSexBottomSheet({
    super.key,
    required this.currentSex,
  });

  final BiologicalSex? currentSex;

  @override
  ConsumerState<EditBiologicalSexBottomSheet> createState() =>
      _EditBiologicalSexBottomSheetState();
}

class _EditBiologicalSexBottomSheetState
    extends ConsumerState<EditBiologicalSexBottomSheet> {
  late String _selected;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _selected =
        widget.currentSex == BiologicalSex.female ? 'Female' : 'Male';
  }

  Future<void> _onSave() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final sex = _selected == 'Female'
          ? BiologicalSex.female
          : BiologicalSex.male;
      await ref.read(profileRepositoryProvider).updateBiologicalSex(sex);
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
      title: 'Biological sex',
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdaptUnitToggle(
              options: const ['Male', 'Female'],
              selected: _selected,
              onChanged: (v) => setState(() => _selected = v),
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

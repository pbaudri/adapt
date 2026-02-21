import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/unit_converter.dart';
import '../../data/profile_repository.dart';
import '../providers/profile_provider.dart';

/// Bottom sheet for editing the user's height and preferred height unit.
///
/// The value is entered via a number text field in the selected unit.
/// In ft mode the field accepts decimal feet (e.g. 5.9 for 5'10").
/// On save, the value is always stored in cm (SI) regardless of the selected unit.
class EditHeightBottomSheet extends ConsumerStatefulWidget {
  const EditHeightBottomSheet({
    super.key,
    required this.currentHeightCm,
    required this.currentUnit,
  });

  final double currentHeightCm;
  final String currentUnit;

  @override
  ConsumerState<EditHeightBottomSheet> createState() =>
      _EditHeightBottomSheetState();
}

class _EditHeightBottomSheetState extends ConsumerState<EditHeightBottomSheet> {
  late final TextEditingController _controller;
  late String _unit;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _unit = widget.currentUnit;
    _controller = TextEditingController(
      text: _valueForUnit(widget.currentHeightCm, _unit),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Returns the display string for a cm value in the given unit.
  // For ft: decimal feet (e.g. 178 cm → "5.8" ft).
  String _valueForUnit(double cm, String unit) {
    if (unit == 'ft') {
      final feet = cm / 30.48;
      return feet.toStringAsFixed(1);
    }
    return cm.round().toString();
  }

  // Converts the current displayed value to cm regardless of unit.
  double? _parseToCm(String text, String unit) {
    return UnitConverter.parseHeightToCm(text, unit);
  }

  void _onUnitChanged(String newUnit) {
    final currentCm = _parseToCm(_controller.text, _unit);
    setState(() {
      _unit = newUnit;
      if (currentCm != null) {
        _controller.text = _valueForUnit(currentCm, newUnit);
      }
    });
  }

  Future<void> _onSave() async {
    final cm = _parseToCm(_controller.text, _unit);
    if (cm == null) {
      setState(() => _error = 'Please enter a valid number.');
      return;
    }
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final repo = ref.read(profileRepositoryProvider);
      final unit = _unit == 'ft' ? HeightUnit.ft : HeightUnit.cm;
      await repo.updateHeight(cm);
      await repo.updateHeightUnit(unit);
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
      title: 'Height',
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: AdaptTextField(
                    hint: _unit == 'ft' ? 'Height (ft)' : 'Height',
                    controller: _controller,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.spacing12),
                SizedBox(
                  width: 110,
                  child: AdaptUnitToggle(
                    options: const ['cm', 'ft'],
                    selected: _unit,
                    onChanged: _onUnitChanged,
                  ),
                ),
              ],
            ),
            if (_unit == 'ft') ...[
              const SizedBox(height: AppDimensions.spacing8),
              Text(
                'Enter decimal feet — e.g. 5.9 for 5\'10"',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: AppDimensions.spacing12),
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

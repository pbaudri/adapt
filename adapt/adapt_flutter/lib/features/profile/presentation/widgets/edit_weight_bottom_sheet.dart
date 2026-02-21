import 'package:adapt_client/adapt_client.dart';
import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/unit_converter.dart';
import '../../data/profile_repository.dart';
import '../providers/profile_provider.dart';

/// Bottom sheet for editing the user's weight and preferred weight unit.
///
/// The value is entered via a number text field in the selected unit.
/// On save, the value is always stored in kg (SI) regardless of the selected unit.
class EditWeightBottomSheet extends ConsumerStatefulWidget {
  const EditWeightBottomSheet({
    super.key,
    required this.currentWeightKg,
    required this.currentUnit,
  });

  final double currentWeightKg;
  final String currentUnit;

  @override
  ConsumerState<EditWeightBottomSheet> createState() =>
      _EditWeightBottomSheetState();
}

class _EditWeightBottomSheetState extends ConsumerState<EditWeightBottomSheet> {
  late final TextEditingController _controller;
  late String _unit;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _unit = widget.currentUnit;
    _controller = TextEditingController(text: _valueForUnit(widget.currentWeightKg, _unit));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _valueForUnit(double kg, String unit) {
    if (unit == 'lbs') {
      return UnitConverter.kgToLbs(kg).toStringAsFixed(1);
    }
    return kg.toStringAsFixed(1);
  }

  void _onUnitChanged(String newUnit) {
    // Convert the current displayed value to the new unit before switching.
    final current = UnitConverter.parseWeightToKg(_controller.text, _unit);
    setState(() {
      _unit = newUnit;
      if (current != null) {
        _controller.text = _valueForUnit(current, newUnit);
      }
    });
  }

  Future<void> _onSave() async {
    final kg = UnitConverter.parseWeightToKg(_controller.text, _unit);
    if (kg == null) {
      setState(() => _error = 'Please enter a valid number.');
      return;
    }
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final repo = ref.read(profileRepositoryProvider);
      final unit = _unit == 'lbs' ? WeightUnit.lbs : WeightUnit.kg;
      await repo.updateWeight(kg);
      await repo.updateWeightUnit(unit);
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
      title: 'Weight',
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: AdaptTextField(
                    hint: 'Weight',
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
                    options: const ['kg', 'lbs'],
                    selected: _unit,
                    onChanged: _onUnitChanged,
                  ),
                ),
              ],
            ),
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

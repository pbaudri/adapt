import 'package:flutter/material.dart';

/// Data class representing a single item in [AdaptFabMenu].
///
/// - [leading] — icon or widget shown on the left of the row.
/// - [label] — text label for the action.
/// - [onTap] — callback invoked when the item is tapped.
class AdaptFabMenuItem {
  const AdaptFabMenuItem({
    required this.leading,
    required this.label,
    required this.onTap,
  });

  final Widget leading;
  final String label;
  final VoidCallback onTap;
}

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';

/// Card containing a vertical list of rows separated by [Divider]s.
///
/// Use for settings-style form sections (e.g. profile info, preferences).
///
/// - [children] — list of row widgets; a [Divider] is inserted between each.
class AdaptInfoFormCard extends StatelessWidget {
  const AdaptInfoFormCard({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (i < children.length - 1) {
        items.add(const Divider(
          color: AppColors.surfaceElevated,
          thickness: 1,
          height: 1,
        ));
      }
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }
}

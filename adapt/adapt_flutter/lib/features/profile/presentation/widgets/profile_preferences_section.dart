import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Notification and tracking preferences section on the profile screen.
class ProfilePreferencesSection extends StatefulWidget {
  const ProfilePreferencesSection({super.key});

  @override
  State<ProfilePreferencesSection> createState() =>
      _ProfilePreferencesSectionState();
}

class _ProfilePreferencesSectionState extends State<ProfilePreferencesSection> {
  bool _alcoholTracking = true;
  bool _morningRecap = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AdaptSectionTitle(label: 'Preferences'),
        const SizedBox(height: AppDimensions.spacing12),
        AdaptInfoFormCard(
          children: [
            AdaptPreferenceToggleRow(
              label: 'Track alcohol calories',
              subtitle: 'Include drinks in your daily total.',
              value: _alcoholTracking,
              onChanged: (v) => setState(() => _alcoholTracking = v),
            ),
            const Divider(),
            AdaptPreferenceToggleRow(
              label: 'Morning recap',
              subtitle: 'A daily nudge each morning.',
              value: _morningRecap,
              onChanged: (v) => setState(() => _morningRecap = v),
            ),
          ],
        ),
      ],
    );
  }
}

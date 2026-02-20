import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

/// Body stats section (weight, height, age, goal) on the profile screen.
class ProfileBodySection extends StatelessWidget {
  const ProfileBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AdaptSectionTitle(label: 'About you'),
        const SizedBox(height: AppDimensions.spacing12),
        AdaptInfoFormCard(
          children: [
            AdaptProfileRow(
              label: 'Weight',
              value: '82 kg',
              onTap: () {},
            ),
            const Divider(),
            AdaptProfileRow(
              label: 'Height',
              value: '180 cm',
              onTap: () {},
            ),
            const Divider(),
            AdaptProfileRow(
              label: 'Age',
              value: '28',
              onTap: () {},
            ),
            const Divider(),
            AdaptProfileRow(
              label: 'Goal',
              value: 'Eat better',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

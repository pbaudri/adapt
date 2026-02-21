import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/profile_account_section.dart';
import 'widgets/profile_body_section.dart';
import 'widgets/profile_preferences_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: SliverToBoxAdapter(
                child: Text('Profile', style: AppTextStyles.titleLarge),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: const SliverToBoxAdapter(child: ProfileBodySection()),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: const SliverToBoxAdapter(
                child: ProfilePreferencesSection(),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: AppDimensions.spacing48,
              ),
              sliver: const SliverToBoxAdapter(child: ProfileAccountSection()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdaptBottomNavBar(
        currentIndex: 2,
        onTap: (index) => _onNavTap(context, index),
      ),
    );
  }

  void _onNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
      case 1:
        context.go(AppRoutes.history);
      case 2:
        context.go(AppRoutes.profile);
    }
  }
}

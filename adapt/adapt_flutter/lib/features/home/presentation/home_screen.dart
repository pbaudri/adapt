import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/home_daily_card.dart';
import 'widgets/home_header.dart';
import 'widgets/home_meal_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              sliver: const SliverToBoxAdapter(child: HomeHeader()),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: const SliverToBoxAdapter(
                child: AdaptSectionTitle(label: 'Today'),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing12,
                bottom: 0,
              ),
              sliver: const SliverToBoxAdapter(child: HomeDailyCard()),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: const SliverToBoxAdapter(
                child: AdaptSectionTitle(label: 'Meals'),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing12,
                bottom: AppDimensions.spacing24,
              ),
              sliver: const SliverToBoxAdapter(child: HomeMealList()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutes.mealDescribe),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: AppColors.textPrimary),
      ),
      bottomNavigationBar: AdaptBottomNavBar(
        currentIndex: 0,
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

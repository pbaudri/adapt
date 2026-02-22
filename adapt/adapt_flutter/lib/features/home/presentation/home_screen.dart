import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

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
    );
  }
}

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'widgets/history_chart_section.dart';
import 'widgets/history_day_section.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedBarIndex = 6; // Sunday selected by default
  DateTime _weekStart = DateTime(2026, 2, 16);

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
                child: Text('History', style: AppTextStyles.titleLarge),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: 0,
              ),
              sliver: SliverToBoxAdapter(
                child: HistoryChartSection(
                  weekLabel: '16 Feb – 22 Feb',
                  selectedIndex: _selectedBarIndex,
                  onPrevious: () => setState(
                    () => _weekStart = _weekStart.subtract(const Duration(days: 7)),
                  ),
                  onNext: () => setState(
                    () => _weekStart = _weekStart.add(const Duration(days: 7)),
                  ),
                  onBarTap: (i) => setState(() => _selectedBarIndex = i),
                ),
              ),
            ),
            SliverPadding(
              padding: AppDimensions.screenPadding.copyWith(
                top: AppDimensions.spacing24,
                bottom: AppDimensions.spacing24,
              ),
              sliver: const SliverToBoxAdapter(
                child: HistoryDaySection(dayLabel: 'Sunday, 22 Feb'),
              ),
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
        context.push(AppRoutes.mealDescribe);
      case 2:
        context.go(AppRoutes.history);
      case 3:
        context.go(AppRoutes.profile);
    }
  }
}

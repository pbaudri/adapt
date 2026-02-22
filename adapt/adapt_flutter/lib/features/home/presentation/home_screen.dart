import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../morning_recap/presentation/providers/morning_recap_provider.dart';
import 'providers/home_provider.dart';
import 'widgets/home_daily_card.dart';
import 'widgets/home_header.dart';
import 'widgets/home_meal_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _recapShownThisSession = false;

  @override
  void initState() {
    super.initState();
    // Trigger recap generation once when home screen first mounts, in morning.
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ref.read(morningRecapNotifierProvider.notifier).generate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Auto-show morning recap when generation completes (unseen recaps only).
    ref.listen<AsyncValue<dynamic>>(morningRecapNotifierProvider, (_, next) {
      if (_recapShownThisSession) return;
      final hour = DateTime.now().hour;
      if (hour < 5 || hour >= 12) return;

      next.whenData((recap) {
        if (recap == null) return;
        // Only auto-show if the user hasn't seen it yet today.
        if (recap.seenAt != null) return;
        setState(() => _recapShownThisSession = true);
        context.push(AppRoutes.morningRecap);
      });
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => ref.invalidate(homeDataProvider),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppDimensions.screenPadding.copyWith(
                  top: AppDimensions.spacing24,
                  bottom: 0,
                ),
                sliver: const SliverToBoxAdapter(child: HomeHeader()),
              ),

              // Recap banner — visible whenever today's recap exists.
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
      ),
    );
  }
}

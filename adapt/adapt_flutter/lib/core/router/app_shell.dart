import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

/// Persistent shell widget that holds the bottom nav bar and FAB.
///
/// The nav bar and FAB are rendered once and never rebuilt on tab switches.
/// The body slides horizontally when the active tab changes:
///   - tapping a tab to the right → content slides in from the right
///   - tapping a tab to the left  → content slides in from the left
class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // +1 → slide in from right (user moved right), -1 → from left.
  double _slideDirection = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
      value: 1.0, // Start settled so first build has no offset.
    );
  }

  @override
  void didUpdateWidget(AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldIndex = oldWidget.navigationShell.currentIndex;
    final newIndex = widget.navigationShell.currentIndex;
    if (oldIndex != newIndex) {
      _slideDirection = newIndex > oldIndex ? 1 : -1;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final screenWidth = MediaQuery.of(context).size.width;
            final progress = Curves.easeOutCubic.transform(_controller.value);
            final dx = screenWidth * _slideDirection * (1 - progress);
            return Transform.translate(
              offset: Offset(dx, 0),
              child: child,
            );
          },
          child: widget.navigationShell,
        ),
      ),
      floatingActionButton: widget.navigationShell.currentIndex == 0
          ? Padding(
              padding: AppDimensions.screenPadding,
              child: AdaptFabMenu(
                items: [
                  AdaptFabMenuItem(
                    leading: const Icon(
                      Icons.restaurant_rounded,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                    label: 'Log a meal',
                    onTap: () => context.push(AppRoutes.mealDescribe),
                  ),
                  AdaptFabMenuItem(
                    leading: const Icon(
                      Icons.local_bar_rounded,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                    label: 'Log a drink',
                    onTap: () => context.push(AppRoutes.drinks),
                  ),
                ],
              ),
            )
          : null,
      bottomNavigationBar: AdaptBottomNavBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) => widget.navigationShell.goBranch(
          index,
          initialLocation: index == widget.navigationShell.currentIndex,
        ),
      ),
    );
  }
}

import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

/// Persistent shell widget that holds the bottom nav bar and FAB.
///
/// This widget is rendered once by [StatefulShellRoute] and keeps the
/// [AdaptBottomNavBar] alive across tab switches. Only the content area
/// ([navigationShell]) animates when the user switches tabs.
///
/// The [AdaptFabMenu] is shown only on the Home tab (index 0).
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: navigationShell,
      floatingActionButton: navigationShell.currentIndex == 0
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
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          // Re-navigate to the branch's initial route when tapping the
          // already-active tab (standard "go to root" UX pattern).
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

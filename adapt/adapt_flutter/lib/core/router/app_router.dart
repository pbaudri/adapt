import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/sign_in_screen.dart';
import '../../features/auth/presentation/sign_up_screen.dart';
import '../../features/drinks/presentation/drinks_screen.dart';
import '../../features/history/presentation/history_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/meal_log/presentation/describe_meal_screen.dart';
import '../../features/meal_log/presentation/edit_meal_screen.dart';
import '../../features/meal_log/presentation/meal_result_screen.dart';
import '../../features/meal_log/presentation/photo_meal_screen.dart';
import '../../features/morning_recap/presentation/morning_recap_screen.dart';
import '../../features/onboarding/presentation/alcohol_screen.dart';
import '../../features/onboarding/presentation/eating_style_screen.dart';
import '../../features/onboarding/presentation/goal_screen.dart';
import '../../features/onboarding/presentation/name_screen.dart';
import '../../features/onboarding/presentation/personal_info_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/providers/profile_provider.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final notifier = _RouterNotifier(ref);
  return GoRouter(
    initialLocation: AppRoutes.signIn,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      // ── Auth ──────────────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.signIn,
        builder: (BuildContext context, GoRouterState state) =>
            const SignInScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpScreen(),
      ),

      // ── Onboarding ────────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.onboardingName,
        builder: (BuildContext context, GoRouterState state) =>
            const NameScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingEatingStyle,
        builder: (BuildContext context, GoRouterState state) =>
            const EatingStyleScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingGoal,
        builder: (BuildContext context, GoRouterState state) =>
            const GoalScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingAlcohol,
        builder: (BuildContext context, GoRouterState state) =>
            const AlcoholScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingPersonalInfo,
        builder: (BuildContext context, GoRouterState state) =>
            const PersonalInfoScreen(),
      ),

      // ── Main tabs ──────────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.history,
        builder: (BuildContext context, GoRouterState state) =>
            const HistoryScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (BuildContext context, GoRouterState state) =>
            const ProfileScreen(),
      ),

      // ── Meal log ───────────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.mealPhoto,
        builder: (BuildContext context, GoRouterState state) =>
            const PhotoMealScreen(),
      ),
      GoRoute(
        path: AppRoutes.mealDescribe,
        builder: (BuildContext context, GoRouterState state) =>
            const DescribeMealScreen(),
      ),
      GoRoute(
        path: AppRoutes.mealResult,
        builder: (BuildContext context, GoRouterState state) =>
            const MealResultScreen(),
      ),
      GoRoute(
        path: AppRoutes.mealEdit,
        builder: (BuildContext context, GoRouterState state) =>
            const EditMealScreen(),
      ),

      // ── Drinks ─────────────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.drinks,
        builder: (BuildContext context, GoRouterState state) =>
            const DrinksScreen(),
      ),

      // ── Morning recap ──────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.morningRecap,
        builder: (BuildContext context, GoRouterState state) =>
            const MorningRecapScreen(),
      ),
    ],
  );
}

/// Bridges Riverpod auth/profile state into a [ChangeNotifier] that
/// [GoRouter.refreshListenable] can watch. Provides the [redirect] callback
/// that enforces the post-auth routing contract:
///
///   - Unauthenticated → /sign-in
///   - Authenticated + auth page + guest → /onboarding/name
///   - Authenticated + auth page + real user:
///       name null  → /onboarding/name
///       age null   → /onboarding/eating-style  (resume mid-onboarding)
///       complete   → /home
///   - Authenticated + /home + real user + onboarding incomplete → onboarding
class _RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  _RouterNotifier(this._ref) {
    // Listen to both providers so go_router re-evaluates redirect on any change.
    _ref.listen(authNotifierProvider, (_, _) => notifyListeners());
    _ref.listen(profileNotifierProvider, (_, _) => notifyListeners());
  }

  FutureOr<String?> redirect(
    BuildContext context,
    GoRouterState routerState,
  ) async {
    final location = routerState.matchedLocation;
    final isOnAuthPage =
        location == AppRoutes.signIn || location == AppRoutes.signUp;

    final authState = _ref.read(authNotifierProvider);

    // ── Checking (app launch session restore) ────────────────────────────────
    // Stay put while restoring a previous session from secure storage.
    final isChecking = authState.maybeWhen(checking: () => true, orElse: () => false);
    if (isChecking) return null;

    final isAuthenticated = authState.maybeWhen(
      authenticated: (_) => true,
      orElse: () => false,
    );

    // ── Unauthenticated ──────────────────────────────────────────────────────
    // Allow auth pages; redirect everything else to sign-in.
    if (!isAuthenticated) {
      return isOnAuthPage ? null : AppRoutes.signIn;
    }

    // ── Guest ────────────────────────────────────────────────────────────────
    // Guests can freely navigate, including back to auth pages to sign in.
    // The guest → onboarding navigation is handled explicitly in sign_in_body.dart
    // after continueAsGuest() succeeds, so no router redirect is needed here.
    final isGuest = authState.maybeWhen(
      authenticated: (token) => token.isGuest,
      orElse: () => false,
    );
    if (isGuest) return null;

    // ── Real user — check onboarding completion ──────────────────────────────
    // Apply the profile check when routing FROM an auth page (normal post-auth
    // redirect) OR when navigating TO /home (handles the case where the sign-in
    // screen unconditionally calls context.go(AppRoutes.home) on success).
    final isOnHome = location == AppRoutes.home;
    if (isOnAuthPage || isOnHome) {
      try {
        // profileNotifierProvider is already being listened to above, so its
        // Future resolves quickly without making an extra network request.
        final profile = await _ref.read(profileNotifierProvider.future);

        if (profile.name == null) return AppRoutes.onboardingName;

        // name set but personal-info step not yet done → resume onboarding.
        if (profile.age == null) return AppRoutes.onboardingEatingStyle;

        // Onboarding complete.
        if (isOnAuthPage) return AppRoutes.home;
        // On home and complete → no redirect needed.
      } catch (_) {
        // Profile fetch failed (e.g. not yet loaded, network error).
        // Return null and wait for the next redirect trigger — profileNotifier
        // will rebuild once auth resolves and call notifyListeners again.
        return null;
      }
    }

    return null;
  }
}

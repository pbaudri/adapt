import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.signIn,
  routes: [
    // ── Auth ────────────────────────────────────────────────────────────────
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

    // ── Onboarding ──────────────────────────────────────────────────────────
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

    // ── Main tabs ────────────────────────────────────────────────────────────
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

    // ── Meal log ─────────────────────────────────────────────────────────────
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

    // ── Drinks ───────────────────────────────────────────────────────────────
    GoRoute(
      path: AppRoutes.drinks,
      builder: (BuildContext context, GoRouterState state) =>
          const DrinksScreen(),
    ),

    // ── Morning recap ────────────────────────────────────────────────────────
    GoRoute(
      path: AppRoutes.morningRecap,
      builder: (BuildContext context, GoRouterState state) =>
          const MorningRecapScreen(),
    ),
  ],
);

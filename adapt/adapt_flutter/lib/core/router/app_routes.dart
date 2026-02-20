/// All route path constants for the Adapt app.
///
/// Always use these constants with [context.push] or [context.go].
/// Never hardcode path strings in screen widgets.
abstract final class AppRoutes {
  // ── Auth ──────────────────────────────────────────────────────────────────
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';

  // ── Onboarding ────────────────────────────────────────────────────────────
  static const onboardingName = '/onboarding/name';
  static const onboardingEatingStyle = '/onboarding/eating-style';
  static const onboardingGoal = '/onboarding/goal';
  static const onboardingAlcohol = '/onboarding/alcohol';
  static const onboardingPersonalInfo = '/onboarding/personal-info';

  // ── Main tabs ─────────────────────────────────────────────────────────────
  static const home = '/home';
  static const history = '/history';
  static const profile = '/profile';

  // ── Meal log ──────────────────────────────────────────────────────────────
  static const mealPhoto = '/meal/photo';
  static const mealDescribe = '/meal/describe';
  static const mealResult = '/meal/result';
  static const mealEdit = '/meal/edit';

  // ── Drinks ────────────────────────────────────────────────────────────────
  static const drinks = '/drinks';

  // ── Morning recap ─────────────────────────────────────────────────────────
  static const morningRecap = '/morning-recap';
}

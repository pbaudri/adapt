import '../generated/protocol.dart';

/// Single source of truth for all calorie calculations.
///
/// This is the ONLY place in the codebase where calories are computed.
/// The formula is: calories = (proteinG × 4) + (carbsG × 4) + (fatG × 9).
/// caloriesKcal is NEVER accepted as user input — always recalculated here.
abstract final class NutritionService {
  /// Calculates total calories from macronutrient values.
  ///
  /// - Protein contributes 4 kcal/g
  /// - Carbohydrates contribute 4 kcal/g
  /// - Fat contributes 9 kcal/g
  static int calculateCalories({
    required double proteinG,
    required double carbsG,
    required double fatG,
  }) {
    return ((proteinG * 4) + (carbsG * 4) + (fatG * 9)).round();
  }

  /// Returns the estimated daily calorie target based on basic profile data.
  ///
  /// Uses a simplified Mifflin-St Jeor equation with a sedentary activity
  /// multiplier. The result is used as a soft target — never presented as
  /// a hard limit to the user.
  static int estimateDailyTarget({
    required double weightKg,
    required double heightCm,
    required int age,
    required BiologicalSex biologicalSex,
    required UserGoal goal,
  }) {
    // Mifflin-St Jeor BMR
    final bmr = biologicalSex == BiologicalSex.female
        ? (10 * weightKg) + (6.25 * heightCm) - (5 * age) - 161
        : (10 * weightKg) + (6.25 * heightCm) - (5 * age) + 5;

    // Sedentary TDEE (×1.2) — conservative starting point
    final tdee = (bmr * 1.2).round();

    return switch (goal) {
      UserGoal.loseWeight => (tdee * 0.85).round(), // ~15% deficit
      UserGoal.eatBetter => tdee,
      UserGoal.stayAware => tdee,
    };
  }
}

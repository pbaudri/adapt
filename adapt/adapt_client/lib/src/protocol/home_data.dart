/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'meal_log.dart' as _i2;
import 'meal_result.dart' as _i3;
import 'drink_log.dart' as _i4;
import 'package:adapt_client/src/protocol/protocol.dart' as _i5;

/// Aggregated response for the home screen.
/// Combines greeting, daily summary, and recent meals.
abstract class HomeData implements _i1.SerializableModel {
  HomeData._({
    required this.greeting,
    required this.dailyKcal,
    required this.targetKcal,
    required this.adaptiveMessage,
    required this.meals,
    required this.mealResults,
    required this.totalProteinG,
    required this.totalCarbsG,
    required this.totalFatG,
    required this.hadAlcohol,
    required this.todayDrinks,
  });

  factory HomeData({
    required String greeting,
    required int dailyKcal,
    required int targetKcal,
    required String adaptiveMessage,
    required List<_i2.MealLog> meals,
    required List<_i3.MealResult> mealResults,
    required double totalProteinG,
    required double totalCarbsG,
    required double totalFatG,
    required bool hadAlcohol,
    required List<_i4.DrinkLog> todayDrinks,
  }) = _HomeDataImpl;

  factory HomeData.fromJson(Map<String, dynamic> jsonSerialization) {
    return HomeData(
      greeting: jsonSerialization['greeting'] as String,
      dailyKcal: jsonSerialization['dailyKcal'] as int,
      targetKcal: jsonSerialization['targetKcal'] as int,
      adaptiveMessage: jsonSerialization['adaptiveMessage'] as String,
      meals: _i5.Protocol().deserialize<List<_i2.MealLog>>(
        jsonSerialization['meals'],
      ),
      mealResults: _i5.Protocol().deserialize<List<_i3.MealResult>>(
        jsonSerialization['mealResults'],
      ),
      totalProteinG: (jsonSerialization['totalProteinG'] as num).toDouble(),
      totalCarbsG: (jsonSerialization['totalCarbsG'] as num).toDouble(),
      totalFatG: (jsonSerialization['totalFatG'] as num).toDouble(),
      hadAlcohol: jsonSerialization['hadAlcohol'] as bool,
      todayDrinks: _i5.Protocol().deserialize<List<_i4.DrinkLog>>(
        jsonSerialization['todayDrinks'],
      ),
    );
  }

  /// Personalised greeting, e.g. "Good morning, Pierre."
  String greeting;

  /// Total calories consumed today.
  int dailyKcal;

  /// Target daily calorie budget.
  int targetKcal;

  /// Zero-judgment adaptive message based on today's intake.
  String adaptiveMessage;

  /// Last 3 confirmed meal logs for today (most recent first).
  List<_i2.MealLog> meals;

  /// Meal results keyed to each meal log.
  List<_i3.MealResult> mealResults;

  /// Today's total protein in grams (from DailySummary).
  double totalProteinG;

  /// Today's total carbs in grams (from DailySummary).
  double totalCarbsG;

  /// Today's total fat in grams (from DailySummary).
  double totalFatG;

  /// True if the user logged any drinks today.
  bool hadAlcohol;

  /// Today's drink logs (all, most recent first).
  List<_i4.DrinkLog> todayDrinks;

  /// Returns a shallow copy of this [HomeData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  HomeData copyWith({
    String? greeting,
    int? dailyKcal,
    int? targetKcal,
    String? adaptiveMessage,
    List<_i2.MealLog>? meals,
    List<_i3.MealResult>? mealResults,
    double? totalProteinG,
    double? totalCarbsG,
    double? totalFatG,
    bool? hadAlcohol,
    List<_i4.DrinkLog>? todayDrinks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HomeData',
      'greeting': greeting,
      'dailyKcal': dailyKcal,
      'targetKcal': targetKcal,
      'adaptiveMessage': adaptiveMessage,
      'meals': meals.toJson(valueToJson: (v) => v.toJson()),
      'mealResults': mealResults.toJson(valueToJson: (v) => v.toJson()),
      'totalProteinG': totalProteinG,
      'totalCarbsG': totalCarbsG,
      'totalFatG': totalFatG,
      'hadAlcohol': hadAlcohol,
      'todayDrinks': todayDrinks.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _HomeDataImpl extends HomeData {
  _HomeDataImpl({
    required String greeting,
    required int dailyKcal,
    required int targetKcal,
    required String adaptiveMessage,
    required List<_i2.MealLog> meals,
    required List<_i3.MealResult> mealResults,
    required double totalProteinG,
    required double totalCarbsG,
    required double totalFatG,
    required bool hadAlcohol,
    required List<_i4.DrinkLog> todayDrinks,
  }) : super._(
         greeting: greeting,
         dailyKcal: dailyKcal,
         targetKcal: targetKcal,
         adaptiveMessage: adaptiveMessage,
         meals: meals,
         mealResults: mealResults,
         totalProteinG: totalProteinG,
         totalCarbsG: totalCarbsG,
         totalFatG: totalFatG,
         hadAlcohol: hadAlcohol,
         todayDrinks: todayDrinks,
       );

  /// Returns a shallow copy of this [HomeData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  HomeData copyWith({
    String? greeting,
    int? dailyKcal,
    int? targetKcal,
    String? adaptiveMessage,
    List<_i2.MealLog>? meals,
    List<_i3.MealResult>? mealResults,
    double? totalProteinG,
    double? totalCarbsG,
    double? totalFatG,
    bool? hadAlcohol,
    List<_i4.DrinkLog>? todayDrinks,
  }) {
    return HomeData(
      greeting: greeting ?? this.greeting,
      dailyKcal: dailyKcal ?? this.dailyKcal,
      targetKcal: targetKcal ?? this.targetKcal,
      adaptiveMessage: adaptiveMessage ?? this.adaptiveMessage,
      meals: meals ?? this.meals.map((e0) => e0.copyWith()).toList(),
      mealResults:
          mealResults ?? this.mealResults.map((e0) => e0.copyWith()).toList(),
      totalProteinG: totalProteinG ?? this.totalProteinG,
      totalCarbsG: totalCarbsG ?? this.totalCarbsG,
      totalFatG: totalFatG ?? this.totalFatG,
      hadAlcohol: hadAlcohol ?? this.hadAlcohol,
      todayDrinks:
          todayDrinks ?? this.todayDrinks.map((e0) => e0.copyWith()).toList(),
    );
  }
}

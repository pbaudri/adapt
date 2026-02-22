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
import 'package:serverpod/serverpod.dart' as _i1;
import 'meal_log.dart' as _i2;
import 'meal_result.dart' as _i3;
import 'package:adapt_server/src/generated/protocol.dart' as _i4;

/// Aggregated response for the home screen.
/// Combines greeting, daily summary, and recent meals.
abstract class HomeData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
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
  }) = _HomeDataImpl;

  factory HomeData.fromJson(Map<String, dynamic> jsonSerialization) {
    return HomeData(
      greeting: jsonSerialization['greeting'] as String,
      dailyKcal: jsonSerialization['dailyKcal'] as int,
      targetKcal: jsonSerialization['targetKcal'] as int,
      adaptiveMessage: jsonSerialization['adaptiveMessage'] as String,
      meals: _i4.Protocol().deserialize<List<_i2.MealLog>>(
        jsonSerialization['meals'],
      ),
      mealResults: _i4.Protocol().deserialize<List<_i3.MealResult>>(
        jsonSerialization['mealResults'],
      ),
      totalProteinG: (jsonSerialization['totalProteinG'] as num).toDouble(),
      totalCarbsG: (jsonSerialization['totalCarbsG'] as num).toDouble(),
      totalFatG: (jsonSerialization['totalFatG'] as num).toDouble(),
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

  /// Today's meal logs (most recent first).
  List<_i2.MealLog> meals;

  /// Today's meal results keyed to each meal log.
  List<_i3.MealResult> mealResults;

  /// Today's total protein in grams (from DailySummary).
  double totalProteinG;

  /// Today's total carbs in grams (from DailySummary).
  double totalCarbsG;

  /// Today's total fat in grams (from DailySummary).
  double totalFatG;

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
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HomeData',
      'greeting': greeting,
      'dailyKcal': dailyKcal,
      'targetKcal': targetKcal,
      'adaptiveMessage': adaptiveMessage,
      'meals': meals.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'mealResults': mealResults.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'totalProteinG': totalProteinG,
      'totalCarbsG': totalCarbsG,
      'totalFatG': totalFatG,
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
    );
  }
}

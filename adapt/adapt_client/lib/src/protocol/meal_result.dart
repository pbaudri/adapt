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

/// AI-estimated or user-corrected nutritional result for a meal.
/// One-to-one with meal_logs.
abstract class MealResult implements _i1.SerializableModel {
  MealResult._({
    this.id,
    required this.mealLogId,
    required this.name,
    required this.caloriesKcal,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.aiMessage,
    this.aiTip,
    required this.source,
  });

  factory MealResult({
    int? id,
    required int mealLogId,
    required String name,
    required int caloriesKcal,
    required double proteinG,
    required double carbsG,
    required double fatG,
    required String aiMessage,
    String? aiTip,
    required String source,
  }) = _MealResultImpl;

  factory MealResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return MealResult(
      id: jsonSerialization['id'] as int?,
      mealLogId: jsonSerialization['mealLogId'] as int,
      name: jsonSerialization['name'] as String,
      caloriesKcal: jsonSerialization['caloriesKcal'] as int,
      proteinG: (jsonSerialization['proteinG'] as num).toDouble(),
      carbsG: (jsonSerialization['carbsG'] as num).toDouble(),
      fatG: (jsonSerialization['fatG'] as num).toDouble(),
      aiMessage: jsonSerialization['aiMessage'] as String,
      aiTip: jsonSerialization['aiTip'] as String?,
      source: jsonSerialization['source'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// FK → meal_logs.id (one-to-one).
  int mealLogId;

  /// AI-normalised meal name, e.g. "Big Mac Menu".
  String name;

  /// Auto-calculated: (proteinG×4) + (carbsG×4) + (fatG×9). Never user-supplied.
  int caloriesKcal;

  /// Protein in grams.
  double proteinG;

  /// Carbohydrates in grams.
  double carbsG;

  /// Fat in grams.
  double fatG;

  /// Zero-judgment AI message shown to the user.
  String aiMessage;

  /// Optional follow-up suggestion from AI.
  String? aiTip;

  /// Source: 'ai_estimated' | 'database' | 'user_corrected'
  String source;

  /// Returns a shallow copy of this [MealResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MealResult copyWith({
    int? id,
    int? mealLogId,
    String? name,
    int? caloriesKcal,
    double? proteinG,
    double? carbsG,
    double? fatG,
    String? aiMessage,
    String? aiTip,
    String? source,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MealResult',
      if (id != null) 'id': id,
      'mealLogId': mealLogId,
      'name': name,
      'caloriesKcal': caloriesKcal,
      'proteinG': proteinG,
      'carbsG': carbsG,
      'fatG': fatG,
      'aiMessage': aiMessage,
      if (aiTip != null) 'aiTip': aiTip,
      'source': source,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MealResultImpl extends MealResult {
  _MealResultImpl({
    int? id,
    required int mealLogId,
    required String name,
    required int caloriesKcal,
    required double proteinG,
    required double carbsG,
    required double fatG,
    required String aiMessage,
    String? aiTip,
    required String source,
  }) : super._(
         id: id,
         mealLogId: mealLogId,
         name: name,
         caloriesKcal: caloriesKcal,
         proteinG: proteinG,
         carbsG: carbsG,
         fatG: fatG,
         aiMessage: aiMessage,
         aiTip: aiTip,
         source: source,
       );

  /// Returns a shallow copy of this [MealResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MealResult copyWith({
    Object? id = _Undefined,
    int? mealLogId,
    String? name,
    int? caloriesKcal,
    double? proteinG,
    double? carbsG,
    double? fatG,
    String? aiMessage,
    Object? aiTip = _Undefined,
    String? source,
  }) {
    return MealResult(
      id: id is int? ? id : this.id,
      mealLogId: mealLogId ?? this.mealLogId,
      name: name ?? this.name,
      caloriesKcal: caloriesKcal ?? this.caloriesKcal,
      proteinG: proteinG ?? this.proteinG,
      carbsG: carbsG ?? this.carbsG,
      fatG: fatG ?? this.fatG,
      aiMessage: aiMessage ?? this.aiMessage,
      aiTip: aiTip is String? ? aiTip : this.aiTip,
      source: source ?? this.source,
    );
  }
}

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

/// Input for correcting a meal's nutritional values.
/// caloriesKcal is deliberately excluded — it is always recalculated
/// server-side via NutritionService: (p×4) + (c×4) + (f×9).
abstract class MealCorrectionInput implements _i1.SerializableModel {
  MealCorrectionInput._({
    this.name,
    this.proteinG,
    this.carbsG,
    this.fatG,
  });

  factory MealCorrectionInput({
    String? name,
    double? proteinG,
    double? carbsG,
    double? fatG,
  }) = _MealCorrectionInputImpl;

  factory MealCorrectionInput.fromJson(Map<String, dynamic> jsonSerialization) {
    return MealCorrectionInput(
      name: jsonSerialization['name'] as String?,
      proteinG: (jsonSerialization['proteinG'] as num?)?.toDouble(),
      carbsG: (jsonSerialization['carbsG'] as num?)?.toDouble(),
      fatG: (jsonSerialization['fatG'] as num?)?.toDouble(),
    );
  }

  /// Updated meal name. Null means keep existing.
  String? name;

  /// Updated protein in grams. Null means keep existing.
  double? proteinG;

  /// Updated carbohydrates in grams. Null means keep existing.
  double? carbsG;

  /// Updated fat in grams. Null means keep existing.
  double? fatG;

  /// Returns a shallow copy of this [MealCorrectionInput]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MealCorrectionInput copyWith({
    String? name,
    double? proteinG,
    double? carbsG,
    double? fatG,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MealCorrectionInput',
      if (name != null) 'name': name,
      if (proteinG != null) 'proteinG': proteinG,
      if (carbsG != null) 'carbsG': carbsG,
      if (fatG != null) 'fatG': fatG,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MealCorrectionInputImpl extends MealCorrectionInput {
  _MealCorrectionInputImpl({
    String? name,
    double? proteinG,
    double? carbsG,
    double? fatG,
  }) : super._(
         name: name,
         proteinG: proteinG,
         carbsG: carbsG,
         fatG: fatG,
       );

  /// Returns a shallow copy of this [MealCorrectionInput]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MealCorrectionInput copyWith({
    Object? name = _Undefined,
    Object? proteinG = _Undefined,
    Object? carbsG = _Undefined,
    Object? fatG = _Undefined,
  }) {
    return MealCorrectionInput(
      name: name is String? ? name : this.name,
      proteinG: proteinG is double? ? proteinG : this.proteinG,
      carbsG: carbsG is double? ? carbsG : this.carbsG,
      fatG: fatG is double? ? fatG : this.fatG,
    );
  }
}

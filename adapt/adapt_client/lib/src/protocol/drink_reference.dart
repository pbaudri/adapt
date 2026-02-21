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
import 'enums/drink_type.dart' as _i2;

/// Static reference table for drink calorie values.
/// Populated once via seed migration. Never modified at runtime.
abstract class DrinkReference implements _i1.SerializableModel {
  DrinkReference._({
    this.id,
    required this.drinkType,
    required this.caloriesPerUnit,
  });

  factory DrinkReference({
    int? id,
    required _i2.DrinkType drinkType,
    required int caloriesPerUnit,
  }) = _DrinkReferenceImpl;

  factory DrinkReference.fromJson(Map<String, dynamic> jsonSerialization) {
    return DrinkReference(
      id: jsonSerialization['id'] as int?,
      drinkType: _i2.DrinkType.fromJson(
        (jsonSerialization['drinkType'] as String),
      ),
      caloriesPerUnit: jsonSerialization['caloriesPerUnit'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Drink type identifier.
  _i2.DrinkType drinkType;

  /// Calories per standard glass/unit.
  int caloriesPerUnit;

  /// Returns a shallow copy of this [DrinkReference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrinkReference copyWith({
    int? id,
    _i2.DrinkType? drinkType,
    int? caloriesPerUnit,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DrinkReference',
      if (id != null) 'id': id,
      'drinkType': drinkType.toJson(),
      'caloriesPerUnit': caloriesPerUnit,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrinkReferenceImpl extends DrinkReference {
  _DrinkReferenceImpl({
    int? id,
    required _i2.DrinkType drinkType,
    required int caloriesPerUnit,
  }) : super._(
         id: id,
         drinkType: drinkType,
         caloriesPerUnit: caloriesPerUnit,
       );

  /// Returns a shallow copy of this [DrinkReference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrinkReference copyWith({
    Object? id = _Undefined,
    _i2.DrinkType? drinkType,
    int? caloriesPerUnit,
  }) {
    return DrinkReference(
      id: id is int? ? id : this.id,
      drinkType: drinkType ?? this.drinkType,
      caloriesPerUnit: caloriesPerUnit ?? this.caloriesPerUnit,
    );
  }
}

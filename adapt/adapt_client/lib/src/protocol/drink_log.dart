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

/// A single drink logging event.
/// caloriesKcal is denormalised (quantity × reference calories) for fast history reads.
abstract class DrinkLog implements _i1.SerializableModel {
  DrinkLog._({
    this.id,
    required this.userId,
    required this.loggedAt,
    required this.drinkType,
    required this.quantity,
    required this.caloriesKcal,
  });

  factory DrinkLog({
    int? id,
    required String userId,
    required DateTime loggedAt,
    required String drinkType,
    required int quantity,
    required int caloriesKcal,
  }) = _DrinkLogImpl;

  factory DrinkLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return DrinkLog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      loggedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['loggedAt'],
      ),
      drinkType: jsonSerialization['drinkType'] as String,
      quantity: jsonSerialization['quantity'] as int,
      caloriesKcal: jsonSerialization['caloriesKcal'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  String userId;

  /// When the drinks were logged.
  DateTime loggedAt;

  /// Drink type: 'beer' | 'wine' | 'champagne' | 'cocktail' | 'whisky' | 'long_drink' | 'hard_seltzer' | 'other'
  String drinkType;

  /// Number of glasses/units logged.
  int quantity;

  /// Pre-calculated total calories: quantity × drinkReference.caloriesPerUnit.
  int caloriesKcal;

  /// Returns a shallow copy of this [DrinkLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrinkLog copyWith({
    int? id,
    String? userId,
    DateTime? loggedAt,
    String? drinkType,
    int? quantity,
    int? caloriesKcal,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DrinkLog',
      if (id != null) 'id': id,
      'userId': userId,
      'loggedAt': loggedAt.toJson(),
      'drinkType': drinkType,
      'quantity': quantity,
      'caloriesKcal': caloriesKcal,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrinkLogImpl extends DrinkLog {
  _DrinkLogImpl({
    int? id,
    required String userId,
    required DateTime loggedAt,
    required String drinkType,
    required int quantity,
    required int caloriesKcal,
  }) : super._(
         id: id,
         userId: userId,
         loggedAt: loggedAt,
         drinkType: drinkType,
         quantity: quantity,
         caloriesKcal: caloriesKcal,
       );

  /// Returns a shallow copy of this [DrinkLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrinkLog copyWith({
    Object? id = _Undefined,
    String? userId,
    DateTime? loggedAt,
    String? drinkType,
    int? quantity,
    int? caloriesKcal,
  }) {
    return DrinkLog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      loggedAt: loggedAt ?? this.loggedAt,
      drinkType: drinkType ?? this.drinkType,
      quantity: quantity ?? this.quantity,
      caloriesKcal: caloriesKcal ?? this.caloriesKcal,
    );
  }
}

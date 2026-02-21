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
import 'enums/meal_type.dart' as _i2;
import 'enums/input_method.dart' as _i3;

/// A single meal logging event.
abstract class MealLog implements _i1.SerializableModel {
  MealLog._({
    this.id,
    required this.userId,
    required this.loggedAt,
    required this.mealType,
    required this.inputMethod,
    this.rawInput,
    this.imageUrl,
    this.locationName,
    required this.estimated,
  });

  factory MealLog({
    int? id,
    required String userId,
    required DateTime loggedAt,
    required _i2.MealType mealType,
    required _i3.InputMethod inputMethod,
    String? rawInput,
    String? imageUrl,
    String? locationName,
    required bool estimated,
  }) = _MealLogImpl;

  factory MealLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return MealLog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      loggedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['loggedAt'],
      ),
      mealType: _i2.MealType.fromJson(
        (jsonSerialization['mealType'] as String),
      ),
      inputMethod: _i3.InputMethod.fromJson(
        (jsonSerialization['inputMethod'] as String),
      ),
      rawInput: jsonSerialization['rawInput'] as String?,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      locationName: jsonSerialization['locationName'] as String?,
      estimated: jsonSerialization['estimated'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  String userId;

  /// When the meal was logged.
  DateTime loggedAt;

  /// Meal type.
  _i2.MealType mealType;

  /// Input method used.
  _i3.InputMethod inputMethod;

  /// Raw text description or photo prompt.
  String? rawInput;

  /// URL to uploaded photo if inputMethod is photo.
  String? imageUrl;

  /// Restaurant or location name if inputMethod is location.
  String? locationName;

  /// True when nutrition values are AI-estimated (not confirmed by user).
  bool estimated;

  /// Returns a shallow copy of this [MealLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MealLog copyWith({
    int? id,
    String? userId,
    DateTime? loggedAt,
    _i2.MealType? mealType,
    _i3.InputMethod? inputMethod,
    String? rawInput,
    String? imageUrl,
    String? locationName,
    bool? estimated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MealLog',
      if (id != null) 'id': id,
      'userId': userId,
      'loggedAt': loggedAt.toJson(),
      'mealType': mealType.toJson(),
      'inputMethod': inputMethod.toJson(),
      if (rawInput != null) 'rawInput': rawInput,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (locationName != null) 'locationName': locationName,
      'estimated': estimated,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MealLogImpl extends MealLog {
  _MealLogImpl({
    int? id,
    required String userId,
    required DateTime loggedAt,
    required _i2.MealType mealType,
    required _i3.InputMethod inputMethod,
    String? rawInput,
    String? imageUrl,
    String? locationName,
    required bool estimated,
  }) : super._(
         id: id,
         userId: userId,
         loggedAt: loggedAt,
         mealType: mealType,
         inputMethod: inputMethod,
         rawInput: rawInput,
         imageUrl: imageUrl,
         locationName: locationName,
         estimated: estimated,
       );

  /// Returns a shallow copy of this [MealLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MealLog copyWith({
    Object? id = _Undefined,
    String? userId,
    DateTime? loggedAt,
    _i2.MealType? mealType,
    _i3.InputMethod? inputMethod,
    Object? rawInput = _Undefined,
    Object? imageUrl = _Undefined,
    Object? locationName = _Undefined,
    bool? estimated,
  }) {
    return MealLog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      loggedAt: loggedAt ?? this.loggedAt,
      mealType: mealType ?? this.mealType,
      inputMethod: inputMethod ?? this.inputMethod,
      rawInput: rawInput is String? ? rawInput : this.rawInput,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      locationName: locationName is String? ? locationName : this.locationName,
      estimated: estimated ?? this.estimated,
    );
  }
}

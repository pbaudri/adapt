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
import 'enums/biological_sex.dart' as _i2;
import 'enums/weight_unit.dart' as _i3;
import 'enums/height_unit.dart' as _i4;
import 'enums/user_goal.dart' as _i5;
import 'enums/eating_style.dart' as _i6;
import 'enums/alcohol_habit.dart' as _i7;

/// Extended profile for an Adapt user.
/// References the Serverpod auth user via userId (UUID string from IDP auth).
abstract class UserProfile implements _i1.SerializableModel {
  UserProfile._({
    this.id,
    required this.userId,
    this.name,
    required this.isGuest,
    this.age,
    this.biologicalSex,
    this.weightKg,
    this.heightCm,
    required this.weightUnit,
    required this.heightUnit,
    required this.goal,
    required this.eatingStyle,
    required this.alcoholHabit,
    required this.alcoholTracking,
    required this.morningRecap,
    required this.updatedAt,
  });

  factory UserProfile({
    int? id,
    required String userId,
    String? name,
    required bool isGuest,
    int? age,
    _i2.BiologicalSex? biologicalSex,
    double? weightKg,
    double? heightCm,
    required _i3.WeightUnit weightUnit,
    required _i4.HeightUnit heightUnit,
    required _i5.UserGoal goal,
    required _i6.EatingStyle eatingStyle,
    required _i7.AlcoholHabit alcoholHabit,
    required bool alcoholTracking,
    required bool morningRecap,
    required DateTime updatedAt,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      name: jsonSerialization['name'] as String?,
      isGuest: jsonSerialization['isGuest'] as bool,
      age: jsonSerialization['age'] as int?,
      biologicalSex: jsonSerialization['biologicalSex'] == null
          ? null
          : _i2.BiologicalSex.fromJson(
              (jsonSerialization['biologicalSex'] as String),
            ),
      weightKg: (jsonSerialization['weightKg'] as num?)?.toDouble(),
      heightCm: (jsonSerialization['heightCm'] as num?)?.toDouble(),
      weightUnit: _i3.WeightUnit.fromJson(
        (jsonSerialization['weightUnit'] as String),
      ),
      heightUnit: _i4.HeightUnit.fromJson(
        (jsonSerialization['heightUnit'] as String),
      ),
      goal: _i5.UserGoal.fromJson((jsonSerialization['goal'] as String)),
      eatingStyle: _i6.EatingStyle.fromJson(
        (jsonSerialization['eatingStyle'] as String),
      ),
      alcoholHabit: _i7.AlcoholHabit.fromJson(
        (jsonSerialization['alcoholHabit'] as String),
      ),
      alcoholTracking: jsonSerialization['alcoholTracking'] as bool,
      morningRecap: jsonSerialization['morningRecap'] as bool,
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  String userId;

  /// Display name set during onboarding.
  String? name;

  /// Whether this user is in guest mode (no account).
  bool isGuest;

  /// Age in years.
  int? age;

  /// Biological sex.
  _i2.BiologicalSex? biologicalSex;

  /// Weight stored in kg (SI). Never stores lbs.
  double? weightKg;

  /// Height stored in cm (SI). Never stores ft.
  double? heightCm;

  /// Display unit preference — display only.
  _i3.WeightUnit weightUnit;

  /// Display unit preference — display only.
  _i4.HeightUnit heightUnit;

  /// User's primary nutrition goal.
  _i5.UserGoal goal;

  /// Primary eating style.
  _i6.EatingStyle eatingStyle;

  /// Alcohol consumption frequency.
  _i7.AlcoholHabit alcoholHabit;

  /// Whether to include alcohol in daily calorie total.
  bool alcoholTracking;

  /// Whether to send morning recap notifications.
  bool morningRecap;

  /// Last updated timestamp.
  DateTime updatedAt;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserProfile copyWith({
    int? id,
    String? userId,
    String? name,
    bool? isGuest,
    int? age,
    _i2.BiologicalSex? biologicalSex,
    double? weightKg,
    double? heightCm,
    _i3.WeightUnit? weightUnit,
    _i4.HeightUnit? heightUnit,
    _i5.UserGoal? goal,
    _i6.EatingStyle? eatingStyle,
    _i7.AlcoholHabit? alcoholHabit,
    bool? alcoholTracking,
    bool? morningRecap,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userId': userId,
      if (name != null) 'name': name,
      'isGuest': isGuest,
      if (age != null) 'age': age,
      if (biologicalSex != null) 'biologicalSex': biologicalSex?.toJson(),
      if (weightKg != null) 'weightKg': weightKg,
      if (heightCm != null) 'heightCm': heightCm,
      'weightUnit': weightUnit.toJson(),
      'heightUnit': heightUnit.toJson(),
      'goal': goal.toJson(),
      'eatingStyle': eatingStyle.toJson(),
      'alcoholHabit': alcoholHabit.toJson(),
      'alcoholTracking': alcoholTracking,
      'morningRecap': morningRecap,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required String userId,
    String? name,
    required bool isGuest,
    int? age,
    _i2.BiologicalSex? biologicalSex,
    double? weightKg,
    double? heightCm,
    required _i3.WeightUnit weightUnit,
    required _i4.HeightUnit heightUnit,
    required _i5.UserGoal goal,
    required _i6.EatingStyle eatingStyle,
    required _i7.AlcoholHabit alcoholHabit,
    required bool alcoholTracking,
    required bool morningRecap,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         name: name,
         isGuest: isGuest,
         age: age,
         biologicalSex: biologicalSex,
         weightKg: weightKg,
         heightCm: heightCm,
         weightUnit: weightUnit,
         heightUnit: heightUnit,
         goal: goal,
         eatingStyle: eatingStyle,
         alcoholHabit: alcoholHabit,
         alcoholTracking: alcoholTracking,
         morningRecap: morningRecap,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    String? userId,
    Object? name = _Undefined,
    bool? isGuest,
    Object? age = _Undefined,
    Object? biologicalSex = _Undefined,
    Object? weightKg = _Undefined,
    Object? heightCm = _Undefined,
    _i3.WeightUnit? weightUnit,
    _i4.HeightUnit? heightUnit,
    _i5.UserGoal? goal,
    _i6.EatingStyle? eatingStyle,
    _i7.AlcoholHabit? alcoholHabit,
    bool? alcoholTracking,
    bool? morningRecap,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name is String? ? name : this.name,
      isGuest: isGuest ?? this.isGuest,
      age: age is int? ? age : this.age,
      biologicalSex: biologicalSex is _i2.BiologicalSex?
          ? biologicalSex
          : this.biologicalSex,
      weightKg: weightKg is double? ? weightKg : this.weightKg,
      heightCm: heightCm is double? ? heightCm : this.heightCm,
      weightUnit: weightUnit ?? this.weightUnit,
      heightUnit: heightUnit ?? this.heightUnit,
      goal: goal ?? this.goal,
      eatingStyle: eatingStyle ?? this.eatingStyle,
      alcoholHabit: alcoholHabit ?? this.alcoholHabit,
      alcoholTracking: alcoholTracking ?? this.alcoholTracking,
      morningRecap: morningRecap ?? this.morningRecap,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

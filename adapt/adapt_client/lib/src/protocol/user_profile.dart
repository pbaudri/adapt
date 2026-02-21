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

/// Extended profile for an Adapt user.
/// References the Serverpod auth user via userId.
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
    String? biologicalSex,
    double? weightKg,
    double? heightCm,
    required String weightUnit,
    required String heightUnit,
    required String goal,
    required String eatingStyle,
    required String alcoholHabit,
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
      biologicalSex: jsonSerialization['biologicalSex'] as String?,
      weightKg: (jsonSerialization['weightKg'] as num?)?.toDouble(),
      heightCm: (jsonSerialization['heightCm'] as num?)?.toDouble(),
      weightUnit: jsonSerialization['weightUnit'] as String,
      heightUnit: jsonSerialization['heightUnit'] as String,
      goal: jsonSerialization['goal'] as String,
      eatingStyle: jsonSerialization['eatingStyle'] as String,
      alcoholHabit: jsonSerialization['alcoholHabit'] as String,
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

  /// Biological sex: 'male' | 'female'
  String? biologicalSex;

  /// Weight stored in kg (SI). Never stores lbs.
  double? weightKg;

  /// Height stored in cm (SI). Never stores ft.
  double? heightCm;

  /// Display unit preference: 'kg' | 'lbs' — display only.
  String weightUnit;

  /// Display unit preference: 'cm' | 'ft' — display only.
  String heightUnit;

  /// Goal: 'lose_weight' | 'eat_better' | 'stay_aware'
  String goal;

  /// Eating style: 'home_cooked' | 'takeaway' | 'restaurants' | 'mixed'
  String eatingStyle;

  /// Alcohol habit: 'rarely' | 'sometimes' | 'often'
  String alcoholHabit;

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
    String? biologicalSex,
    double? weightKg,
    double? heightCm,
    String? weightUnit,
    String? heightUnit,
    String? goal,
    String? eatingStyle,
    String? alcoholHabit,
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
      if (biologicalSex != null) 'biologicalSex': biologicalSex,
      if (weightKg != null) 'weightKg': weightKg,
      if (heightCm != null) 'heightCm': heightCm,
      'weightUnit': weightUnit,
      'heightUnit': heightUnit,
      'goal': goal,
      'eatingStyle': eatingStyle,
      'alcoholHabit': alcoholHabit,
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
    String? biologicalSex,
    double? weightKg,
    double? heightCm,
    required String weightUnit,
    required String heightUnit,
    required String goal,
    required String eatingStyle,
    required String alcoholHabit,
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
    String? weightUnit,
    String? heightUnit,
    String? goal,
    String? eatingStyle,
    String? alcoholHabit,
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
      biologicalSex: biologicalSex is String?
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

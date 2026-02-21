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

/// AI-generated morning recap shown to the user each morning.
abstract class MorningRecap implements _i1.SerializableModel {
  MorningRecap._({
    this.id,
    required this.userId,
    required this.date,
    required this.headline,
    required this.subMessage,
    required this.tips,
    this.seenAt,
  });

  factory MorningRecap({
    int? id,
    required String userId,
    required DateTime date,
    required String headline,
    required String subMessage,
    required String tips,
    DateTime? seenAt,
  }) = _MorningRecapImpl;

  factory MorningRecap.fromJson(Map<String, dynamic> jsonSerialization) {
    return MorningRecap(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      headline: jsonSerialization['headline'] as String,
      subMessage: jsonSerialization['subMessage'] as String,
      tips: jsonSerialization['tips'] as String,
      seenAt: jsonSerialization['seenAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['seenAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  String userId;

  /// Date this recap covers (midnight UTC).
  DateTime date;

  /// Personalised headline, e.g. "Morning, Pierre."
  String headline;

  /// Supporting message shown below the headline.
  String subMessage;

  /// JSON-encoded list of tip objects: [{icon, title, subtitle}].
  String tips;

  /// Timestamp when the user opened the recap. Null until viewed.
  DateTime? seenAt;

  /// Returns a shallow copy of this [MorningRecap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MorningRecap copyWith({
    int? id,
    String? userId,
    DateTime? date,
    String? headline,
    String? subMessage,
    String? tips,
    DateTime? seenAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MorningRecap',
      if (id != null) 'id': id,
      'userId': userId,
      'date': date.toJson(),
      'headline': headline,
      'subMessage': subMessage,
      'tips': tips,
      if (seenAt != null) 'seenAt': seenAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MorningRecapImpl extends MorningRecap {
  _MorningRecapImpl({
    int? id,
    required String userId,
    required DateTime date,
    required String headline,
    required String subMessage,
    required String tips,
    DateTime? seenAt,
  }) : super._(
         id: id,
         userId: userId,
         date: date,
         headline: headline,
         subMessage: subMessage,
         tips: tips,
         seenAt: seenAt,
       );

  /// Returns a shallow copy of this [MorningRecap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MorningRecap copyWith({
    Object? id = _Undefined,
    String? userId,
    DateTime? date,
    String? headline,
    String? subMessage,
    String? tips,
    Object? seenAt = _Undefined,
  }) {
    return MorningRecap(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      headline: headline ?? this.headline,
      subMessage: subMessage ?? this.subMessage,
      tips: tips ?? this.tips,
      seenAt: seenAt is DateTime? ? seenAt : this.seenAt,
    );
  }
}

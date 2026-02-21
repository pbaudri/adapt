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

/// Aggregated daily nutrition summary for a user.
/// Updated after every meal log or drink log.
abstract class DailySummary implements _i1.SerializableModel {
  DailySummary._({
    this.id,
    required this.userId,
    required this.date,
    required this.totalKcal,
    required this.totalProteinG,
    required this.totalCarbsG,
    required this.totalFatG,
    required this.hadAlcohol,
    required this.mealEmojis,
    required this.morningRecapSent,
  });

  factory DailySummary({
    int? id,
    required String userId,
    required DateTime date,
    required int totalKcal,
    required double totalProteinG,
    required double totalCarbsG,
    required double totalFatG,
    required bool hadAlcohol,
    required String mealEmojis,
    required bool morningRecapSent,
  }) = _DailySummaryImpl;

  factory DailySummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailySummary(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      totalKcal: jsonSerialization['totalKcal'] as int,
      totalProteinG: (jsonSerialization['totalProteinG'] as num).toDouble(),
      totalCarbsG: (jsonSerialization['totalCarbsG'] as num).toDouble(),
      totalFatG: (jsonSerialization['totalFatG'] as num).toDouble(),
      hadAlcohol: jsonSerialization['hadAlcohol'] as bool,
      mealEmojis: jsonSerialization['mealEmojis'] as String,
      morningRecapSent: jsonSerialization['morningRecapSent'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  String userId;

  /// Date of the summary (time component is always midnight UTC).
  DateTime date;

  /// Total calories consumed that day.
  int totalKcal;

  /// Total protein in grams.
  double totalProteinG;

  /// Total carbohydrates in grams.
  double totalCarbsG;

  /// Total fat in grams.
  double totalFatG;

  /// True if any alcohol was logged that day.
  bool hadAlcohol;

  /// JSON array of meal emoji identifiers, e.g. '["pizza","salad"]'.
  String mealEmojis;

  /// True once a morning recap has been generated and sent for this day.
  bool morningRecapSent;

  /// Returns a shallow copy of this [DailySummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailySummary copyWith({
    int? id,
    String? userId,
    DateTime? date,
    int? totalKcal,
    double? totalProteinG,
    double? totalCarbsG,
    double? totalFatG,
    bool? hadAlcohol,
    String? mealEmojis,
    bool? morningRecapSent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailySummary',
      if (id != null) 'id': id,
      'userId': userId,
      'date': date.toJson(),
      'totalKcal': totalKcal,
      'totalProteinG': totalProteinG,
      'totalCarbsG': totalCarbsG,
      'totalFatG': totalFatG,
      'hadAlcohol': hadAlcohol,
      'mealEmojis': mealEmojis,
      'morningRecapSent': morningRecapSent,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DailySummaryImpl extends DailySummary {
  _DailySummaryImpl({
    int? id,
    required String userId,
    required DateTime date,
    required int totalKcal,
    required double totalProteinG,
    required double totalCarbsG,
    required double totalFatG,
    required bool hadAlcohol,
    required String mealEmojis,
    required bool morningRecapSent,
  }) : super._(
         id: id,
         userId: userId,
         date: date,
         totalKcal: totalKcal,
         totalProteinG: totalProteinG,
         totalCarbsG: totalCarbsG,
         totalFatG: totalFatG,
         hadAlcohol: hadAlcohol,
         mealEmojis: mealEmojis,
         morningRecapSent: morningRecapSent,
       );

  /// Returns a shallow copy of this [DailySummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailySummary copyWith({
    Object? id = _Undefined,
    String? userId,
    DateTime? date,
    int? totalKcal,
    double? totalProteinG,
    double? totalCarbsG,
    double? totalFatG,
    bool? hadAlcohol,
    String? mealEmojis,
    bool? morningRecapSent,
  }) {
    return DailySummary(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      totalKcal: totalKcal ?? this.totalKcal,
      totalProteinG: totalProteinG ?? this.totalProteinG,
      totalCarbsG: totalCarbsG ?? this.totalCarbsG,
      totalFatG: totalFatG ?? this.totalFatG,
      hadAlcohol: hadAlcohol ?? this.hadAlcohol,
      mealEmojis: mealEmojis ?? this.mealEmojis,
      morningRecapSent: morningRecapSent ?? this.morningRecapSent,
    );
  }
}

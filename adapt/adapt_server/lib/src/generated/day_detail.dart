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
import 'daily_summary.dart' as _i2;
import 'meal_log.dart' as _i3;
import 'drink_log.dart' as _i4;
import 'package:adapt_server/src/generated/protocol.dart' as _i5;

/// Detailed breakdown for a single day in the history screen.
/// Combines the daily summary with its constituent meal and drink logs.
abstract class DayDetail
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DayDetail._({
    required this.summary,
    required this.meals,
    required this.drinks,
  });

  factory DayDetail({
    required _i2.DailySummary summary,
    required List<_i3.MealLog> meals,
    required List<_i4.DrinkLog> drinks,
  }) = _DayDetailImpl;

  factory DayDetail.fromJson(Map<String, dynamic> jsonSerialization) {
    return DayDetail(
      summary: _i5.Protocol().deserialize<_i2.DailySummary>(
        jsonSerialization['summary'],
      ),
      meals: _i5.Protocol().deserialize<List<_i3.MealLog>>(
        jsonSerialization['meals'],
      ),
      drinks: _i5.Protocol().deserialize<List<_i4.DrinkLog>>(
        jsonSerialization['drinks'],
      ),
    );
  }

  /// The aggregated daily summary for this day.
  _i2.DailySummary summary;

  /// All meal logs for this day.
  List<_i3.MealLog> meals;

  /// All drink logs for this day.
  List<_i4.DrinkLog> drinks;

  /// Returns a shallow copy of this [DayDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DayDetail copyWith({
    _i2.DailySummary? summary,
    List<_i3.MealLog>? meals,
    List<_i4.DrinkLog>? drinks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DayDetail',
      'summary': summary.toJson(),
      'meals': meals.toJson(valueToJson: (v) => v.toJson()),
      'drinks': drinks.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DayDetail',
      'summary': summary.toJsonForProtocol(),
      'meals': meals.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'drinks': drinks.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DayDetailImpl extends DayDetail {
  _DayDetailImpl({
    required _i2.DailySummary summary,
    required List<_i3.MealLog> meals,
    required List<_i4.DrinkLog> drinks,
  }) : super._(
         summary: summary,
         meals: meals,
         drinks: drinks,
       );

  /// Returns a shallow copy of this [DayDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DayDetail copyWith({
    _i2.DailySummary? summary,
    List<_i3.MealLog>? meals,
    List<_i4.DrinkLog>? drinks,
  }) {
    return DayDetail(
      summary: summary ?? this.summary.copyWith(),
      meals: meals ?? this.meals.map((e0) => e0.copyWith()).toList(),
      drinks: drinks ?? this.drinks.map((e0) => e0.copyWith()).toList(),
    );
  }
}

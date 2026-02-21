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
import 'auth_token.dart' as _i2;
import 'daily_summary.dart' as _i3;
import 'day_detail.dart' as _i4;
import 'drink_log.dart' as _i5;
import 'drink_reference.dart' as _i6;
import 'greetings/greeting.dart' as _i7;
import 'home_data.dart' as _i8;
import 'meal_correction_input.dart' as _i9;
import 'meal_log.dart' as _i10;
import 'meal_result.dart' as _i11;
import 'morning_recap.dart' as _i12;
import 'user_profile.dart' as _i13;
import 'package:adapt_client/src/protocol/drink_reference.dart' as _i14;
import 'package:adapt_client/src/protocol/drink_log.dart' as _i15;
import 'package:adapt_client/src/protocol/daily_summary.dart' as _i16;
import 'package:adapt_client/src/protocol/meal_log.dart' as _i17;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i18;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i19;
export 'auth_token.dart';
export 'daily_summary.dart';
export 'day_detail.dart';
export 'drink_log.dart';
export 'drink_reference.dart';
export 'greetings/greeting.dart';
export 'home_data.dart';
export 'meal_correction_input.dart';
export 'meal_log.dart';
export 'meal_result.dart';
export 'morning_recap.dart';
export 'user_profile.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AuthToken) {
      return _i2.AuthToken.fromJson(data) as T;
    }
    if (t == _i3.DailySummary) {
      return _i3.DailySummary.fromJson(data) as T;
    }
    if (t == _i4.DayDetail) {
      return _i4.DayDetail.fromJson(data) as T;
    }
    if (t == _i5.DrinkLog) {
      return _i5.DrinkLog.fromJson(data) as T;
    }
    if (t == _i6.DrinkReference) {
      return _i6.DrinkReference.fromJson(data) as T;
    }
    if (t == _i7.Greeting) {
      return _i7.Greeting.fromJson(data) as T;
    }
    if (t == _i8.HomeData) {
      return _i8.HomeData.fromJson(data) as T;
    }
    if (t == _i9.MealCorrectionInput) {
      return _i9.MealCorrectionInput.fromJson(data) as T;
    }
    if (t == _i10.MealLog) {
      return _i10.MealLog.fromJson(data) as T;
    }
    if (t == _i11.MealResult) {
      return _i11.MealResult.fromJson(data) as T;
    }
    if (t == _i12.MorningRecap) {
      return _i12.MorningRecap.fromJson(data) as T;
    }
    if (t == _i13.UserProfile) {
      return _i13.UserProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AuthToken?>()) {
      return (data != null ? _i2.AuthToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DailySummary?>()) {
      return (data != null ? _i3.DailySummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DayDetail?>()) {
      return (data != null ? _i4.DayDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DrinkLog?>()) {
      return (data != null ? _i5.DrinkLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DrinkReference?>()) {
      return (data != null ? _i6.DrinkReference.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Greeting?>()) {
      return (data != null ? _i7.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.HomeData?>()) {
      return (data != null ? _i8.HomeData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.MealCorrectionInput?>()) {
      return (data != null ? _i9.MealCorrectionInput.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.MealLog?>()) {
      return (data != null ? _i10.MealLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.MealResult?>()) {
      return (data != null ? _i11.MealResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.MorningRecap?>()) {
      return (data != null ? _i12.MorningRecap.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.UserProfile?>()) {
      return (data != null ? _i13.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<_i10.MealLog>) {
      return (data as List).map((e) => deserialize<_i10.MealLog>(e)).toList()
          as T;
    }
    if (t == List<_i5.DrinkLog>) {
      return (data as List).map((e) => deserialize<_i5.DrinkLog>(e)).toList()
          as T;
    }
    if (t == List<_i14.DrinkReference>) {
      return (data as List)
              .map((e) => deserialize<_i14.DrinkReference>(e))
              .toList()
          as T;
    }
    if (t == List<_i15.DrinkLog>) {
      return (data as List).map((e) => deserialize<_i15.DrinkLog>(e)).toList()
          as T;
    }
    if (t == List<_i16.DailySummary>) {
      return (data as List)
              .map((e) => deserialize<_i16.DailySummary>(e))
              .toList()
          as T;
    }
    if (t == List<_i17.MealLog>) {
      return (data as List).map((e) => deserialize<_i17.MealLog>(e)).toList()
          as T;
    }
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i19.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AuthToken => 'AuthToken',
      _i3.DailySummary => 'DailySummary',
      _i4.DayDetail => 'DayDetail',
      _i5.DrinkLog => 'DrinkLog',
      _i6.DrinkReference => 'DrinkReference',
      _i7.Greeting => 'Greeting',
      _i8.HomeData => 'HomeData',
      _i9.MealCorrectionInput => 'MealCorrectionInput',
      _i10.MealLog => 'MealLog',
      _i11.MealResult => 'MealResult',
      _i12.MorningRecap => 'MorningRecap',
      _i13.UserProfile => 'UserProfile',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('adapt.', '');
    }

    switch (data) {
      case _i2.AuthToken():
        return 'AuthToken';
      case _i3.DailySummary():
        return 'DailySummary';
      case _i4.DayDetail():
        return 'DayDetail';
      case _i5.DrinkLog():
        return 'DrinkLog';
      case _i6.DrinkReference():
        return 'DrinkReference';
      case _i7.Greeting():
        return 'Greeting';
      case _i8.HomeData():
        return 'HomeData';
      case _i9.MealCorrectionInput():
        return 'MealCorrectionInput';
      case _i10.MealLog():
        return 'MealLog';
      case _i11.MealResult():
        return 'MealResult';
      case _i12.MorningRecap():
        return 'MorningRecap';
      case _i13.UserProfile():
        return 'UserProfile';
    }
    className = _i18.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i19.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AuthToken') {
      return deserialize<_i2.AuthToken>(data['data']);
    }
    if (dataClassName == 'DailySummary') {
      return deserialize<_i3.DailySummary>(data['data']);
    }
    if (dataClassName == 'DayDetail') {
      return deserialize<_i4.DayDetail>(data['data']);
    }
    if (dataClassName == 'DrinkLog') {
      return deserialize<_i5.DrinkLog>(data['data']);
    }
    if (dataClassName == 'DrinkReference') {
      return deserialize<_i6.DrinkReference>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i7.Greeting>(data['data']);
    }
    if (dataClassName == 'HomeData') {
      return deserialize<_i8.HomeData>(data['data']);
    }
    if (dataClassName == 'MealCorrectionInput') {
      return deserialize<_i9.MealCorrectionInput>(data['data']);
    }
    if (dataClassName == 'MealLog') {
      return deserialize<_i10.MealLog>(data['data']);
    }
    if (dataClassName == 'MealResult') {
      return deserialize<_i11.MealResult>(data['data']);
    }
    if (dataClassName == 'MorningRecap') {
      return deserialize<_i12.MorningRecap>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i13.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i18.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i19.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i18.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i19.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

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
import 'enums/alcohol_habit.dart' as _i7;
import 'enums/biological_sex.dart' as _i8;
import 'enums/drink_type.dart' as _i9;
import 'enums/eating_style.dart' as _i10;
import 'enums/height_unit.dart' as _i11;
import 'enums/input_method.dart' as _i12;
import 'enums/meal_source.dart' as _i13;
import 'enums/meal_type.dart' as _i14;
import 'enums/user_goal.dart' as _i15;
import 'enums/weight_unit.dart' as _i16;
import 'greetings/greeting.dart' as _i17;
import 'home_data.dart' as _i18;
import 'meal_correction_input.dart' as _i19;
import 'meal_log.dart' as _i20;
import 'meal_result.dart' as _i21;
import 'morning_recap.dart' as _i22;
import 'user_profile.dart' as _i23;
import 'package:adapt_client/src/protocol/drink_reference.dart' as _i24;
import 'package:adapt_client/src/protocol/drink_log.dart' as _i25;
import 'package:adapt_client/src/protocol/daily_summary.dart' as _i26;
import 'package:adapt_client/src/protocol/meal_log.dart' as _i27;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i28;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i29;
export 'auth_token.dart';
export 'daily_summary.dart';
export 'day_detail.dart';
export 'drink_log.dart';
export 'drink_reference.dart';
export 'enums/alcohol_habit.dart';
export 'enums/biological_sex.dart';
export 'enums/drink_type.dart';
export 'enums/eating_style.dart';
export 'enums/height_unit.dart';
export 'enums/input_method.dart';
export 'enums/meal_source.dart';
export 'enums/meal_type.dart';
export 'enums/user_goal.dart';
export 'enums/weight_unit.dart';
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
    if (t == _i7.AlcoholHabit) {
      return _i7.AlcoholHabit.fromJson(data) as T;
    }
    if (t == _i8.BiologicalSex) {
      return _i8.BiologicalSex.fromJson(data) as T;
    }
    if (t == _i9.DrinkType) {
      return _i9.DrinkType.fromJson(data) as T;
    }
    if (t == _i10.EatingStyle) {
      return _i10.EatingStyle.fromJson(data) as T;
    }
    if (t == _i11.HeightUnit) {
      return _i11.HeightUnit.fromJson(data) as T;
    }
    if (t == _i12.InputMethod) {
      return _i12.InputMethod.fromJson(data) as T;
    }
    if (t == _i13.MealSource) {
      return _i13.MealSource.fromJson(data) as T;
    }
    if (t == _i14.MealType) {
      return _i14.MealType.fromJson(data) as T;
    }
    if (t == _i15.UserGoal) {
      return _i15.UserGoal.fromJson(data) as T;
    }
    if (t == _i16.WeightUnit) {
      return _i16.WeightUnit.fromJson(data) as T;
    }
    if (t == _i17.Greeting) {
      return _i17.Greeting.fromJson(data) as T;
    }
    if (t == _i18.HomeData) {
      return _i18.HomeData.fromJson(data) as T;
    }
    if (t == _i19.MealCorrectionInput) {
      return _i19.MealCorrectionInput.fromJson(data) as T;
    }
    if (t == _i20.MealLog) {
      return _i20.MealLog.fromJson(data) as T;
    }
    if (t == _i21.MealResult) {
      return _i21.MealResult.fromJson(data) as T;
    }
    if (t == _i22.MorningRecap) {
      return _i22.MorningRecap.fromJson(data) as T;
    }
    if (t == _i23.UserProfile) {
      return _i23.UserProfile.fromJson(data) as T;
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
    if (t == _i1.getType<_i7.AlcoholHabit?>()) {
      return (data != null ? _i7.AlcoholHabit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.BiologicalSex?>()) {
      return (data != null ? _i8.BiologicalSex.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DrinkType?>()) {
      return (data != null ? _i9.DrinkType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.EatingStyle?>()) {
      return (data != null ? _i10.EatingStyle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.HeightUnit?>()) {
      return (data != null ? _i11.HeightUnit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.InputMethod?>()) {
      return (data != null ? _i12.InputMethod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.MealSource?>()) {
      return (data != null ? _i13.MealSource.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.MealType?>()) {
      return (data != null ? _i14.MealType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UserGoal?>()) {
      return (data != null ? _i15.UserGoal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.WeightUnit?>()) {
      return (data != null ? _i16.WeightUnit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Greeting?>()) {
      return (data != null ? _i17.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.HomeData?>()) {
      return (data != null ? _i18.HomeData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.MealCorrectionInput?>()) {
      return (data != null ? _i19.MealCorrectionInput.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.MealLog?>()) {
      return (data != null ? _i20.MealLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.MealResult?>()) {
      return (data != null ? _i21.MealResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.MorningRecap?>()) {
      return (data != null ? _i22.MorningRecap.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.UserProfile?>()) {
      return (data != null ? _i23.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<_i20.MealLog>) {
      return (data as List).map((e) => deserialize<_i20.MealLog>(e)).toList()
          as T;
    }
    if (t == List<_i21.MealResult>) {
      return (data as List).map((e) => deserialize<_i21.MealResult>(e)).toList()
          as T;
    }
    if (t == List<_i5.DrinkLog>) {
      return (data as List).map((e) => deserialize<_i5.DrinkLog>(e)).toList()
          as T;
    }
    if (t == List<_i24.DrinkReference>) {
      return (data as List)
              .map((e) => deserialize<_i24.DrinkReference>(e))
              .toList()
          as T;
    }
    if (t == List<_i25.DrinkLog>) {
      return (data as List).map((e) => deserialize<_i25.DrinkLog>(e)).toList()
          as T;
    }
    if (t == List<_i26.DailySummary>) {
      return (data as List)
              .map((e) => deserialize<_i26.DailySummary>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.MealLog>) {
      return (data as List).map((e) => deserialize<_i27.MealLog>(e)).toList()
          as T;
    }
    try {
      return _i28.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i29.Protocol().deserialize<T>(data, t);
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
      _i7.AlcoholHabit => 'AlcoholHabit',
      _i8.BiologicalSex => 'BiologicalSex',
      _i9.DrinkType => 'DrinkType',
      _i10.EatingStyle => 'EatingStyle',
      _i11.HeightUnit => 'HeightUnit',
      _i12.InputMethod => 'InputMethod',
      _i13.MealSource => 'MealSource',
      _i14.MealType => 'MealType',
      _i15.UserGoal => 'UserGoal',
      _i16.WeightUnit => 'WeightUnit',
      _i17.Greeting => 'Greeting',
      _i18.HomeData => 'HomeData',
      _i19.MealCorrectionInput => 'MealCorrectionInput',
      _i20.MealLog => 'MealLog',
      _i21.MealResult => 'MealResult',
      _i22.MorningRecap => 'MorningRecap',
      _i23.UserProfile => 'UserProfile',
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
      case _i7.AlcoholHabit():
        return 'AlcoholHabit';
      case _i8.BiologicalSex():
        return 'BiologicalSex';
      case _i9.DrinkType():
        return 'DrinkType';
      case _i10.EatingStyle():
        return 'EatingStyle';
      case _i11.HeightUnit():
        return 'HeightUnit';
      case _i12.InputMethod():
        return 'InputMethod';
      case _i13.MealSource():
        return 'MealSource';
      case _i14.MealType():
        return 'MealType';
      case _i15.UserGoal():
        return 'UserGoal';
      case _i16.WeightUnit():
        return 'WeightUnit';
      case _i17.Greeting():
        return 'Greeting';
      case _i18.HomeData():
        return 'HomeData';
      case _i19.MealCorrectionInput():
        return 'MealCorrectionInput';
      case _i20.MealLog():
        return 'MealLog';
      case _i21.MealResult():
        return 'MealResult';
      case _i22.MorningRecap():
        return 'MorningRecap';
      case _i23.UserProfile():
        return 'UserProfile';
    }
    className = _i28.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i29.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'AlcoholHabit') {
      return deserialize<_i7.AlcoholHabit>(data['data']);
    }
    if (dataClassName == 'BiologicalSex') {
      return deserialize<_i8.BiologicalSex>(data['data']);
    }
    if (dataClassName == 'DrinkType') {
      return deserialize<_i9.DrinkType>(data['data']);
    }
    if (dataClassName == 'EatingStyle') {
      return deserialize<_i10.EatingStyle>(data['data']);
    }
    if (dataClassName == 'HeightUnit') {
      return deserialize<_i11.HeightUnit>(data['data']);
    }
    if (dataClassName == 'InputMethod') {
      return deserialize<_i12.InputMethod>(data['data']);
    }
    if (dataClassName == 'MealSource') {
      return deserialize<_i13.MealSource>(data['data']);
    }
    if (dataClassName == 'MealType') {
      return deserialize<_i14.MealType>(data['data']);
    }
    if (dataClassName == 'UserGoal') {
      return deserialize<_i15.UserGoal>(data['data']);
    }
    if (dataClassName == 'WeightUnit') {
      return deserialize<_i16.WeightUnit>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i17.Greeting>(data['data']);
    }
    if (dataClassName == 'HomeData') {
      return deserialize<_i18.HomeData>(data['data']);
    }
    if (dataClassName == 'MealCorrectionInput') {
      return deserialize<_i19.MealCorrectionInput>(data['data']);
    }
    if (dataClassName == 'MealLog') {
      return deserialize<_i20.MealLog>(data['data']);
    }
    if (dataClassName == 'MealResult') {
      return deserialize<_i21.MealResult>(data['data']);
    }
    if (dataClassName == 'MorningRecap') {
      return deserialize<_i22.MorningRecap>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i23.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i28.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i29.Protocol().deserializeByClassName(data);
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
      return _i28.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i29.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

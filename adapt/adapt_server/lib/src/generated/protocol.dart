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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'auth_token.dart' as _i5;
import 'daily_summary.dart' as _i6;
import 'day_detail.dart' as _i7;
import 'drink_log.dart' as _i8;
import 'drink_reference.dart' as _i9;
import 'enums/alcohol_habit.dart' as _i10;
import 'enums/biological_sex.dart' as _i11;
import 'enums/drink_type.dart' as _i12;
import 'enums/eating_style.dart' as _i13;
import 'enums/height_unit.dart' as _i14;
import 'enums/input_method.dart' as _i15;
import 'enums/meal_source.dart' as _i16;
import 'enums/meal_type.dart' as _i17;
import 'enums/user_goal.dart' as _i18;
import 'enums/weight_unit.dart' as _i19;
import 'greetings/greeting.dart' as _i20;
import 'home_data.dart' as _i21;
import 'meal_correction_input.dart' as _i22;
import 'meal_log.dart' as _i23;
import 'meal_result.dart' as _i24;
import 'morning_recap.dart' as _i25;
import 'user_profile.dart' as _i26;
import 'package:adapt_server/src/generated/drink_reference.dart' as _i27;
import 'package:adapt_server/src/generated/drink_log.dart' as _i28;
import 'package:adapt_server/src/generated/daily_summary.dart' as _i29;
import 'package:adapt_server/src/generated/meal_log.dart' as _i30;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'daily_summaries',
      dartName: 'DailySummary',
      schema: 'public',
      module: 'adapt',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'daily_summaries_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'totalKcal',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'totalProteinG',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'totalCarbsG',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'totalFatG',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'hadAlcohol',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'mealEmojis',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'morningRecapSent',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'daily_summaries_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'daily_summaries_user_date_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'drink_logs',
      dartName: 'DrinkLog',
      schema: 'public',
      module: 'adapt',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'drink_logs_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'loggedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'drinkType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DrinkType',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'caloriesKcal',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'drink_logs_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'drink_logs_user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'drink_logs_logged_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'loggedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'drink_reference',
      dartName: 'DrinkReference',
      schema: 'public',
      module: 'adapt',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'drink_reference_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'drinkType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DrinkType',
        ),
        _i2.ColumnDefinition(
          name: 'caloriesPerUnit',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'servingDescription',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'drink_reference_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'drink_reference_drink_type_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'drinkType',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'meal_logs',
      dartName: 'MealLog',
      schema: 'public',
      module: 'adapt',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'meal_logs_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'loggedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'mealType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MealType',
        ),
        _i2.ColumnDefinition(
          name: 'inputMethod',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:InputMethod',
        ),
        _i2.ColumnDefinition(
          name: 'rawInput',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'locationName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'estimated',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'meal_logs_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'meal_logs_user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'meal_logs_logged_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'loggedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'meal_results',
      dartName: 'MealResult',
      schema: 'public',
      module: 'adapt',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'meal_results_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'mealLogId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'caloriesKcal',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'proteinG',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'carbsG',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'fatG',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'aiMessage',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'aiTip',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'source',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MealSource',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'meal_results_fk_0',
          columns: ['mealLogId'],
          referenceTable: 'meal_logs',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'meal_results_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'meal_results_meal_log_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'mealLogId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'morning_recaps',
      dartName: 'MorningRecap',
      schema: 'public',
      module: 'adapt',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'morning_recaps_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'headline',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'subMessage',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tips',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'seenAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'morning_recaps_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'morning_recaps_user_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_profiles',
      dartName: 'UserProfile',
      schema: 'public',
      module: 'adapt',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_profiles_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isGuest',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'age',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'biologicalSex',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:BiologicalSex?',
        ),
        _i2.ColumnDefinition(
          name: 'weightKg',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'heightCm',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'weightUnit',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:WeightUnit',
        ),
        _i2.ColumnDefinition(
          name: 'heightUnit',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:HeightUnit',
        ),
        _i2.ColumnDefinition(
          name: 'goal',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UserGoal',
        ),
        _i2.ColumnDefinition(
          name: 'eatingStyle',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:EatingStyle',
        ),
        _i2.ColumnDefinition(
          name: 'alcoholHabit',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AlcoholHabit',
        ),
        _i2.ColumnDefinition(
          name: 'alcoholTracking',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'morningRecap',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_profiles_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_profiles_user_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

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

    if (t == _i5.AuthToken) {
      return _i5.AuthToken.fromJson(data) as T;
    }
    if (t == _i6.DailySummary) {
      return _i6.DailySummary.fromJson(data) as T;
    }
    if (t == _i7.DayDetail) {
      return _i7.DayDetail.fromJson(data) as T;
    }
    if (t == _i8.DrinkLog) {
      return _i8.DrinkLog.fromJson(data) as T;
    }
    if (t == _i9.DrinkReference) {
      return _i9.DrinkReference.fromJson(data) as T;
    }
    if (t == _i10.AlcoholHabit) {
      return _i10.AlcoholHabit.fromJson(data) as T;
    }
    if (t == _i11.BiologicalSex) {
      return _i11.BiologicalSex.fromJson(data) as T;
    }
    if (t == _i12.DrinkType) {
      return _i12.DrinkType.fromJson(data) as T;
    }
    if (t == _i13.EatingStyle) {
      return _i13.EatingStyle.fromJson(data) as T;
    }
    if (t == _i14.HeightUnit) {
      return _i14.HeightUnit.fromJson(data) as T;
    }
    if (t == _i15.InputMethod) {
      return _i15.InputMethod.fromJson(data) as T;
    }
    if (t == _i16.MealSource) {
      return _i16.MealSource.fromJson(data) as T;
    }
    if (t == _i17.MealType) {
      return _i17.MealType.fromJson(data) as T;
    }
    if (t == _i18.UserGoal) {
      return _i18.UserGoal.fromJson(data) as T;
    }
    if (t == _i19.WeightUnit) {
      return _i19.WeightUnit.fromJson(data) as T;
    }
    if (t == _i20.Greeting) {
      return _i20.Greeting.fromJson(data) as T;
    }
    if (t == _i21.HomeData) {
      return _i21.HomeData.fromJson(data) as T;
    }
    if (t == _i22.MealCorrectionInput) {
      return _i22.MealCorrectionInput.fromJson(data) as T;
    }
    if (t == _i23.MealLog) {
      return _i23.MealLog.fromJson(data) as T;
    }
    if (t == _i24.MealResult) {
      return _i24.MealResult.fromJson(data) as T;
    }
    if (t == _i25.MorningRecap) {
      return _i25.MorningRecap.fromJson(data) as T;
    }
    if (t == _i26.UserProfile) {
      return _i26.UserProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.AuthToken?>()) {
      return (data != null ? _i5.AuthToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DailySummary?>()) {
      return (data != null ? _i6.DailySummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DayDetail?>()) {
      return (data != null ? _i7.DayDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DrinkLog?>()) {
      return (data != null ? _i8.DrinkLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DrinkReference?>()) {
      return (data != null ? _i9.DrinkReference.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.AlcoholHabit?>()) {
      return (data != null ? _i10.AlcoholHabit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.BiologicalSex?>()) {
      return (data != null ? _i11.BiologicalSex.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.DrinkType?>()) {
      return (data != null ? _i12.DrinkType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.EatingStyle?>()) {
      return (data != null ? _i13.EatingStyle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.HeightUnit?>()) {
      return (data != null ? _i14.HeightUnit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.InputMethod?>()) {
      return (data != null ? _i15.InputMethod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.MealSource?>()) {
      return (data != null ? _i16.MealSource.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.MealType?>()) {
      return (data != null ? _i17.MealType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.UserGoal?>()) {
      return (data != null ? _i18.UserGoal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.WeightUnit?>()) {
      return (data != null ? _i19.WeightUnit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Greeting?>()) {
      return (data != null ? _i20.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.HomeData?>()) {
      return (data != null ? _i21.HomeData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.MealCorrectionInput?>()) {
      return (data != null ? _i22.MealCorrectionInput.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.MealLog?>()) {
      return (data != null ? _i23.MealLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.MealResult?>()) {
      return (data != null ? _i24.MealResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.MorningRecap?>()) {
      return (data != null ? _i25.MorningRecap.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.UserProfile?>()) {
      return (data != null ? _i26.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<_i23.MealLog>) {
      return (data as List).map((e) => deserialize<_i23.MealLog>(e)).toList()
          as T;
    }
    if (t == List<_i24.MealResult>) {
      return (data as List).map((e) => deserialize<_i24.MealResult>(e)).toList()
          as T;
    }
    if (t == List<_i8.DrinkLog>) {
      return (data as List).map((e) => deserialize<_i8.DrinkLog>(e)).toList()
          as T;
    }
    if (t == List<_i27.DrinkReference>) {
      return (data as List)
              .map((e) => deserialize<_i27.DrinkReference>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.DrinkLog>) {
      return (data as List).map((e) => deserialize<_i28.DrinkLog>(e)).toList()
          as T;
    }
    if (t == List<_i29.DailySummary>) {
      return (data as List)
              .map((e) => deserialize<_i29.DailySummary>(e))
              .toList()
          as T;
    }
    if (t == List<_i30.MealLog>) {
      return (data as List).map((e) => deserialize<_i30.MealLog>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.AuthToken => 'AuthToken',
      _i6.DailySummary => 'DailySummary',
      _i7.DayDetail => 'DayDetail',
      _i8.DrinkLog => 'DrinkLog',
      _i9.DrinkReference => 'DrinkReference',
      _i10.AlcoholHabit => 'AlcoholHabit',
      _i11.BiologicalSex => 'BiologicalSex',
      _i12.DrinkType => 'DrinkType',
      _i13.EatingStyle => 'EatingStyle',
      _i14.HeightUnit => 'HeightUnit',
      _i15.InputMethod => 'InputMethod',
      _i16.MealSource => 'MealSource',
      _i17.MealType => 'MealType',
      _i18.UserGoal => 'UserGoal',
      _i19.WeightUnit => 'WeightUnit',
      _i20.Greeting => 'Greeting',
      _i21.HomeData => 'HomeData',
      _i22.MealCorrectionInput => 'MealCorrectionInput',
      _i23.MealLog => 'MealLog',
      _i24.MealResult => 'MealResult',
      _i25.MorningRecap => 'MorningRecap',
      _i26.UserProfile => 'UserProfile',
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
      case _i5.AuthToken():
        return 'AuthToken';
      case _i6.DailySummary():
        return 'DailySummary';
      case _i7.DayDetail():
        return 'DayDetail';
      case _i8.DrinkLog():
        return 'DrinkLog';
      case _i9.DrinkReference():
        return 'DrinkReference';
      case _i10.AlcoholHabit():
        return 'AlcoholHabit';
      case _i11.BiologicalSex():
        return 'BiologicalSex';
      case _i12.DrinkType():
        return 'DrinkType';
      case _i13.EatingStyle():
        return 'EatingStyle';
      case _i14.HeightUnit():
        return 'HeightUnit';
      case _i15.InputMethod():
        return 'InputMethod';
      case _i16.MealSource():
        return 'MealSource';
      case _i17.MealType():
        return 'MealType';
      case _i18.UserGoal():
        return 'UserGoal';
      case _i19.WeightUnit():
        return 'WeightUnit';
      case _i20.Greeting():
        return 'Greeting';
      case _i21.HomeData():
        return 'HomeData';
      case _i22.MealCorrectionInput():
        return 'MealCorrectionInput';
      case _i23.MealLog():
        return 'MealLog';
      case _i24.MealResult():
        return 'MealResult';
      case _i25.MorningRecap():
        return 'MorningRecap';
      case _i26.UserProfile():
        return 'UserProfile';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
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
      return deserialize<_i5.AuthToken>(data['data']);
    }
    if (dataClassName == 'DailySummary') {
      return deserialize<_i6.DailySummary>(data['data']);
    }
    if (dataClassName == 'DayDetail') {
      return deserialize<_i7.DayDetail>(data['data']);
    }
    if (dataClassName == 'DrinkLog') {
      return deserialize<_i8.DrinkLog>(data['data']);
    }
    if (dataClassName == 'DrinkReference') {
      return deserialize<_i9.DrinkReference>(data['data']);
    }
    if (dataClassName == 'AlcoholHabit') {
      return deserialize<_i10.AlcoholHabit>(data['data']);
    }
    if (dataClassName == 'BiologicalSex') {
      return deserialize<_i11.BiologicalSex>(data['data']);
    }
    if (dataClassName == 'DrinkType') {
      return deserialize<_i12.DrinkType>(data['data']);
    }
    if (dataClassName == 'EatingStyle') {
      return deserialize<_i13.EatingStyle>(data['data']);
    }
    if (dataClassName == 'HeightUnit') {
      return deserialize<_i14.HeightUnit>(data['data']);
    }
    if (dataClassName == 'InputMethod') {
      return deserialize<_i15.InputMethod>(data['data']);
    }
    if (dataClassName == 'MealSource') {
      return deserialize<_i16.MealSource>(data['data']);
    }
    if (dataClassName == 'MealType') {
      return deserialize<_i17.MealType>(data['data']);
    }
    if (dataClassName == 'UserGoal') {
      return deserialize<_i18.UserGoal>(data['data']);
    }
    if (dataClassName == 'WeightUnit') {
      return deserialize<_i19.WeightUnit>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i20.Greeting>(data['data']);
    }
    if (dataClassName == 'HomeData') {
      return deserialize<_i21.HomeData>(data['data']);
    }
    if (dataClassName == 'MealCorrectionInput') {
      return deserialize<_i22.MealCorrectionInput>(data['data']);
    }
    if (dataClassName == 'MealLog') {
      return deserialize<_i23.MealLog>(data['data']);
    }
    if (dataClassName == 'MealResult') {
      return deserialize<_i24.MealResult>(data['data']);
    }
    if (dataClassName == 'MorningRecap') {
      return deserialize<_i25.MorningRecap>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i26.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.DailySummary:
        return _i6.DailySummary.t;
      case _i8.DrinkLog:
        return _i8.DrinkLog.t;
      case _i9.DrinkReference:
        return _i9.DrinkReference.t;
      case _i23.MealLog:
        return _i23.MealLog.t;
      case _i24.MealResult:
        return _i24.MealResult.t;
      case _i25.MorningRecap:
        return _i25.MorningRecap.t;
      case _i26.UserProfile:
        return _i26.UserProfile.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'adapt';

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
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

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
import 'enums/meal_type.dart' as _i2;
import 'enums/input_method.dart' as _i3;

/// A single meal logging event.
abstract class MealLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MealLogTable();

  static const db = MealLogRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static MealLogInclude include() {
    return MealLogInclude._();
  }

  static MealLogIncludeList includeList({
    _i1.WhereExpressionBuilder<MealLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MealLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MealLogTable>? orderByList,
    MealLogInclude? include,
  }) {
    return MealLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MealLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MealLog.t),
      include: include,
    );
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

class MealLogUpdateTable extends _i1.UpdateTable<MealLogTable> {
  MealLogUpdateTable(super.table);

  _i1.ColumnValue<String, String> userId(String value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> loggedAt(DateTime value) =>
      _i1.ColumnValue(
        table.loggedAt,
        value,
      );

  _i1.ColumnValue<_i2.MealType, _i2.MealType> mealType(_i2.MealType value) =>
      _i1.ColumnValue(
        table.mealType,
        value,
      );

  _i1.ColumnValue<_i3.InputMethod, _i3.InputMethod> inputMethod(
    _i3.InputMethod value,
  ) => _i1.ColumnValue(
    table.inputMethod,
    value,
  );

  _i1.ColumnValue<String, String> rawInput(String? value) => _i1.ColumnValue(
    table.rawInput,
    value,
  );

  _i1.ColumnValue<String, String> imageUrl(String? value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<String, String> locationName(String? value) =>
      _i1.ColumnValue(
        table.locationName,
        value,
      );

  _i1.ColumnValue<bool, bool> estimated(bool value) => _i1.ColumnValue(
    table.estimated,
    value,
  );
}

class MealLogTable extends _i1.Table<int?> {
  MealLogTable({super.tableRelation}) : super(tableName: 'meal_logs') {
    updateTable = MealLogUpdateTable(this);
    userId = _i1.ColumnString(
      'userId',
      this,
    );
    loggedAt = _i1.ColumnDateTime(
      'loggedAt',
      this,
    );
    mealType = _i1.ColumnEnum(
      'mealType',
      this,
      _i1.EnumSerialization.byName,
    );
    inputMethod = _i1.ColumnEnum(
      'inputMethod',
      this,
      _i1.EnumSerialization.byName,
    );
    rawInput = _i1.ColumnString(
      'rawInput',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    locationName = _i1.ColumnString(
      'locationName',
      this,
    );
    estimated = _i1.ColumnBool(
      'estimated',
      this,
    );
  }

  late final MealLogUpdateTable updateTable;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  late final _i1.ColumnString userId;

  /// When the meal was logged.
  late final _i1.ColumnDateTime loggedAt;

  /// Meal type.
  late final _i1.ColumnEnum<_i2.MealType> mealType;

  /// Input method used.
  late final _i1.ColumnEnum<_i3.InputMethod> inputMethod;

  /// Raw text description or photo prompt.
  late final _i1.ColumnString rawInput;

  /// URL to uploaded photo if inputMethod is photo.
  late final _i1.ColumnString imageUrl;

  /// Restaurant or location name if inputMethod is location.
  late final _i1.ColumnString locationName;

  /// True when nutrition values are AI-estimated (not confirmed by user).
  late final _i1.ColumnBool estimated;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    loggedAt,
    mealType,
    inputMethod,
    rawInput,
    imageUrl,
    locationName,
    estimated,
  ];
}

class MealLogInclude extends _i1.IncludeObject {
  MealLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MealLog.t;
}

class MealLogIncludeList extends _i1.IncludeList {
  MealLogIncludeList._({
    _i1.WhereExpressionBuilder<MealLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MealLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MealLog.t;
}

class MealLogRepository {
  const MealLogRepository._();

  /// Returns a list of [MealLog]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<MealLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MealLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MealLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MealLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MealLog>(
      where: where?.call(MealLog.t),
      orderBy: orderBy?.call(MealLog.t),
      orderByList: orderByList?.call(MealLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MealLog] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<MealLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MealLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<MealLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MealLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MealLog>(
      where: where?.call(MealLog.t),
      orderBy: orderBy?.call(MealLog.t),
      orderByList: orderByList?.call(MealLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MealLog] by its [id] or null if no such row exists.
  Future<MealLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MealLog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MealLog]s in the list and returns the inserted rows.
  ///
  /// The returned [MealLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MealLog>> insert(
    _i1.Session session,
    List<MealLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MealLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MealLog] and returns the inserted row.
  ///
  /// The returned [MealLog] will have its `id` field set.
  Future<MealLog> insertRow(
    _i1.Session session,
    MealLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MealLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MealLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MealLog>> update(
    _i1.Session session,
    List<MealLog> rows, {
    _i1.ColumnSelections<MealLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MealLog>(
      rows,
      columns: columns?.call(MealLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MealLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MealLog> updateRow(
    _i1.Session session,
    MealLog row, {
    _i1.ColumnSelections<MealLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MealLog>(
      row,
      columns: columns?.call(MealLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MealLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MealLog?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MealLogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MealLog>(
      id,
      columnValues: columnValues(MealLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MealLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MealLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MealLogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MealLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MealLogTable>? orderBy,
    _i1.OrderByListBuilder<MealLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MealLog>(
      columnValues: columnValues(MealLog.t.updateTable),
      where: where(MealLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MealLog.t),
      orderByList: orderByList?.call(MealLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MealLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MealLog>> delete(
    _i1.Session session,
    List<MealLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MealLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MealLog].
  Future<MealLog> deleteRow(
    _i1.Session session,
    MealLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MealLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MealLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MealLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MealLog>(
      where: where(MealLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MealLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MealLog>(
      where: where?.call(MealLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

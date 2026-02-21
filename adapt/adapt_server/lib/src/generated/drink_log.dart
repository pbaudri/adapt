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

/// A single drink logging event.
/// caloriesKcal is denormalised (quantity × reference calories) for fast history reads.
abstract class DrinkLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DrinkLog._({
    this.id,
    required this.userId,
    required this.loggedAt,
    required this.drinkType,
    required this.quantity,
    required this.caloriesKcal,
  });

  factory DrinkLog({
    int? id,
    required String userId,
    required DateTime loggedAt,
    required String drinkType,
    required int quantity,
    required int caloriesKcal,
  }) = _DrinkLogImpl;

  factory DrinkLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return DrinkLog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      loggedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['loggedAt'],
      ),
      drinkType: jsonSerialization['drinkType'] as String,
      quantity: jsonSerialization['quantity'] as int,
      caloriesKcal: jsonSerialization['caloriesKcal'] as int,
    );
  }

  static final t = DrinkLogTable();

  static const db = DrinkLogRepository._();

  @override
  int? id;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  String userId;

  /// When the drinks were logged.
  DateTime loggedAt;

  /// Drink type: 'beer' | 'wine' | 'champagne' | 'cocktail' | 'whisky' | 'long_drink' | 'hard_seltzer' | 'other'
  String drinkType;

  /// Number of glasses/units logged.
  int quantity;

  /// Pre-calculated total calories: quantity × drinkReference.caloriesPerUnit.
  int caloriesKcal;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DrinkLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrinkLog copyWith({
    int? id,
    String? userId,
    DateTime? loggedAt,
    String? drinkType,
    int? quantity,
    int? caloriesKcal,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DrinkLog',
      if (id != null) 'id': id,
      'userId': userId,
      'loggedAt': loggedAt.toJson(),
      'drinkType': drinkType,
      'quantity': quantity,
      'caloriesKcal': caloriesKcal,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DrinkLog',
      if (id != null) 'id': id,
      'userId': userId,
      'loggedAt': loggedAt.toJson(),
      'drinkType': drinkType,
      'quantity': quantity,
      'caloriesKcal': caloriesKcal,
    };
  }

  static DrinkLogInclude include() {
    return DrinkLogInclude._();
  }

  static DrinkLogIncludeList includeList({
    _i1.WhereExpressionBuilder<DrinkLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrinkLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrinkLogTable>? orderByList,
    DrinkLogInclude? include,
  }) {
    return DrinkLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrinkLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DrinkLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrinkLogImpl extends DrinkLog {
  _DrinkLogImpl({
    int? id,
    required String userId,
    required DateTime loggedAt,
    required String drinkType,
    required int quantity,
    required int caloriesKcal,
  }) : super._(
         id: id,
         userId: userId,
         loggedAt: loggedAt,
         drinkType: drinkType,
         quantity: quantity,
         caloriesKcal: caloriesKcal,
       );

  /// Returns a shallow copy of this [DrinkLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrinkLog copyWith({
    Object? id = _Undefined,
    String? userId,
    DateTime? loggedAt,
    String? drinkType,
    int? quantity,
    int? caloriesKcal,
  }) {
    return DrinkLog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      loggedAt: loggedAt ?? this.loggedAt,
      drinkType: drinkType ?? this.drinkType,
      quantity: quantity ?? this.quantity,
      caloriesKcal: caloriesKcal ?? this.caloriesKcal,
    );
  }
}

class DrinkLogUpdateTable extends _i1.UpdateTable<DrinkLogTable> {
  DrinkLogUpdateTable(super.table);

  _i1.ColumnValue<String, String> userId(String value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> loggedAt(DateTime value) =>
      _i1.ColumnValue(
        table.loggedAt,
        value,
      );

  _i1.ColumnValue<String, String> drinkType(String value) => _i1.ColumnValue(
    table.drinkType,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<int, int> caloriesKcal(int value) => _i1.ColumnValue(
    table.caloriesKcal,
    value,
  );
}

class DrinkLogTable extends _i1.Table<int?> {
  DrinkLogTable({super.tableRelation}) : super(tableName: 'drink_logs') {
    updateTable = DrinkLogUpdateTable(this);
    userId = _i1.ColumnString(
      'userId',
      this,
    );
    loggedAt = _i1.ColumnDateTime(
      'loggedAt',
      this,
    );
    drinkType = _i1.ColumnString(
      'drinkType',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    caloriesKcal = _i1.ColumnInt(
      'caloriesKcal',
      this,
    );
  }

  late final DrinkLogUpdateTable updateTable;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  late final _i1.ColumnString userId;

  /// When the drinks were logged.
  late final _i1.ColumnDateTime loggedAt;

  /// Drink type: 'beer' | 'wine' | 'champagne' | 'cocktail' | 'whisky' | 'long_drink' | 'hard_seltzer' | 'other'
  late final _i1.ColumnString drinkType;

  /// Number of glasses/units logged.
  late final _i1.ColumnInt quantity;

  /// Pre-calculated total calories: quantity × drinkReference.caloriesPerUnit.
  late final _i1.ColumnInt caloriesKcal;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    loggedAt,
    drinkType,
    quantity,
    caloriesKcal,
  ];
}

class DrinkLogInclude extends _i1.IncludeObject {
  DrinkLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DrinkLog.t;
}

class DrinkLogIncludeList extends _i1.IncludeList {
  DrinkLogIncludeList._({
    _i1.WhereExpressionBuilder<DrinkLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DrinkLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DrinkLog.t;
}

class DrinkLogRepository {
  const DrinkLogRepository._();

  /// Returns a list of [DrinkLog]s matching the given query parameters.
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
  Future<List<DrinkLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrinkLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrinkLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrinkLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DrinkLog>(
      where: where?.call(DrinkLog.t),
      orderBy: orderBy?.call(DrinkLog.t),
      orderByList: orderByList?.call(DrinkLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DrinkLog] matching the given query parameters.
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
  Future<DrinkLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrinkLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<DrinkLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrinkLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DrinkLog>(
      where: where?.call(DrinkLog.t),
      orderBy: orderBy?.call(DrinkLog.t),
      orderByList: orderByList?.call(DrinkLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DrinkLog] by its [id] or null if no such row exists.
  Future<DrinkLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DrinkLog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DrinkLog]s in the list and returns the inserted rows.
  ///
  /// The returned [DrinkLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DrinkLog>> insert(
    _i1.Session session,
    List<DrinkLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DrinkLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DrinkLog] and returns the inserted row.
  ///
  /// The returned [DrinkLog] will have its `id` field set.
  Future<DrinkLog> insertRow(
    _i1.Session session,
    DrinkLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DrinkLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DrinkLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DrinkLog>> update(
    _i1.Session session,
    List<DrinkLog> rows, {
    _i1.ColumnSelections<DrinkLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DrinkLog>(
      rows,
      columns: columns?.call(DrinkLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrinkLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DrinkLog> updateRow(
    _i1.Session session,
    DrinkLog row, {
    _i1.ColumnSelections<DrinkLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DrinkLog>(
      row,
      columns: columns?.call(DrinkLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrinkLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DrinkLog?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<DrinkLogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DrinkLog>(
      id,
      columnValues: columnValues(DrinkLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DrinkLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DrinkLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DrinkLogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DrinkLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrinkLogTable>? orderBy,
    _i1.OrderByListBuilder<DrinkLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DrinkLog>(
      columnValues: columnValues(DrinkLog.t.updateTable),
      where: where(DrinkLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrinkLog.t),
      orderByList: orderByList?.call(DrinkLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DrinkLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DrinkLog>> delete(
    _i1.Session session,
    List<DrinkLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DrinkLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DrinkLog].
  Future<DrinkLog> deleteRow(
    _i1.Session session,
    DrinkLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DrinkLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DrinkLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DrinkLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DrinkLog>(
      where: where(DrinkLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrinkLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DrinkLog>(
      where: where?.call(DrinkLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

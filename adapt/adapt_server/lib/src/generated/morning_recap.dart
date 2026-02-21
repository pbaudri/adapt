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

/// AI-generated morning recap shown to the user each morning.
abstract class MorningRecap
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MorningRecapTable();

  static const db = MorningRecapRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static MorningRecapInclude include() {
    return MorningRecapInclude._();
  }

  static MorningRecapIncludeList includeList({
    _i1.WhereExpressionBuilder<MorningRecapTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MorningRecapTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MorningRecapTable>? orderByList,
    MorningRecapInclude? include,
  }) {
    return MorningRecapIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MorningRecap.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MorningRecap.t),
      include: include,
    );
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

class MorningRecapUpdateTable extends _i1.UpdateTable<MorningRecapTable> {
  MorningRecapUpdateTable(super.table);

  _i1.ColumnValue<String, String> userId(String value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<String, String> headline(String value) => _i1.ColumnValue(
    table.headline,
    value,
  );

  _i1.ColumnValue<String, String> subMessage(String value) => _i1.ColumnValue(
    table.subMessage,
    value,
  );

  _i1.ColumnValue<String, String> tips(String value) => _i1.ColumnValue(
    table.tips,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> seenAt(DateTime? value) =>
      _i1.ColumnValue(
        table.seenAt,
        value,
      );
}

class MorningRecapTable extends _i1.Table<int?> {
  MorningRecapTable({super.tableRelation})
    : super(tableName: 'morning_recaps') {
    updateTable = MorningRecapUpdateTable(this);
    userId = _i1.ColumnString(
      'userId',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    headline = _i1.ColumnString(
      'headline',
      this,
    );
    subMessage = _i1.ColumnString(
      'subMessage',
      this,
    );
    tips = _i1.ColumnString(
      'tips',
      this,
    );
    seenAt = _i1.ColumnDateTime(
      'seenAt',
      this,
    );
  }

  late final MorningRecapUpdateTable updateTable;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  late final _i1.ColumnString userId;

  /// Date this recap covers (midnight UTC).
  late final _i1.ColumnDateTime date;

  /// Personalised headline, e.g. "Morning, Pierre."
  late final _i1.ColumnString headline;

  /// Supporting message shown below the headline.
  late final _i1.ColumnString subMessage;

  /// JSON-encoded list of tip objects: [{icon, title, subtitle}].
  late final _i1.ColumnString tips;

  /// Timestamp when the user opened the recap. Null until viewed.
  late final _i1.ColumnDateTime seenAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    date,
    headline,
    subMessage,
    tips,
    seenAt,
  ];
}

class MorningRecapInclude extends _i1.IncludeObject {
  MorningRecapInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MorningRecap.t;
}

class MorningRecapIncludeList extends _i1.IncludeList {
  MorningRecapIncludeList._({
    _i1.WhereExpressionBuilder<MorningRecapTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MorningRecap.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MorningRecap.t;
}

class MorningRecapRepository {
  const MorningRecapRepository._();

  /// Returns a list of [MorningRecap]s matching the given query parameters.
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
  Future<List<MorningRecap>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MorningRecapTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MorningRecapTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MorningRecapTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MorningRecap>(
      where: where?.call(MorningRecap.t),
      orderBy: orderBy?.call(MorningRecap.t),
      orderByList: orderByList?.call(MorningRecap.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MorningRecap] matching the given query parameters.
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
  Future<MorningRecap?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MorningRecapTable>? where,
    int? offset,
    _i1.OrderByBuilder<MorningRecapTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MorningRecapTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MorningRecap>(
      where: where?.call(MorningRecap.t),
      orderBy: orderBy?.call(MorningRecap.t),
      orderByList: orderByList?.call(MorningRecap.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MorningRecap] by its [id] or null if no such row exists.
  Future<MorningRecap?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MorningRecap>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MorningRecap]s in the list and returns the inserted rows.
  ///
  /// The returned [MorningRecap]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MorningRecap>> insert(
    _i1.Session session,
    List<MorningRecap> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MorningRecap>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MorningRecap] and returns the inserted row.
  ///
  /// The returned [MorningRecap] will have its `id` field set.
  Future<MorningRecap> insertRow(
    _i1.Session session,
    MorningRecap row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MorningRecap>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MorningRecap]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MorningRecap>> update(
    _i1.Session session,
    List<MorningRecap> rows, {
    _i1.ColumnSelections<MorningRecapTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MorningRecap>(
      rows,
      columns: columns?.call(MorningRecap.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MorningRecap]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MorningRecap> updateRow(
    _i1.Session session,
    MorningRecap row, {
    _i1.ColumnSelections<MorningRecapTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MorningRecap>(
      row,
      columns: columns?.call(MorningRecap.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MorningRecap] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MorningRecap?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MorningRecapUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MorningRecap>(
      id,
      columnValues: columnValues(MorningRecap.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MorningRecap]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MorningRecap>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MorningRecapUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MorningRecapTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MorningRecapTable>? orderBy,
    _i1.OrderByListBuilder<MorningRecapTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MorningRecap>(
      columnValues: columnValues(MorningRecap.t.updateTable),
      where: where(MorningRecap.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MorningRecap.t),
      orderByList: orderByList?.call(MorningRecap.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MorningRecap]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MorningRecap>> delete(
    _i1.Session session,
    List<MorningRecap> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MorningRecap>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MorningRecap].
  Future<MorningRecap> deleteRow(
    _i1.Session session,
    MorningRecap row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MorningRecap>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MorningRecap>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MorningRecapTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MorningRecap>(
      where: where(MorningRecap.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MorningRecapTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MorningRecap>(
      where: where?.call(MorningRecap.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

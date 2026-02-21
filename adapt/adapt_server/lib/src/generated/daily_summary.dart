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

/// Aggregated daily nutrition summary for a user.
/// Updated after every meal log or drink log.
abstract class DailySummary
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = DailySummaryTable();

  static const db = DailySummaryRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static DailySummaryInclude include() {
    return DailySummaryInclude._();
  }

  static DailySummaryIncludeList includeList({
    _i1.WhereExpressionBuilder<DailySummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailySummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailySummaryTable>? orderByList,
    DailySummaryInclude? include,
  }) {
    return DailySummaryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DailySummary.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DailySummary.t),
      include: include,
    );
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

class DailySummaryUpdateTable extends _i1.UpdateTable<DailySummaryTable> {
  DailySummaryUpdateTable(super.table);

  _i1.ColumnValue<String, String> userId(String value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<int, int> totalKcal(int value) => _i1.ColumnValue(
    table.totalKcal,
    value,
  );

  _i1.ColumnValue<double, double> totalProteinG(double value) =>
      _i1.ColumnValue(
        table.totalProteinG,
        value,
      );

  _i1.ColumnValue<double, double> totalCarbsG(double value) => _i1.ColumnValue(
    table.totalCarbsG,
    value,
  );

  _i1.ColumnValue<double, double> totalFatG(double value) => _i1.ColumnValue(
    table.totalFatG,
    value,
  );

  _i1.ColumnValue<bool, bool> hadAlcohol(bool value) => _i1.ColumnValue(
    table.hadAlcohol,
    value,
  );

  _i1.ColumnValue<String, String> mealEmojis(String value) => _i1.ColumnValue(
    table.mealEmojis,
    value,
  );

  _i1.ColumnValue<bool, bool> morningRecapSent(bool value) => _i1.ColumnValue(
    table.morningRecapSent,
    value,
  );
}

class DailySummaryTable extends _i1.Table<int?> {
  DailySummaryTable({super.tableRelation})
    : super(tableName: 'daily_summaries') {
    updateTable = DailySummaryUpdateTable(this);
    userId = _i1.ColumnString(
      'userId',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    totalKcal = _i1.ColumnInt(
      'totalKcal',
      this,
    );
    totalProteinG = _i1.ColumnDouble(
      'totalProteinG',
      this,
    );
    totalCarbsG = _i1.ColumnDouble(
      'totalCarbsG',
      this,
    );
    totalFatG = _i1.ColumnDouble(
      'totalFatG',
      this,
    );
    hadAlcohol = _i1.ColumnBool(
      'hadAlcohol',
      this,
    );
    mealEmojis = _i1.ColumnString(
      'mealEmojis',
      this,
    );
    morningRecapSent = _i1.ColumnBool(
      'morningRecapSent',
      this,
    );
  }

  late final DailySummaryUpdateTable updateTable;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  late final _i1.ColumnString userId;

  /// Date of the summary (time component is always midnight UTC).
  late final _i1.ColumnDateTime date;

  /// Total calories consumed that day.
  late final _i1.ColumnInt totalKcal;

  /// Total protein in grams.
  late final _i1.ColumnDouble totalProteinG;

  /// Total carbohydrates in grams.
  late final _i1.ColumnDouble totalCarbsG;

  /// Total fat in grams.
  late final _i1.ColumnDouble totalFatG;

  /// True if any alcohol was logged that day.
  late final _i1.ColumnBool hadAlcohol;

  /// JSON array of meal emoji identifiers, e.g. '["pizza","salad"]'.
  late final _i1.ColumnString mealEmojis;

  /// True once a morning recap has been generated and sent for this day.
  late final _i1.ColumnBool morningRecapSent;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    date,
    totalKcal,
    totalProteinG,
    totalCarbsG,
    totalFatG,
    hadAlcohol,
    mealEmojis,
    morningRecapSent,
  ];
}

class DailySummaryInclude extends _i1.IncludeObject {
  DailySummaryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DailySummary.t;
}

class DailySummaryIncludeList extends _i1.IncludeList {
  DailySummaryIncludeList._({
    _i1.WhereExpressionBuilder<DailySummaryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DailySummary.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DailySummary.t;
}

class DailySummaryRepository {
  const DailySummaryRepository._();

  /// Returns a list of [DailySummary]s matching the given query parameters.
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
  Future<List<DailySummary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailySummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailySummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailySummaryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DailySummary>(
      where: where?.call(DailySummary.t),
      orderBy: orderBy?.call(DailySummary.t),
      orderByList: orderByList?.call(DailySummary.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DailySummary] matching the given query parameters.
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
  Future<DailySummary?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailySummaryTable>? where,
    int? offset,
    _i1.OrderByBuilder<DailySummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailySummaryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DailySummary>(
      where: where?.call(DailySummary.t),
      orderBy: orderBy?.call(DailySummary.t),
      orderByList: orderByList?.call(DailySummary.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DailySummary] by its [id] or null if no such row exists.
  Future<DailySummary?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DailySummary>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DailySummary]s in the list and returns the inserted rows.
  ///
  /// The returned [DailySummary]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DailySummary>> insert(
    _i1.Session session,
    List<DailySummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DailySummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DailySummary] and returns the inserted row.
  ///
  /// The returned [DailySummary] will have its `id` field set.
  Future<DailySummary> insertRow(
    _i1.Session session,
    DailySummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DailySummary>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DailySummary]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DailySummary>> update(
    _i1.Session session,
    List<DailySummary> rows, {
    _i1.ColumnSelections<DailySummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DailySummary>(
      rows,
      columns: columns?.call(DailySummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DailySummary]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DailySummary> updateRow(
    _i1.Session session,
    DailySummary row, {
    _i1.ColumnSelections<DailySummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DailySummary>(
      row,
      columns: columns?.call(DailySummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DailySummary] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DailySummary?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<DailySummaryUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DailySummary>(
      id,
      columnValues: columnValues(DailySummary.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DailySummary]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DailySummary>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DailySummaryUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DailySummaryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailySummaryTable>? orderBy,
    _i1.OrderByListBuilder<DailySummaryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DailySummary>(
      columnValues: columnValues(DailySummary.t.updateTable),
      where: where(DailySummary.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DailySummary.t),
      orderByList: orderByList?.call(DailySummary.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DailySummary]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DailySummary>> delete(
    _i1.Session session,
    List<DailySummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DailySummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DailySummary].
  Future<DailySummary> deleteRow(
    _i1.Session session,
    DailySummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DailySummary>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DailySummary>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DailySummaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DailySummary>(
      where: where(DailySummary.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailySummaryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DailySummary>(
      where: where?.call(DailySummary.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

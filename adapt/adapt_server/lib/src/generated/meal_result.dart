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

/// AI-estimated or user-corrected nutritional result for a meal.
/// One-to-one with meal_logs.
abstract class MealResult
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MealResult._({
    this.id,
    required this.mealLogId,
    required this.name,
    required this.caloriesKcal,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.aiMessage,
    this.aiTip,
    required this.source,
  });

  factory MealResult({
    int? id,
    required int mealLogId,
    required String name,
    required int caloriesKcal,
    required double proteinG,
    required double carbsG,
    required double fatG,
    required String aiMessage,
    String? aiTip,
    required String source,
  }) = _MealResultImpl;

  factory MealResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return MealResult(
      id: jsonSerialization['id'] as int?,
      mealLogId: jsonSerialization['mealLogId'] as int,
      name: jsonSerialization['name'] as String,
      caloriesKcal: jsonSerialization['caloriesKcal'] as int,
      proteinG: (jsonSerialization['proteinG'] as num).toDouble(),
      carbsG: (jsonSerialization['carbsG'] as num).toDouble(),
      fatG: (jsonSerialization['fatG'] as num).toDouble(),
      aiMessage: jsonSerialization['aiMessage'] as String,
      aiTip: jsonSerialization['aiTip'] as String?,
      source: jsonSerialization['source'] as String,
    );
  }

  static final t = MealResultTable();

  static const db = MealResultRepository._();

  @override
  int? id;

  /// FK → meal_logs.id (one-to-one).
  int mealLogId;

  /// AI-normalised meal name, e.g. "Big Mac Menu".
  String name;

  /// Auto-calculated: (proteinG×4) + (carbsG×4) + (fatG×9). Never user-supplied.
  int caloriesKcal;

  /// Protein in grams.
  double proteinG;

  /// Carbohydrates in grams.
  double carbsG;

  /// Fat in grams.
  double fatG;

  /// Zero-judgment AI message shown to the user.
  String aiMessage;

  /// Optional follow-up suggestion from AI.
  String? aiTip;

  /// Source: 'ai_estimated' | 'database' | 'user_corrected'
  String source;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MealResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MealResult copyWith({
    int? id,
    int? mealLogId,
    String? name,
    int? caloriesKcal,
    double? proteinG,
    double? carbsG,
    double? fatG,
    String? aiMessage,
    String? aiTip,
    String? source,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MealResult',
      if (id != null) 'id': id,
      'mealLogId': mealLogId,
      'name': name,
      'caloriesKcal': caloriesKcal,
      'proteinG': proteinG,
      'carbsG': carbsG,
      'fatG': fatG,
      'aiMessage': aiMessage,
      if (aiTip != null) 'aiTip': aiTip,
      'source': source,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MealResult',
      if (id != null) 'id': id,
      'mealLogId': mealLogId,
      'name': name,
      'caloriesKcal': caloriesKcal,
      'proteinG': proteinG,
      'carbsG': carbsG,
      'fatG': fatG,
      'aiMessage': aiMessage,
      if (aiTip != null) 'aiTip': aiTip,
      'source': source,
    };
  }

  static MealResultInclude include() {
    return MealResultInclude._();
  }

  static MealResultIncludeList includeList({
    _i1.WhereExpressionBuilder<MealResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MealResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MealResultTable>? orderByList,
    MealResultInclude? include,
  }) {
    return MealResultIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MealResult.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MealResult.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MealResultImpl extends MealResult {
  _MealResultImpl({
    int? id,
    required int mealLogId,
    required String name,
    required int caloriesKcal,
    required double proteinG,
    required double carbsG,
    required double fatG,
    required String aiMessage,
    String? aiTip,
    required String source,
  }) : super._(
         id: id,
         mealLogId: mealLogId,
         name: name,
         caloriesKcal: caloriesKcal,
         proteinG: proteinG,
         carbsG: carbsG,
         fatG: fatG,
         aiMessage: aiMessage,
         aiTip: aiTip,
         source: source,
       );

  /// Returns a shallow copy of this [MealResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MealResult copyWith({
    Object? id = _Undefined,
    int? mealLogId,
    String? name,
    int? caloriesKcal,
    double? proteinG,
    double? carbsG,
    double? fatG,
    String? aiMessage,
    Object? aiTip = _Undefined,
    String? source,
  }) {
    return MealResult(
      id: id is int? ? id : this.id,
      mealLogId: mealLogId ?? this.mealLogId,
      name: name ?? this.name,
      caloriesKcal: caloriesKcal ?? this.caloriesKcal,
      proteinG: proteinG ?? this.proteinG,
      carbsG: carbsG ?? this.carbsG,
      fatG: fatG ?? this.fatG,
      aiMessage: aiMessage ?? this.aiMessage,
      aiTip: aiTip is String? ? aiTip : this.aiTip,
      source: source ?? this.source,
    );
  }
}

class MealResultUpdateTable extends _i1.UpdateTable<MealResultTable> {
  MealResultUpdateTable(super.table);

  _i1.ColumnValue<int, int> mealLogId(int value) => _i1.ColumnValue(
    table.mealLogId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<int, int> caloriesKcal(int value) => _i1.ColumnValue(
    table.caloriesKcal,
    value,
  );

  _i1.ColumnValue<double, double> proteinG(double value) => _i1.ColumnValue(
    table.proteinG,
    value,
  );

  _i1.ColumnValue<double, double> carbsG(double value) => _i1.ColumnValue(
    table.carbsG,
    value,
  );

  _i1.ColumnValue<double, double> fatG(double value) => _i1.ColumnValue(
    table.fatG,
    value,
  );

  _i1.ColumnValue<String, String> aiMessage(String value) => _i1.ColumnValue(
    table.aiMessage,
    value,
  );

  _i1.ColumnValue<String, String> aiTip(String? value) => _i1.ColumnValue(
    table.aiTip,
    value,
  );

  _i1.ColumnValue<String, String> source(String value) => _i1.ColumnValue(
    table.source,
    value,
  );
}

class MealResultTable extends _i1.Table<int?> {
  MealResultTable({super.tableRelation}) : super(tableName: 'meal_results') {
    updateTable = MealResultUpdateTable(this);
    mealLogId = _i1.ColumnInt(
      'mealLogId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    caloriesKcal = _i1.ColumnInt(
      'caloriesKcal',
      this,
    );
    proteinG = _i1.ColumnDouble(
      'proteinG',
      this,
    );
    carbsG = _i1.ColumnDouble(
      'carbsG',
      this,
    );
    fatG = _i1.ColumnDouble(
      'fatG',
      this,
    );
    aiMessage = _i1.ColumnString(
      'aiMessage',
      this,
    );
    aiTip = _i1.ColumnString(
      'aiTip',
      this,
    );
    source = _i1.ColumnString(
      'source',
      this,
    );
  }

  late final MealResultUpdateTable updateTable;

  /// FK → meal_logs.id (one-to-one).
  late final _i1.ColumnInt mealLogId;

  /// AI-normalised meal name, e.g. "Big Mac Menu".
  late final _i1.ColumnString name;

  /// Auto-calculated: (proteinG×4) + (carbsG×4) + (fatG×9). Never user-supplied.
  late final _i1.ColumnInt caloriesKcal;

  /// Protein in grams.
  late final _i1.ColumnDouble proteinG;

  /// Carbohydrates in grams.
  late final _i1.ColumnDouble carbsG;

  /// Fat in grams.
  late final _i1.ColumnDouble fatG;

  /// Zero-judgment AI message shown to the user.
  late final _i1.ColumnString aiMessage;

  /// Optional follow-up suggestion from AI.
  late final _i1.ColumnString aiTip;

  /// Source: 'ai_estimated' | 'database' | 'user_corrected'
  late final _i1.ColumnString source;

  @override
  List<_i1.Column> get columns => [
    id,
    mealLogId,
    name,
    caloriesKcal,
    proteinG,
    carbsG,
    fatG,
    aiMessage,
    aiTip,
    source,
  ];
}

class MealResultInclude extends _i1.IncludeObject {
  MealResultInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MealResult.t;
}

class MealResultIncludeList extends _i1.IncludeList {
  MealResultIncludeList._({
    _i1.WhereExpressionBuilder<MealResultTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MealResult.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MealResult.t;
}

class MealResultRepository {
  const MealResultRepository._();

  /// Returns a list of [MealResult]s matching the given query parameters.
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
  Future<List<MealResult>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MealResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MealResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MealResultTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MealResult>(
      where: where?.call(MealResult.t),
      orderBy: orderBy?.call(MealResult.t),
      orderByList: orderByList?.call(MealResult.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MealResult] matching the given query parameters.
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
  Future<MealResult?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MealResultTable>? where,
    int? offset,
    _i1.OrderByBuilder<MealResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MealResultTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MealResult>(
      where: where?.call(MealResult.t),
      orderBy: orderBy?.call(MealResult.t),
      orderByList: orderByList?.call(MealResult.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MealResult] by its [id] or null if no such row exists.
  Future<MealResult?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MealResult>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MealResult]s in the list and returns the inserted rows.
  ///
  /// The returned [MealResult]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MealResult>> insert(
    _i1.Session session,
    List<MealResult> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MealResult>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MealResult] and returns the inserted row.
  ///
  /// The returned [MealResult] will have its `id` field set.
  Future<MealResult> insertRow(
    _i1.Session session,
    MealResult row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MealResult>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MealResult]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MealResult>> update(
    _i1.Session session,
    List<MealResult> rows, {
    _i1.ColumnSelections<MealResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MealResult>(
      rows,
      columns: columns?.call(MealResult.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MealResult]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MealResult> updateRow(
    _i1.Session session,
    MealResult row, {
    _i1.ColumnSelections<MealResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MealResult>(
      row,
      columns: columns?.call(MealResult.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MealResult] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MealResult?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MealResultUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MealResult>(
      id,
      columnValues: columnValues(MealResult.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MealResult]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MealResult>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MealResultUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MealResultTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MealResultTable>? orderBy,
    _i1.OrderByListBuilder<MealResultTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MealResult>(
      columnValues: columnValues(MealResult.t.updateTable),
      where: where(MealResult.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MealResult.t),
      orderByList: orderByList?.call(MealResult.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MealResult]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MealResult>> delete(
    _i1.Session session,
    List<MealResult> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MealResult>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MealResult].
  Future<MealResult> deleteRow(
    _i1.Session session,
    MealResult row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MealResult>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MealResult>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MealResultTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MealResult>(
      where: where(MealResult.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MealResultTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MealResult>(
      where: where?.call(MealResult.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

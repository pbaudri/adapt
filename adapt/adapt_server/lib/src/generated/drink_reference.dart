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
import 'enums/drink_type.dart' as _i2;

/// Static reference table for drink calorie values.
/// Populated once via seed migration. Never modified at runtime.
abstract class DrinkReference
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DrinkReference._({
    this.id,
    required this.drinkType,
    required this.caloriesPerUnit,
    this.servingDescription,
    required this.sortOrder,
  });

  factory DrinkReference({
    int? id,
    required _i2.DrinkType drinkType,
    required int caloriesPerUnit,
    String? servingDescription,
    required int sortOrder,
  }) = _DrinkReferenceImpl;

  factory DrinkReference.fromJson(Map<String, dynamic> jsonSerialization) {
    return DrinkReference(
      id: jsonSerialization['id'] as int?,
      drinkType: _i2.DrinkType.fromJson(
        (jsonSerialization['drinkType'] as String),
      ),
      caloriesPerUnit: jsonSerialization['caloriesPerUnit'] as int,
      servingDescription: jsonSerialization['servingDescription'] as String?,
      sortOrder: jsonSerialization['sortOrder'] as int,
    );
  }

  static final t = DrinkReferenceTable();

  static const db = DrinkReferenceRepository._();

  @override
  int? id;

  /// Drink type identifier.
  _i2.DrinkType drinkType;

  /// Calories per standard glass/unit.
  int caloriesPerUnit;

  /// Human-readable serving size, e.g. "33cl". Null for generic "other".
  String? servingDescription;

  /// Display order (ascending = first shown).
  int sortOrder;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DrinkReference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrinkReference copyWith({
    int? id,
    _i2.DrinkType? drinkType,
    int? caloriesPerUnit,
    String? servingDescription,
    int? sortOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DrinkReference',
      if (id != null) 'id': id,
      'drinkType': drinkType.toJson(),
      'caloriesPerUnit': caloriesPerUnit,
      if (servingDescription != null) 'servingDescription': servingDescription,
      'sortOrder': sortOrder,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DrinkReference',
      if (id != null) 'id': id,
      'drinkType': drinkType.toJson(),
      'caloriesPerUnit': caloriesPerUnit,
      if (servingDescription != null) 'servingDescription': servingDescription,
      'sortOrder': sortOrder,
    };
  }

  static DrinkReferenceInclude include() {
    return DrinkReferenceInclude._();
  }

  static DrinkReferenceIncludeList includeList({
    _i1.WhereExpressionBuilder<DrinkReferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrinkReferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrinkReferenceTable>? orderByList,
    DrinkReferenceInclude? include,
  }) {
    return DrinkReferenceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrinkReference.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DrinkReference.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrinkReferenceImpl extends DrinkReference {
  _DrinkReferenceImpl({
    int? id,
    required _i2.DrinkType drinkType,
    required int caloriesPerUnit,
    String? servingDescription,
    required int sortOrder,
  }) : super._(
         id: id,
         drinkType: drinkType,
         caloriesPerUnit: caloriesPerUnit,
         servingDescription: servingDescription,
         sortOrder: sortOrder,
       );

  /// Returns a shallow copy of this [DrinkReference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrinkReference copyWith({
    Object? id = _Undefined,
    _i2.DrinkType? drinkType,
    int? caloriesPerUnit,
    Object? servingDescription = _Undefined,
    int? sortOrder,
  }) {
    return DrinkReference(
      id: id is int? ? id : this.id,
      drinkType: drinkType ?? this.drinkType,
      caloriesPerUnit: caloriesPerUnit ?? this.caloriesPerUnit,
      servingDescription: servingDescription is String?
          ? servingDescription
          : this.servingDescription,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}

class DrinkReferenceUpdateTable extends _i1.UpdateTable<DrinkReferenceTable> {
  DrinkReferenceUpdateTable(super.table);

  _i1.ColumnValue<_i2.DrinkType, _i2.DrinkType> drinkType(
    _i2.DrinkType value,
  ) => _i1.ColumnValue(
    table.drinkType,
    value,
  );

  _i1.ColumnValue<int, int> caloriesPerUnit(int value) => _i1.ColumnValue(
    table.caloriesPerUnit,
    value,
  );

  _i1.ColumnValue<String, String> servingDescription(String? value) =>
      _i1.ColumnValue(
        table.servingDescription,
        value,
      );

  _i1.ColumnValue<int, int> sortOrder(int value) => _i1.ColumnValue(
    table.sortOrder,
    value,
  );
}

class DrinkReferenceTable extends _i1.Table<int?> {
  DrinkReferenceTable({super.tableRelation})
    : super(tableName: 'drink_reference') {
    updateTable = DrinkReferenceUpdateTable(this);
    drinkType = _i1.ColumnEnum(
      'drinkType',
      this,
      _i1.EnumSerialization.byName,
    );
    caloriesPerUnit = _i1.ColumnInt(
      'caloriesPerUnit',
      this,
    );
    servingDescription = _i1.ColumnString(
      'servingDescription',
      this,
    );
    sortOrder = _i1.ColumnInt(
      'sortOrder',
      this,
    );
  }

  late final DrinkReferenceUpdateTable updateTable;

  /// Drink type identifier.
  late final _i1.ColumnEnum<_i2.DrinkType> drinkType;

  /// Calories per standard glass/unit.
  late final _i1.ColumnInt caloriesPerUnit;

  /// Human-readable serving size, e.g. "33cl". Null for generic "other".
  late final _i1.ColumnString servingDescription;

  /// Display order (ascending = first shown).
  late final _i1.ColumnInt sortOrder;

  @override
  List<_i1.Column> get columns => [
    id,
    drinkType,
    caloriesPerUnit,
    servingDescription,
    sortOrder,
  ];
}

class DrinkReferenceInclude extends _i1.IncludeObject {
  DrinkReferenceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DrinkReference.t;
}

class DrinkReferenceIncludeList extends _i1.IncludeList {
  DrinkReferenceIncludeList._({
    _i1.WhereExpressionBuilder<DrinkReferenceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DrinkReference.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DrinkReference.t;
}

class DrinkReferenceRepository {
  const DrinkReferenceRepository._();

  /// Returns a list of [DrinkReference]s matching the given query parameters.
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
  Future<List<DrinkReference>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrinkReferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrinkReferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrinkReferenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DrinkReference>(
      where: where?.call(DrinkReference.t),
      orderBy: orderBy?.call(DrinkReference.t),
      orderByList: orderByList?.call(DrinkReference.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DrinkReference] matching the given query parameters.
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
  Future<DrinkReference?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrinkReferenceTable>? where,
    int? offset,
    _i1.OrderByBuilder<DrinkReferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrinkReferenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DrinkReference>(
      where: where?.call(DrinkReference.t),
      orderBy: orderBy?.call(DrinkReference.t),
      orderByList: orderByList?.call(DrinkReference.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DrinkReference] by its [id] or null if no such row exists.
  Future<DrinkReference?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DrinkReference>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DrinkReference]s in the list and returns the inserted rows.
  ///
  /// The returned [DrinkReference]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DrinkReference>> insert(
    _i1.Session session,
    List<DrinkReference> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DrinkReference>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DrinkReference] and returns the inserted row.
  ///
  /// The returned [DrinkReference] will have its `id` field set.
  Future<DrinkReference> insertRow(
    _i1.Session session,
    DrinkReference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DrinkReference>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DrinkReference]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DrinkReference>> update(
    _i1.Session session,
    List<DrinkReference> rows, {
    _i1.ColumnSelections<DrinkReferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DrinkReference>(
      rows,
      columns: columns?.call(DrinkReference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrinkReference]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DrinkReference> updateRow(
    _i1.Session session,
    DrinkReference row, {
    _i1.ColumnSelections<DrinkReferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DrinkReference>(
      row,
      columns: columns?.call(DrinkReference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrinkReference] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DrinkReference?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<DrinkReferenceUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DrinkReference>(
      id,
      columnValues: columnValues(DrinkReference.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DrinkReference]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DrinkReference>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DrinkReferenceUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DrinkReferenceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrinkReferenceTable>? orderBy,
    _i1.OrderByListBuilder<DrinkReferenceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DrinkReference>(
      columnValues: columnValues(DrinkReference.t.updateTable),
      where: where(DrinkReference.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrinkReference.t),
      orderByList: orderByList?.call(DrinkReference.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DrinkReference]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DrinkReference>> delete(
    _i1.Session session,
    List<DrinkReference> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DrinkReference>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DrinkReference].
  Future<DrinkReference> deleteRow(
    _i1.Session session,
    DrinkReference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DrinkReference>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DrinkReference>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DrinkReferenceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DrinkReference>(
      where: where(DrinkReference.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrinkReferenceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DrinkReference>(
      where: where?.call(DrinkReference.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

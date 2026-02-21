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

/// Extended profile for an Adapt user.
/// References the Serverpod auth user via userId.
abstract class UserProfile
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserProfile._({
    this.id,
    required this.userId,
    this.name,
    required this.isGuest,
    this.age,
    this.biologicalSex,
    this.weightKg,
    this.heightCm,
    required this.weightUnit,
    required this.heightUnit,
    required this.goal,
    required this.eatingStyle,
    required this.alcoholHabit,
    required this.alcoholTracking,
    required this.morningRecap,
    required this.updatedAt,
  });

  factory UserProfile({
    int? id,
    required String userId,
    String? name,
    required bool isGuest,
    int? age,
    String? biologicalSex,
    double? weightKg,
    double? heightCm,
    required String weightUnit,
    required String heightUnit,
    required String goal,
    required String eatingStyle,
    required String alcoholHabit,
    required bool alcoholTracking,
    required bool morningRecap,
    required DateTime updatedAt,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      name: jsonSerialization['name'] as String?,
      isGuest: jsonSerialization['isGuest'] as bool,
      age: jsonSerialization['age'] as int?,
      biologicalSex: jsonSerialization['biologicalSex'] as String?,
      weightKg: (jsonSerialization['weightKg'] as num?)?.toDouble(),
      heightCm: (jsonSerialization['heightCm'] as num?)?.toDouble(),
      weightUnit: jsonSerialization['weightUnit'] as String,
      heightUnit: jsonSerialization['heightUnit'] as String,
      goal: jsonSerialization['goal'] as String,
      eatingStyle: jsonSerialization['eatingStyle'] as String,
      alcoholHabit: jsonSerialization['alcoholHabit'] as String,
      alcoholTracking: jsonSerialization['alcoholTracking'] as bool,
      morningRecap: jsonSerialization['morningRecap'] as bool,
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = UserProfileTable();

  static const db = UserProfileRepository._();

  @override
  int? id;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  String userId;

  /// Display name set during onboarding.
  String? name;

  /// Whether this user is in guest mode (no account).
  bool isGuest;

  /// Age in years.
  int? age;

  /// Biological sex: 'male' | 'female'
  String? biologicalSex;

  /// Weight stored in kg (SI). Never stores lbs.
  double? weightKg;

  /// Height stored in cm (SI). Never stores ft.
  double? heightCm;

  /// Display unit preference: 'kg' | 'lbs' — display only.
  String weightUnit;

  /// Display unit preference: 'cm' | 'ft' — display only.
  String heightUnit;

  /// Goal: 'lose_weight' | 'eat_better' | 'stay_aware'
  String goal;

  /// Eating style: 'home_cooked' | 'takeaway' | 'restaurants' | 'mixed'
  String eatingStyle;

  /// Alcohol habit: 'rarely' | 'sometimes' | 'often'
  String alcoholHabit;

  /// Whether to include alcohol in daily calorie total.
  bool alcoholTracking;

  /// Whether to send morning recap notifications.
  bool morningRecap;

  /// Last updated timestamp.
  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserProfile copyWith({
    int? id,
    String? userId,
    String? name,
    bool? isGuest,
    int? age,
    String? biologicalSex,
    double? weightKg,
    double? heightCm,
    String? weightUnit,
    String? heightUnit,
    String? goal,
    String? eatingStyle,
    String? alcoholHabit,
    bool? alcoholTracking,
    bool? morningRecap,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userId': userId,
      if (name != null) 'name': name,
      'isGuest': isGuest,
      if (age != null) 'age': age,
      if (biologicalSex != null) 'biologicalSex': biologicalSex,
      if (weightKg != null) 'weightKg': weightKg,
      if (heightCm != null) 'heightCm': heightCm,
      'weightUnit': weightUnit,
      'heightUnit': heightUnit,
      'goal': goal,
      'eatingStyle': eatingStyle,
      'alcoholHabit': alcoholHabit,
      'alcoholTracking': alcoholTracking,
      'morningRecap': morningRecap,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userId': userId,
      if (name != null) 'name': name,
      'isGuest': isGuest,
      if (age != null) 'age': age,
      if (biologicalSex != null) 'biologicalSex': biologicalSex,
      if (weightKg != null) 'weightKg': weightKg,
      if (heightCm != null) 'heightCm': heightCm,
      'weightUnit': weightUnit,
      'heightUnit': heightUnit,
      'goal': goal,
      'eatingStyle': eatingStyle,
      'alcoholHabit': alcoholHabit,
      'alcoholTracking': alcoholTracking,
      'morningRecap': morningRecap,
      'updatedAt': updatedAt.toJson(),
    };
  }

  static UserProfileInclude include() {
    return UserProfileInclude._();
  }

  static UserProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileTable>? orderByList,
    UserProfileInclude? include,
  }) {
    return UserProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserProfile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required String userId,
    String? name,
    required bool isGuest,
    int? age,
    String? biologicalSex,
    double? weightKg,
    double? heightCm,
    required String weightUnit,
    required String heightUnit,
    required String goal,
    required String eatingStyle,
    required String alcoholHabit,
    required bool alcoholTracking,
    required bool morningRecap,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         name: name,
         isGuest: isGuest,
         age: age,
         biologicalSex: biologicalSex,
         weightKg: weightKg,
         heightCm: heightCm,
         weightUnit: weightUnit,
         heightUnit: heightUnit,
         goal: goal,
         eatingStyle: eatingStyle,
         alcoholHabit: alcoholHabit,
         alcoholTracking: alcoholTracking,
         morningRecap: morningRecap,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    String? userId,
    Object? name = _Undefined,
    bool? isGuest,
    Object? age = _Undefined,
    Object? biologicalSex = _Undefined,
    Object? weightKg = _Undefined,
    Object? heightCm = _Undefined,
    String? weightUnit,
    String? heightUnit,
    String? goal,
    String? eatingStyle,
    String? alcoholHabit,
    bool? alcoholTracking,
    bool? morningRecap,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name is String? ? name : this.name,
      isGuest: isGuest ?? this.isGuest,
      age: age is int? ? age : this.age,
      biologicalSex: biologicalSex is String?
          ? biologicalSex
          : this.biologicalSex,
      weightKg: weightKg is double? ? weightKg : this.weightKg,
      heightCm: heightCm is double? ? heightCm : this.heightCm,
      weightUnit: weightUnit ?? this.weightUnit,
      heightUnit: heightUnit ?? this.heightUnit,
      goal: goal ?? this.goal,
      eatingStyle: eatingStyle ?? this.eatingStyle,
      alcoholHabit: alcoholHabit ?? this.alcoholHabit,
      alcoholTracking: alcoholTracking ?? this.alcoholTracking,
      morningRecap: morningRecap ?? this.morningRecap,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class UserProfileUpdateTable extends _i1.UpdateTable<UserProfileTable> {
  UserProfileUpdateTable(super.table);

  _i1.ColumnValue<String, String> userId(String value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> name(String? value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<bool, bool> isGuest(bool value) => _i1.ColumnValue(
    table.isGuest,
    value,
  );

  _i1.ColumnValue<int, int> age(int? value) => _i1.ColumnValue(
    table.age,
    value,
  );

  _i1.ColumnValue<String, String> biologicalSex(String? value) =>
      _i1.ColumnValue(
        table.biologicalSex,
        value,
      );

  _i1.ColumnValue<double, double> weightKg(double? value) => _i1.ColumnValue(
    table.weightKg,
    value,
  );

  _i1.ColumnValue<double, double> heightCm(double? value) => _i1.ColumnValue(
    table.heightCm,
    value,
  );

  _i1.ColumnValue<String, String> weightUnit(String value) => _i1.ColumnValue(
    table.weightUnit,
    value,
  );

  _i1.ColumnValue<String, String> heightUnit(String value) => _i1.ColumnValue(
    table.heightUnit,
    value,
  );

  _i1.ColumnValue<String, String> goal(String value) => _i1.ColumnValue(
    table.goal,
    value,
  );

  _i1.ColumnValue<String, String> eatingStyle(String value) => _i1.ColumnValue(
    table.eatingStyle,
    value,
  );

  _i1.ColumnValue<String, String> alcoholHabit(String value) => _i1.ColumnValue(
    table.alcoholHabit,
    value,
  );

  _i1.ColumnValue<bool, bool> alcoholTracking(bool value) => _i1.ColumnValue(
    table.alcoholTracking,
    value,
  );

  _i1.ColumnValue<bool, bool> morningRecap(bool value) => _i1.ColumnValue(
    table.morningRecap,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class UserProfileTable extends _i1.Table<int?> {
  UserProfileTable({super.tableRelation}) : super(tableName: 'user_profiles') {
    updateTable = UserProfileUpdateTable(this);
    userId = _i1.ColumnString(
      'userId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    isGuest = _i1.ColumnBool(
      'isGuest',
      this,
    );
    age = _i1.ColumnInt(
      'age',
      this,
    );
    biologicalSex = _i1.ColumnString(
      'biologicalSex',
      this,
    );
    weightKg = _i1.ColumnDouble(
      'weightKg',
      this,
    );
    heightCm = _i1.ColumnDouble(
      'heightCm',
      this,
    );
    weightUnit = _i1.ColumnString(
      'weightUnit',
      this,
    );
    heightUnit = _i1.ColumnString(
      'heightUnit',
      this,
    );
    goal = _i1.ColumnString(
      'goal',
      this,
    );
    eatingStyle = _i1.ColumnString(
      'eatingStyle',
      this,
    );
    alcoholHabit = _i1.ColumnString(
      'alcoholHabit',
      this,
    );
    alcoholTracking = _i1.ColumnBool(
      'alcoholTracking',
      this,
    );
    morningRecap = _i1.ColumnBool(
      'morningRecap',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final UserProfileUpdateTable updateTable;

  /// Serverpod auth userIdentifier — UUID string from AuthenticationInfo.
  late final _i1.ColumnString userId;

  /// Display name set during onboarding.
  late final _i1.ColumnString name;

  /// Whether this user is in guest mode (no account).
  late final _i1.ColumnBool isGuest;

  /// Age in years.
  late final _i1.ColumnInt age;

  /// Biological sex: 'male' | 'female'
  late final _i1.ColumnString biologicalSex;

  /// Weight stored in kg (SI). Never stores lbs.
  late final _i1.ColumnDouble weightKg;

  /// Height stored in cm (SI). Never stores ft.
  late final _i1.ColumnDouble heightCm;

  /// Display unit preference: 'kg' | 'lbs' — display only.
  late final _i1.ColumnString weightUnit;

  /// Display unit preference: 'cm' | 'ft' — display only.
  late final _i1.ColumnString heightUnit;

  /// Goal: 'lose_weight' | 'eat_better' | 'stay_aware'
  late final _i1.ColumnString goal;

  /// Eating style: 'home_cooked' | 'takeaway' | 'restaurants' | 'mixed'
  late final _i1.ColumnString eatingStyle;

  /// Alcohol habit: 'rarely' | 'sometimes' | 'often'
  late final _i1.ColumnString alcoholHabit;

  /// Whether to include alcohol in daily calorie total.
  late final _i1.ColumnBool alcoholTracking;

  /// Whether to send morning recap notifications.
  late final _i1.ColumnBool morningRecap;

  /// Last updated timestamp.
  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    name,
    isGuest,
    age,
    biologicalSex,
    weightKg,
    heightCm,
    weightUnit,
    heightUnit,
    goal,
    eatingStyle,
    alcoholHabit,
    alcoholTracking,
    morningRecap,
    updatedAt,
  ];
}

class UserProfileInclude extends _i1.IncludeObject {
  UserProfileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserProfile.t;
}

class UserProfileIncludeList extends _i1.IncludeList {
  UserProfileIncludeList._({
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserProfile.t;
}

class UserProfileRepository {
  const UserProfileRepository._();

  /// Returns a list of [UserProfile]s matching the given query parameters.
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
  Future<List<UserProfile>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserProfile>(
      where: where?.call(UserProfile.t),
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserProfile] matching the given query parameters.
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
  Future<UserProfile?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserProfile>(
      where: where?.call(UserProfile.t),
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserProfile] by its [id] or null if no such row exists.
  Future<UserProfile?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserProfile>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [UserProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserProfile>> insert(
    _i1.Session session,
    List<UserProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserProfile] and returns the inserted row.
  ///
  /// The returned [UserProfile] will have its `id` field set.
  Future<UserProfile> insertRow(
    _i1.Session session,
    UserProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserProfile>> update(
    _i1.Session session,
    List<UserProfile> rows, {
    _i1.ColumnSelections<UserProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserProfile>(
      rows,
      columns: columns?.call(UserProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserProfile> updateRow(
    _i1.Session session,
    UserProfile row, {
    _i1.ColumnSelections<UserProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserProfile>(
      row,
      columns: columns?.call(UserProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserProfile?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserProfileUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserProfile>(
      id,
      columnValues: columnValues(UserProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserProfile>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserProfileUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserProfileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileTable>? orderBy,
    _i1.OrderByListBuilder<UserProfileTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserProfile>(
      columnValues: columnValues(UserProfile.t.updateTable),
      where: where(UserProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserProfile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserProfile>> delete(
    _i1.Session session,
    List<UserProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserProfile].
  Future<UserProfile> deleteRow(
    _i1.Session session,
    UserProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserProfile>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserProfileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserProfile>(
      where: where(UserProfile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserProfile>(
      where: where?.call(UserProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

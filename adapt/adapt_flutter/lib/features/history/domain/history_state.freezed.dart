// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WeekState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<DailySummary> summaries) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<DailySummary> summaries)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<DailySummary> summaries)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeekLoading value) loading,
    required TResult Function(_WeekSuccess value) success,
    required TResult Function(_WeekError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeekLoading value)? loading,
    TResult? Function(_WeekSuccess value)? success,
    TResult? Function(_WeekError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeekLoading value)? loading,
    TResult Function(_WeekSuccess value)? success,
    TResult Function(_WeekError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekStateCopyWith<$Res> {
  factory $WeekStateCopyWith(WeekState value, $Res Function(WeekState) then) =
      _$WeekStateCopyWithImpl<$Res, WeekState>;
}

/// @nodoc
class _$WeekStateCopyWithImpl<$Res, $Val extends WeekState>
    implements $WeekStateCopyWith<$Res> {
  _$WeekStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WeekLoadingImplCopyWith<$Res> {
  factory _$$WeekLoadingImplCopyWith(
    _$WeekLoadingImpl value,
    $Res Function(_$WeekLoadingImpl) then,
  ) = __$$WeekLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeekLoadingImplCopyWithImpl<$Res>
    extends _$WeekStateCopyWithImpl<$Res, _$WeekLoadingImpl>
    implements _$$WeekLoadingImplCopyWith<$Res> {
  __$$WeekLoadingImplCopyWithImpl(
    _$WeekLoadingImpl _value,
    $Res Function(_$WeekLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeekLoadingImpl implements _WeekLoading {
  const _$WeekLoadingImpl();

  @override
  String toString() {
    return 'WeekState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeekLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<DailySummary> summaries) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<DailySummary> summaries)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<DailySummary> summaries)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeekLoading value) loading,
    required TResult Function(_WeekSuccess value) success,
    required TResult Function(_WeekError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeekLoading value)? loading,
    TResult? Function(_WeekSuccess value)? success,
    TResult? Function(_WeekError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeekLoading value)? loading,
    TResult Function(_WeekSuccess value)? success,
    TResult Function(_WeekError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _WeekLoading implements WeekState {
  const factory _WeekLoading() = _$WeekLoadingImpl;
}

/// @nodoc
abstract class _$$WeekSuccessImplCopyWith<$Res> {
  factory _$$WeekSuccessImplCopyWith(
    _$WeekSuccessImpl value,
    $Res Function(_$WeekSuccessImpl) then,
  ) = __$$WeekSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DailySummary> summaries});
}

/// @nodoc
class __$$WeekSuccessImplCopyWithImpl<$Res>
    extends _$WeekStateCopyWithImpl<$Res, _$WeekSuccessImpl>
    implements _$$WeekSuccessImplCopyWith<$Res> {
  __$$WeekSuccessImplCopyWithImpl(
    _$WeekSuccessImpl _value,
    $Res Function(_$WeekSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? summaries = null}) {
    return _then(
      _$WeekSuccessImpl(
        null == summaries
            ? _value._summaries
            : summaries // ignore: cast_nullable_to_non_nullable
                  as List<DailySummary>,
      ),
    );
  }
}

/// @nodoc

class _$WeekSuccessImpl implements _WeekSuccess {
  const _$WeekSuccessImpl(final List<DailySummary> summaries)
    : _summaries = summaries;

  final List<DailySummary> _summaries;
  @override
  List<DailySummary> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  String toString() {
    return 'WeekState.success(summaries: $summaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekSuccessImpl &&
            const DeepCollectionEquality().equals(
              other._summaries,
              _summaries,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_summaries));

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekSuccessImplCopyWith<_$WeekSuccessImpl> get copyWith =>
      __$$WeekSuccessImplCopyWithImpl<_$WeekSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<DailySummary> summaries) success,
    required TResult Function(String message) error,
  }) {
    return success(summaries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<DailySummary> summaries)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(summaries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<DailySummary> summaries)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(summaries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeekLoading value) loading,
    required TResult Function(_WeekSuccess value) success,
    required TResult Function(_WeekError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeekLoading value)? loading,
    TResult? Function(_WeekSuccess value)? success,
    TResult? Function(_WeekError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeekLoading value)? loading,
    TResult Function(_WeekSuccess value)? success,
    TResult Function(_WeekError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _WeekSuccess implements WeekState {
  const factory _WeekSuccess(final List<DailySummary> summaries) =
      _$WeekSuccessImpl;

  List<DailySummary> get summaries;

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekSuccessImplCopyWith<_$WeekSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeekErrorImplCopyWith<$Res> {
  factory _$$WeekErrorImplCopyWith(
    _$WeekErrorImpl value,
    $Res Function(_$WeekErrorImpl) then,
  ) = __$$WeekErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$WeekErrorImplCopyWithImpl<$Res>
    extends _$WeekStateCopyWithImpl<$Res, _$WeekErrorImpl>
    implements _$$WeekErrorImplCopyWith<$Res> {
  __$$WeekErrorImplCopyWithImpl(
    _$WeekErrorImpl _value,
    $Res Function(_$WeekErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$WeekErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$WeekErrorImpl implements _WeekError {
  const _$WeekErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WeekState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekErrorImplCopyWith<_$WeekErrorImpl> get copyWith =>
      __$$WeekErrorImplCopyWithImpl<_$WeekErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<DailySummary> summaries) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<DailySummary> summaries)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<DailySummary> summaries)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeekLoading value) loading,
    required TResult Function(_WeekSuccess value) success,
    required TResult Function(_WeekError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeekLoading value)? loading,
    TResult? Function(_WeekSuccess value)? success,
    TResult? Function(_WeekError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeekLoading value)? loading,
    TResult Function(_WeekSuccess value)? success,
    TResult Function(_WeekError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _WeekError implements WeekState {
  const factory _WeekError(final String message) = _$WeekErrorImpl;

  String get message;

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekErrorImplCopyWith<_$WeekErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

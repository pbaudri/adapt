// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DayDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DayDetail detail) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DayDetail detail)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DayDetail detail)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DayDetailInitial value) initial,
    required TResult Function(_DayDetailLoading value) loading,
    required TResult Function(_DayDetailSuccess value) success,
    required TResult Function(_DayDetailError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DayDetailInitial value)? initial,
    TResult? Function(_DayDetailLoading value)? loading,
    TResult? Function(_DayDetailSuccess value)? success,
    TResult? Function(_DayDetailError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DayDetailInitial value)? initial,
    TResult Function(_DayDetailLoading value)? loading,
    TResult Function(_DayDetailSuccess value)? success,
    TResult Function(_DayDetailError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayDetailStateCopyWith<$Res> {
  factory $DayDetailStateCopyWith(
    DayDetailState value,
    $Res Function(DayDetailState) then,
  ) = _$DayDetailStateCopyWithImpl<$Res, DayDetailState>;
}

/// @nodoc
class _$DayDetailStateCopyWithImpl<$Res, $Val extends DayDetailState>
    implements $DayDetailStateCopyWith<$Res> {
  _$DayDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DayDetailInitialImplCopyWith<$Res> {
  factory _$$DayDetailInitialImplCopyWith(
    _$DayDetailInitialImpl value,
    $Res Function(_$DayDetailInitialImpl) then,
  ) = __$$DayDetailInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DayDetailInitialImplCopyWithImpl<$Res>
    extends _$DayDetailStateCopyWithImpl<$Res, _$DayDetailInitialImpl>
    implements _$$DayDetailInitialImplCopyWith<$Res> {
  __$$DayDetailInitialImplCopyWithImpl(
    _$DayDetailInitialImpl _value,
    $Res Function(_$DayDetailInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DayDetailInitialImpl implements _DayDetailInitial {
  const _$DayDetailInitialImpl();

  @override
  String toString() {
    return 'DayDetailState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DayDetailInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DayDetail detail) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DayDetail detail)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DayDetail detail)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DayDetailInitial value) initial,
    required TResult Function(_DayDetailLoading value) loading,
    required TResult Function(_DayDetailSuccess value) success,
    required TResult Function(_DayDetailError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DayDetailInitial value)? initial,
    TResult? Function(_DayDetailLoading value)? loading,
    TResult? Function(_DayDetailSuccess value)? success,
    TResult? Function(_DayDetailError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DayDetailInitial value)? initial,
    TResult Function(_DayDetailLoading value)? loading,
    TResult Function(_DayDetailSuccess value)? success,
    TResult Function(_DayDetailError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DayDetailInitial implements DayDetailState {
  const factory _DayDetailInitial() = _$DayDetailInitialImpl;
}

/// @nodoc
abstract class _$$DayDetailLoadingImplCopyWith<$Res> {
  factory _$$DayDetailLoadingImplCopyWith(
    _$DayDetailLoadingImpl value,
    $Res Function(_$DayDetailLoadingImpl) then,
  ) = __$$DayDetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DayDetailLoadingImplCopyWithImpl<$Res>
    extends _$DayDetailStateCopyWithImpl<$Res, _$DayDetailLoadingImpl>
    implements _$$DayDetailLoadingImplCopyWith<$Res> {
  __$$DayDetailLoadingImplCopyWithImpl(
    _$DayDetailLoadingImpl _value,
    $Res Function(_$DayDetailLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DayDetailLoadingImpl implements _DayDetailLoading {
  const _$DayDetailLoadingImpl();

  @override
  String toString() {
    return 'DayDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DayDetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DayDetail detail) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DayDetail detail)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DayDetail detail)? success,
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
    required TResult Function(_DayDetailInitial value) initial,
    required TResult Function(_DayDetailLoading value) loading,
    required TResult Function(_DayDetailSuccess value) success,
    required TResult Function(_DayDetailError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DayDetailInitial value)? initial,
    TResult? Function(_DayDetailLoading value)? loading,
    TResult? Function(_DayDetailSuccess value)? success,
    TResult? Function(_DayDetailError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DayDetailInitial value)? initial,
    TResult Function(_DayDetailLoading value)? loading,
    TResult Function(_DayDetailSuccess value)? success,
    TResult Function(_DayDetailError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DayDetailLoading implements DayDetailState {
  const factory _DayDetailLoading() = _$DayDetailLoadingImpl;
}

/// @nodoc
abstract class _$$DayDetailSuccessImplCopyWith<$Res> {
  factory _$$DayDetailSuccessImplCopyWith(
    _$DayDetailSuccessImpl value,
    $Res Function(_$DayDetailSuccessImpl) then,
  ) = __$$DayDetailSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DayDetail detail});
}

/// @nodoc
class __$$DayDetailSuccessImplCopyWithImpl<$Res>
    extends _$DayDetailStateCopyWithImpl<$Res, _$DayDetailSuccessImpl>
    implements _$$DayDetailSuccessImplCopyWith<$Res> {
  __$$DayDetailSuccessImplCopyWithImpl(
    _$DayDetailSuccessImpl _value,
    $Res Function(_$DayDetailSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? detail = null}) {
    return _then(
      _$DayDetailSuccessImpl(
        null == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as DayDetail,
      ),
    );
  }
}

/// @nodoc

class _$DayDetailSuccessImpl implements _DayDetailSuccess {
  const _$DayDetailSuccessImpl(this.detail);

  @override
  final DayDetail detail;

  @override
  String toString() {
    return 'DayDetailState.success(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayDetailSuccessImpl &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail);

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayDetailSuccessImplCopyWith<_$DayDetailSuccessImpl> get copyWith =>
      __$$DayDetailSuccessImplCopyWithImpl<_$DayDetailSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DayDetail detail) success,
    required TResult Function(String message) error,
  }) {
    return success(detail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DayDetail detail)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(detail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DayDetail detail)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DayDetailInitial value) initial,
    required TResult Function(_DayDetailLoading value) loading,
    required TResult Function(_DayDetailSuccess value) success,
    required TResult Function(_DayDetailError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DayDetailInitial value)? initial,
    TResult? Function(_DayDetailLoading value)? loading,
    TResult? Function(_DayDetailSuccess value)? success,
    TResult? Function(_DayDetailError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DayDetailInitial value)? initial,
    TResult Function(_DayDetailLoading value)? loading,
    TResult Function(_DayDetailSuccess value)? success,
    TResult Function(_DayDetailError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DayDetailSuccess implements DayDetailState {
  const factory _DayDetailSuccess(final DayDetail detail) =
      _$DayDetailSuccessImpl;

  DayDetail get detail;

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayDetailSuccessImplCopyWith<_$DayDetailSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DayDetailErrorImplCopyWith<$Res> {
  factory _$$DayDetailErrorImplCopyWith(
    _$DayDetailErrorImpl value,
    $Res Function(_$DayDetailErrorImpl) then,
  ) = __$$DayDetailErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DayDetailErrorImplCopyWithImpl<$Res>
    extends _$DayDetailStateCopyWithImpl<$Res, _$DayDetailErrorImpl>
    implements _$$DayDetailErrorImplCopyWith<$Res> {
  __$$DayDetailErrorImplCopyWithImpl(
    _$DayDetailErrorImpl _value,
    $Res Function(_$DayDetailErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$DayDetailErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DayDetailErrorImpl implements _DayDetailError {
  const _$DayDetailErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DayDetailState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayDetailErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayDetailErrorImplCopyWith<_$DayDetailErrorImpl> get copyWith =>
      __$$DayDetailErrorImplCopyWithImpl<_$DayDetailErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DayDetail detail) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DayDetail detail)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DayDetail detail)? success,
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
    required TResult Function(_DayDetailInitial value) initial,
    required TResult Function(_DayDetailLoading value) loading,
    required TResult Function(_DayDetailSuccess value) success,
    required TResult Function(_DayDetailError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DayDetailInitial value)? initial,
    TResult? Function(_DayDetailLoading value)? loading,
    TResult? Function(_DayDetailSuccess value)? success,
    TResult? Function(_DayDetailError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DayDetailInitial value)? initial,
    TResult Function(_DayDetailLoading value)? loading,
    TResult Function(_DayDetailSuccess value)? success,
    TResult Function(_DayDetailError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _DayDetailError implements DayDetailState {
  const factory _DayDetailError(final String message) = _$DayDetailErrorImpl;

  String get message;

  /// Create a copy of DayDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayDetailErrorImplCopyWith<_$DayDetailErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

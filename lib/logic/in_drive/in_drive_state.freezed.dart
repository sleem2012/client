// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_drive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InDriveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cost) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cost)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cost)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InDriveStateInitial value) initial,
    required TResult Function(InDriveStateLoading value) loading,
    required TResult Function(InDriveStateSuccess value) success,
    required TResult Function(InDriveStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InDriveStateInitial value)? initial,
    TResult? Function(InDriveStateLoading value)? loading,
    TResult? Function(InDriveStateSuccess value)? success,
    TResult? Function(InDriveStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InDriveStateInitial value)? initial,
    TResult Function(InDriveStateLoading value)? loading,
    TResult Function(InDriveStateSuccess value)? success,
    TResult Function(InDriveStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InDriveStateCopyWith<$Res> {
  factory $InDriveStateCopyWith(
          InDriveState value, $Res Function(InDriveState) then) =
      _$InDriveStateCopyWithImpl<$Res, InDriveState>;
}

/// @nodoc
class _$InDriveStateCopyWithImpl<$Res, $Val extends InDriveState>
    implements $InDriveStateCopyWith<$Res> {
  _$InDriveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InDriveStateInitialCopyWith<$Res> {
  factory _$$InDriveStateInitialCopyWith(_$InDriveStateInitial value,
          $Res Function(_$InDriveStateInitial) then) =
      __$$InDriveStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InDriveStateInitialCopyWithImpl<$Res>
    extends _$InDriveStateCopyWithImpl<$Res, _$InDriveStateInitial>
    implements _$$InDriveStateInitialCopyWith<$Res> {
  __$$InDriveStateInitialCopyWithImpl(
      _$InDriveStateInitial _value, $Res Function(_$InDriveStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InDriveStateInitial implements InDriveStateInitial {
  const _$InDriveStateInitial();

  @override
  String toString() {
    return 'InDriveState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InDriveStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cost) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cost)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cost)? success,
    TResult Function(String error)? error,
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
    required TResult Function(InDriveStateInitial value) initial,
    required TResult Function(InDriveStateLoading value) loading,
    required TResult Function(InDriveStateSuccess value) success,
    required TResult Function(InDriveStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InDriveStateInitial value)? initial,
    TResult? Function(InDriveStateLoading value)? loading,
    TResult? Function(InDriveStateSuccess value)? success,
    TResult? Function(InDriveStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InDriveStateInitial value)? initial,
    TResult Function(InDriveStateLoading value)? loading,
    TResult Function(InDriveStateSuccess value)? success,
    TResult Function(InDriveStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InDriveStateInitial implements InDriveState {
  const factory InDriveStateInitial() = _$InDriveStateInitial;
}

/// @nodoc
abstract class _$$InDriveStateLoadingCopyWith<$Res> {
  factory _$$InDriveStateLoadingCopyWith(_$InDriveStateLoading value,
          $Res Function(_$InDriveStateLoading) then) =
      __$$InDriveStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InDriveStateLoadingCopyWithImpl<$Res>
    extends _$InDriveStateCopyWithImpl<$Res, _$InDriveStateLoading>
    implements _$$InDriveStateLoadingCopyWith<$Res> {
  __$$InDriveStateLoadingCopyWithImpl(
      _$InDriveStateLoading _value, $Res Function(_$InDriveStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InDriveStateLoading implements InDriveStateLoading {
  const _$InDriveStateLoading();

  @override
  String toString() {
    return 'InDriveState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InDriveStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cost) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cost)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cost)? success,
    TResult Function(String error)? error,
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
    required TResult Function(InDriveStateInitial value) initial,
    required TResult Function(InDriveStateLoading value) loading,
    required TResult Function(InDriveStateSuccess value) success,
    required TResult Function(InDriveStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InDriveStateInitial value)? initial,
    TResult? Function(InDriveStateLoading value)? loading,
    TResult? Function(InDriveStateSuccess value)? success,
    TResult? Function(InDriveStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InDriveStateInitial value)? initial,
    TResult Function(InDriveStateLoading value)? loading,
    TResult Function(InDriveStateSuccess value)? success,
    TResult Function(InDriveStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InDriveStateLoading implements InDriveState {
  const factory InDriveStateLoading() = _$InDriveStateLoading;
}

/// @nodoc
abstract class _$$InDriveStateSuccessCopyWith<$Res> {
  factory _$$InDriveStateSuccessCopyWith(_$InDriveStateSuccess value,
          $Res Function(_$InDriveStateSuccess) then) =
      __$$InDriveStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String cost});
}

/// @nodoc
class __$$InDriveStateSuccessCopyWithImpl<$Res>
    extends _$InDriveStateCopyWithImpl<$Res, _$InDriveStateSuccess>
    implements _$$InDriveStateSuccessCopyWith<$Res> {
  __$$InDriveStateSuccessCopyWithImpl(
      _$InDriveStateSuccess _value, $Res Function(_$InDriveStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cost = null,
  }) {
    return _then(_$InDriveStateSuccess(
      null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InDriveStateSuccess implements InDriveStateSuccess {
  const _$InDriveStateSuccess(this.cost);

  @override
  final String cost;

  @override
  String toString() {
    return 'InDriveState.success(cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InDriveStateSuccess &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InDriveStateSuccessCopyWith<_$InDriveStateSuccess> get copyWith =>
      __$$InDriveStateSuccessCopyWithImpl<_$InDriveStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cost) success,
    required TResult Function(String error) error,
  }) {
    return success(cost);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cost)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(cost);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cost)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(cost);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InDriveStateInitial value) initial,
    required TResult Function(InDriveStateLoading value) loading,
    required TResult Function(InDriveStateSuccess value) success,
    required TResult Function(InDriveStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InDriveStateInitial value)? initial,
    TResult? Function(InDriveStateLoading value)? loading,
    TResult? Function(InDriveStateSuccess value)? success,
    TResult? Function(InDriveStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InDriveStateInitial value)? initial,
    TResult Function(InDriveStateLoading value)? loading,
    TResult Function(InDriveStateSuccess value)? success,
    TResult Function(InDriveStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class InDriveStateSuccess implements InDriveState {
  const factory InDriveStateSuccess(final String cost) = _$InDriveStateSuccess;

  String get cost;
  @JsonKey(ignore: true)
  _$$InDriveStateSuccessCopyWith<_$InDriveStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InDriveStateErrorCopyWith<$Res> {
  factory _$$InDriveStateErrorCopyWith(
          _$InDriveStateError value, $Res Function(_$InDriveStateError) then) =
      __$$InDriveStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$InDriveStateErrorCopyWithImpl<$Res>
    extends _$InDriveStateCopyWithImpl<$Res, _$InDriveStateError>
    implements _$$InDriveStateErrorCopyWith<$Res> {
  __$$InDriveStateErrorCopyWithImpl(
      _$InDriveStateError _value, $Res Function(_$InDriveStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$InDriveStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InDriveStateError implements InDriveStateError {
  const _$InDriveStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'InDriveState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InDriveStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InDriveStateErrorCopyWith<_$InDriveStateError> get copyWith =>
      __$$InDriveStateErrorCopyWithImpl<_$InDriveStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cost) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cost)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cost)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InDriveStateInitial value) initial,
    required TResult Function(InDriveStateLoading value) loading,
    required TResult Function(InDriveStateSuccess value) success,
    required TResult Function(InDriveStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InDriveStateInitial value)? initial,
    TResult? Function(InDriveStateLoading value)? loading,
    TResult? Function(InDriveStateSuccess value)? success,
    TResult? Function(InDriveStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InDriveStateInitial value)? initial,
    TResult Function(InDriveStateLoading value)? loading,
    TResult Function(InDriveStateSuccess value)? success,
    TResult Function(InDriveStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InDriveStateError implements InDriveState {
  const factory InDriveStateError({required final String error}) =
      _$InDriveStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$InDriveStateErrorCopyWith<_$InDriveStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

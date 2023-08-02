// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServicesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? force) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? force)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? force)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServicesStateLoading value) loading,
    required TResult Function(ServicesStateSuccess value) success,
    required TResult Function(ServicesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServicesStateLoading value)? loading,
    TResult? Function(ServicesStateSuccess value)? success,
    TResult? Function(ServicesStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServicesStateLoading value)? loading,
    TResult Function(ServicesStateSuccess value)? success,
    TResult Function(ServicesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res, ServicesState>;
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res, $Val extends ServicesState>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServicesStateLoadingCopyWith<$Res> {
  factory _$$ServicesStateLoadingCopyWith(_$ServicesStateLoading value,
          $Res Function(_$ServicesStateLoading) then) =
      __$$ServicesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServicesStateLoadingCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$ServicesStateLoading>
    implements _$$ServicesStateLoadingCopyWith<$Res> {
  __$$ServicesStateLoadingCopyWithImpl(_$ServicesStateLoading _value,
      $Res Function(_$ServicesStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServicesStateLoading implements ServicesStateLoading {
  const _$ServicesStateLoading();

  @override
  String toString() {
    return 'ServicesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServicesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? force) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? force)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? force)? success,
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
    required TResult Function(ServicesStateLoading value) loading,
    required TResult Function(ServicesStateSuccess value) success,
    required TResult Function(ServicesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServicesStateLoading value)? loading,
    TResult? Function(ServicesStateSuccess value)? success,
    TResult? Function(ServicesStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServicesStateLoading value)? loading,
    TResult Function(ServicesStateSuccess value)? success,
    TResult Function(ServicesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ServicesStateLoading implements ServicesState {
  const factory ServicesStateLoading() = _$ServicesStateLoading;
}

/// @nodoc
abstract class _$$ServicesStateSuccessCopyWith<$Res> {
  factory _$$ServicesStateSuccessCopyWith(_$ServicesStateSuccess value,
          $Res Function(_$ServicesStateSuccess) then) =
      __$$ServicesStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String? force});
}

/// @nodoc
class __$$ServicesStateSuccessCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$ServicesStateSuccess>
    implements _$$ServicesStateSuccessCopyWith<$Res> {
  __$$ServicesStateSuccessCopyWithImpl(_$ServicesStateSuccess _value,
      $Res Function(_$ServicesStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? force = freezed,
  }) {
    return _then(_$ServicesStateSuccess(
      force: freezed == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServicesStateSuccess implements ServicesStateSuccess {
  const _$ServicesStateSuccess({this.force});

  @override
  final String? force;

  @override
  String toString() {
    return 'ServicesState.success(force: $force)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesStateSuccess &&
            (identical(other.force, force) || other.force == force));
  }

  @override
  int get hashCode => Object.hash(runtimeType, force);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesStateSuccessCopyWith<_$ServicesStateSuccess> get copyWith =>
      __$$ServicesStateSuccessCopyWithImpl<_$ServicesStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? force) success,
    required TResult Function(String error) error,
  }) {
    return success(force);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? force)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(force);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? force)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(force);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServicesStateLoading value) loading,
    required TResult Function(ServicesStateSuccess value) success,
    required TResult Function(ServicesStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServicesStateLoading value)? loading,
    TResult? Function(ServicesStateSuccess value)? success,
    TResult? Function(ServicesStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServicesStateLoading value)? loading,
    TResult Function(ServicesStateSuccess value)? success,
    TResult Function(ServicesStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ServicesStateSuccess implements ServicesState {
  const factory ServicesStateSuccess({final String? force}) =
      _$ServicesStateSuccess;

  String? get force;
  @JsonKey(ignore: true)
  _$$ServicesStateSuccessCopyWith<_$ServicesStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServicesStateErrorCopyWith<$Res> {
  factory _$$ServicesStateErrorCopyWith(_$ServicesStateError value,
          $Res Function(_$ServicesStateError) then) =
      __$$ServicesStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ServicesStateErrorCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$ServicesStateError>
    implements _$$ServicesStateErrorCopyWith<$Res> {
  __$$ServicesStateErrorCopyWithImpl(
      _$ServicesStateError _value, $Res Function(_$ServicesStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ServicesStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServicesStateError implements ServicesStateError {
  const _$ServicesStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ServicesState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesStateErrorCopyWith<_$ServicesStateError> get copyWith =>
      __$$ServicesStateErrorCopyWithImpl<_$ServicesStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? force) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? force)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? force)? success,
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
    required TResult Function(ServicesStateLoading value) loading,
    required TResult Function(ServicesStateSuccess value) success,
    required TResult Function(ServicesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServicesStateLoading value)? loading,
    TResult? Function(ServicesStateSuccess value)? success,
    TResult? Function(ServicesStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServicesStateLoading value)? loading,
    TResult Function(ServicesStateSuccess value)? success,
    TResult Function(ServicesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ServicesStateError implements ServicesState {
  const factory ServicesStateError({required final String error}) =
      _$ServicesStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ServicesStateErrorCopyWith<_$ServicesStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

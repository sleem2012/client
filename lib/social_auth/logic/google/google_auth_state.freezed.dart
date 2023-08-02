// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleAuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleAuthStateLoading value) loading,
    required TResult Function(GoogleAuthStateInitial value) initial,
    required TResult Function(GoogleAuthStateSuccess value) success,
    required TResult Function(GoogleAuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleAuthStateLoading value)? loading,
    TResult? Function(GoogleAuthStateInitial value)? initial,
    TResult? Function(GoogleAuthStateSuccess value)? success,
    TResult? Function(GoogleAuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleAuthStateLoading value)? loading,
    TResult Function(GoogleAuthStateInitial value)? initial,
    TResult Function(GoogleAuthStateSuccess value)? success,
    TResult Function(GoogleAuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthStateCopyWith<$Res> {
  factory $GoogleAuthStateCopyWith(
          GoogleAuthState value, $Res Function(GoogleAuthState) then) =
      _$GoogleAuthStateCopyWithImpl<$Res, GoogleAuthState>;
}

/// @nodoc
class _$GoogleAuthStateCopyWithImpl<$Res, $Val extends GoogleAuthState>
    implements $GoogleAuthStateCopyWith<$Res> {
  _$GoogleAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GoogleAuthStateLoadingCopyWith<$Res> {
  factory _$$GoogleAuthStateLoadingCopyWith(_$GoogleAuthStateLoading value,
          $Res Function(_$GoogleAuthStateLoading) then) =
      __$$GoogleAuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleAuthStateLoadingCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$GoogleAuthStateLoading>
    implements _$$GoogleAuthStateLoadingCopyWith<$Res> {
  __$$GoogleAuthStateLoadingCopyWithImpl(_$GoogleAuthStateLoading _value,
      $Res Function(_$GoogleAuthStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleAuthStateLoading implements GoogleAuthStateLoading {
  const _$GoogleAuthStateLoading();

  @override
  String toString() {
    return 'GoogleAuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleAuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? success,
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
    required TResult Function(GoogleAuthStateLoading value) loading,
    required TResult Function(GoogleAuthStateInitial value) initial,
    required TResult Function(GoogleAuthStateSuccess value) success,
    required TResult Function(GoogleAuthStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleAuthStateLoading value)? loading,
    TResult? Function(GoogleAuthStateInitial value)? initial,
    TResult? Function(GoogleAuthStateSuccess value)? success,
    TResult? Function(GoogleAuthStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleAuthStateLoading value)? loading,
    TResult Function(GoogleAuthStateInitial value)? initial,
    TResult Function(GoogleAuthStateSuccess value)? success,
    TResult Function(GoogleAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthStateLoading implements GoogleAuthState {
  const factory GoogleAuthStateLoading() = _$GoogleAuthStateLoading;
}

/// @nodoc
abstract class _$$GoogleAuthStateInitialCopyWith<$Res> {
  factory _$$GoogleAuthStateInitialCopyWith(_$GoogleAuthStateInitial value,
          $Res Function(_$GoogleAuthStateInitial) then) =
      __$$GoogleAuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleAuthStateInitialCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$GoogleAuthStateInitial>
    implements _$$GoogleAuthStateInitialCopyWith<$Res> {
  __$$GoogleAuthStateInitialCopyWithImpl(_$GoogleAuthStateInitial _value,
      $Res Function(_$GoogleAuthStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleAuthStateInitial implements GoogleAuthStateInitial {
  const _$GoogleAuthStateInitial();

  @override
  String toString() {
    return 'GoogleAuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleAuthStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? success,
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
    required TResult Function(GoogleAuthStateLoading value) loading,
    required TResult Function(GoogleAuthStateInitial value) initial,
    required TResult Function(GoogleAuthStateSuccess value) success,
    required TResult Function(GoogleAuthStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleAuthStateLoading value)? loading,
    TResult? Function(GoogleAuthStateInitial value)? initial,
    TResult? Function(GoogleAuthStateSuccess value)? success,
    TResult? Function(GoogleAuthStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleAuthStateLoading value)? loading,
    TResult Function(GoogleAuthStateInitial value)? initial,
    TResult Function(GoogleAuthStateSuccess value)? success,
    TResult Function(GoogleAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthStateInitial implements GoogleAuthState {
  const factory GoogleAuthStateInitial() = _$GoogleAuthStateInitial;
}

/// @nodoc
abstract class _$$GoogleAuthStateSuccessCopyWith<$Res> {
  factory _$$GoogleAuthStateSuccessCopyWith(_$GoogleAuthStateSuccess value,
          $Res Function(_$GoogleAuthStateSuccess) then) =
      __$$GoogleAuthStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleAuthStateSuccessCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$GoogleAuthStateSuccess>
    implements _$$GoogleAuthStateSuccessCopyWith<$Res> {
  __$$GoogleAuthStateSuccessCopyWithImpl(_$GoogleAuthStateSuccess _value,
      $Res Function(_$GoogleAuthStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleAuthStateSuccess implements GoogleAuthStateSuccess {
  const _$GoogleAuthStateSuccess();

  @override
  String toString() {
    return 'GoogleAuthState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleAuthStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleAuthStateLoading value) loading,
    required TResult Function(GoogleAuthStateInitial value) initial,
    required TResult Function(GoogleAuthStateSuccess value) success,
    required TResult Function(GoogleAuthStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleAuthStateLoading value)? loading,
    TResult? Function(GoogleAuthStateInitial value)? initial,
    TResult? Function(GoogleAuthStateSuccess value)? success,
    TResult? Function(GoogleAuthStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleAuthStateLoading value)? loading,
    TResult Function(GoogleAuthStateInitial value)? initial,
    TResult Function(GoogleAuthStateSuccess value)? success,
    TResult Function(GoogleAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthStateSuccess implements GoogleAuthState {
  const factory GoogleAuthStateSuccess() = _$GoogleAuthStateSuccess;
}

/// @nodoc
abstract class _$$GoogleAuthStateErrorCopyWith<$Res> {
  factory _$$GoogleAuthStateErrorCopyWith(_$GoogleAuthStateError value,
          $Res Function(_$GoogleAuthStateError) then) =
      __$$GoogleAuthStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GoogleAuthStateErrorCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$GoogleAuthStateError>
    implements _$$GoogleAuthStateErrorCopyWith<$Res> {
  __$$GoogleAuthStateErrorCopyWithImpl(_$GoogleAuthStateError _value,
      $Res Function(_$GoogleAuthStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GoogleAuthStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleAuthStateError implements GoogleAuthStateError {
  const _$GoogleAuthStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GoogleAuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleAuthStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleAuthStateErrorCopyWith<_$GoogleAuthStateError> get copyWith =>
      __$$GoogleAuthStateErrorCopyWithImpl<_$GoogleAuthStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? success,
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
    required TResult Function(GoogleAuthStateLoading value) loading,
    required TResult Function(GoogleAuthStateInitial value) initial,
    required TResult Function(GoogleAuthStateSuccess value) success,
    required TResult Function(GoogleAuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleAuthStateLoading value)? loading,
    TResult? Function(GoogleAuthStateInitial value)? initial,
    TResult? Function(GoogleAuthStateSuccess value)? success,
    TResult? Function(GoogleAuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleAuthStateLoading value)? loading,
    TResult Function(GoogleAuthStateInitial value)? initial,
    TResult Function(GoogleAuthStateSuccess value)? success,
    TResult Function(GoogleAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthStateError implements GoogleAuthState {
  const factory GoogleAuthStateError({required final String error}) =
      _$GoogleAuthStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$GoogleAuthStateErrorCopyWith<_$GoogleAuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

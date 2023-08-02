// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facebook_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FacebookAuthState {
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
    required TResult Function(FacebookAuthStateLoading value) loading,
    required TResult Function(FacebookAuthStateInitial value) initial,
    required TResult Function(FacebookAuthStateSuccess value) success,
    required TResult Function(FacebookAuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookAuthStateLoading value)? loading,
    TResult? Function(FacebookAuthStateInitial value)? initial,
    TResult? Function(FacebookAuthStateSuccess value)? success,
    TResult? Function(FacebookAuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookAuthStateLoading value)? loading,
    TResult Function(FacebookAuthStateInitial value)? initial,
    TResult Function(FacebookAuthStateSuccess value)? success,
    TResult Function(FacebookAuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacebookAuthStateCopyWith<$Res> {
  factory $FacebookAuthStateCopyWith(
          FacebookAuthState value, $Res Function(FacebookAuthState) then) =
      _$FacebookAuthStateCopyWithImpl<$Res, FacebookAuthState>;
}

/// @nodoc
class _$FacebookAuthStateCopyWithImpl<$Res, $Val extends FacebookAuthState>
    implements $FacebookAuthStateCopyWith<$Res> {
  _$FacebookAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FacebookAuthStateLoadingCopyWith<$Res> {
  factory _$$FacebookAuthStateLoadingCopyWith(_$FacebookAuthStateLoading value,
          $Res Function(_$FacebookAuthStateLoading) then) =
      __$$FacebookAuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacebookAuthStateLoadingCopyWithImpl<$Res>
    extends _$FacebookAuthStateCopyWithImpl<$Res, _$FacebookAuthStateLoading>
    implements _$$FacebookAuthStateLoadingCopyWith<$Res> {
  __$$FacebookAuthStateLoadingCopyWithImpl(_$FacebookAuthStateLoading _value,
      $Res Function(_$FacebookAuthStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacebookAuthStateLoading implements FacebookAuthStateLoading {
  const _$FacebookAuthStateLoading();

  @override
  String toString() {
    return 'FacebookAuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookAuthStateLoading);
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
    required TResult Function(FacebookAuthStateLoading value) loading,
    required TResult Function(FacebookAuthStateInitial value) initial,
    required TResult Function(FacebookAuthStateSuccess value) success,
    required TResult Function(FacebookAuthStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookAuthStateLoading value)? loading,
    TResult? Function(FacebookAuthStateInitial value)? initial,
    TResult? Function(FacebookAuthStateSuccess value)? success,
    TResult? Function(FacebookAuthStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookAuthStateLoading value)? loading,
    TResult Function(FacebookAuthStateInitial value)? initial,
    TResult Function(FacebookAuthStateSuccess value)? success,
    TResult Function(FacebookAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FacebookAuthStateLoading implements FacebookAuthState {
  const factory FacebookAuthStateLoading() = _$FacebookAuthStateLoading;
}

/// @nodoc
abstract class _$$FacebookAuthStateInitialCopyWith<$Res> {
  factory _$$FacebookAuthStateInitialCopyWith(_$FacebookAuthStateInitial value,
          $Res Function(_$FacebookAuthStateInitial) then) =
      __$$FacebookAuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacebookAuthStateInitialCopyWithImpl<$Res>
    extends _$FacebookAuthStateCopyWithImpl<$Res, _$FacebookAuthStateInitial>
    implements _$$FacebookAuthStateInitialCopyWith<$Res> {
  __$$FacebookAuthStateInitialCopyWithImpl(_$FacebookAuthStateInitial _value,
      $Res Function(_$FacebookAuthStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacebookAuthStateInitial implements FacebookAuthStateInitial {
  const _$FacebookAuthStateInitial();

  @override
  String toString() {
    return 'FacebookAuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookAuthStateInitial);
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
    required TResult Function(FacebookAuthStateLoading value) loading,
    required TResult Function(FacebookAuthStateInitial value) initial,
    required TResult Function(FacebookAuthStateSuccess value) success,
    required TResult Function(FacebookAuthStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookAuthStateLoading value)? loading,
    TResult? Function(FacebookAuthStateInitial value)? initial,
    TResult? Function(FacebookAuthStateSuccess value)? success,
    TResult? Function(FacebookAuthStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookAuthStateLoading value)? loading,
    TResult Function(FacebookAuthStateInitial value)? initial,
    TResult Function(FacebookAuthStateSuccess value)? success,
    TResult Function(FacebookAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FacebookAuthStateInitial implements FacebookAuthState {
  const factory FacebookAuthStateInitial() = _$FacebookAuthStateInitial;
}

/// @nodoc
abstract class _$$FacebookAuthStateSuccessCopyWith<$Res> {
  factory _$$FacebookAuthStateSuccessCopyWith(_$FacebookAuthStateSuccess value,
          $Res Function(_$FacebookAuthStateSuccess) then) =
      __$$FacebookAuthStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacebookAuthStateSuccessCopyWithImpl<$Res>
    extends _$FacebookAuthStateCopyWithImpl<$Res, _$FacebookAuthStateSuccess>
    implements _$$FacebookAuthStateSuccessCopyWith<$Res> {
  __$$FacebookAuthStateSuccessCopyWithImpl(_$FacebookAuthStateSuccess _value,
      $Res Function(_$FacebookAuthStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacebookAuthStateSuccess implements FacebookAuthStateSuccess {
  const _$FacebookAuthStateSuccess();

  @override
  String toString() {
    return 'FacebookAuthState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookAuthStateSuccess);
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
    required TResult Function(FacebookAuthStateLoading value) loading,
    required TResult Function(FacebookAuthStateInitial value) initial,
    required TResult Function(FacebookAuthStateSuccess value) success,
    required TResult Function(FacebookAuthStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookAuthStateLoading value)? loading,
    TResult? Function(FacebookAuthStateInitial value)? initial,
    TResult? Function(FacebookAuthStateSuccess value)? success,
    TResult? Function(FacebookAuthStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookAuthStateLoading value)? loading,
    TResult Function(FacebookAuthStateInitial value)? initial,
    TResult Function(FacebookAuthStateSuccess value)? success,
    TResult Function(FacebookAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FacebookAuthStateSuccess implements FacebookAuthState {
  const factory FacebookAuthStateSuccess() = _$FacebookAuthStateSuccess;
}

/// @nodoc
abstract class _$$FacebookAuthStateErrorCopyWith<$Res> {
  factory _$$FacebookAuthStateErrorCopyWith(_$FacebookAuthStateError value,
          $Res Function(_$FacebookAuthStateError) then) =
      __$$FacebookAuthStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FacebookAuthStateErrorCopyWithImpl<$Res>
    extends _$FacebookAuthStateCopyWithImpl<$Res, _$FacebookAuthStateError>
    implements _$$FacebookAuthStateErrorCopyWith<$Res> {
  __$$FacebookAuthStateErrorCopyWithImpl(_$FacebookAuthStateError _value,
      $Res Function(_$FacebookAuthStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FacebookAuthStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FacebookAuthStateError implements FacebookAuthStateError {
  const _$FacebookAuthStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'FacebookAuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookAuthStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacebookAuthStateErrorCopyWith<_$FacebookAuthStateError> get copyWith =>
      __$$FacebookAuthStateErrorCopyWithImpl<_$FacebookAuthStateError>(
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
    required TResult Function(FacebookAuthStateLoading value) loading,
    required TResult Function(FacebookAuthStateInitial value) initial,
    required TResult Function(FacebookAuthStateSuccess value) success,
    required TResult Function(FacebookAuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookAuthStateLoading value)? loading,
    TResult? Function(FacebookAuthStateInitial value)? initial,
    TResult? Function(FacebookAuthStateSuccess value)? success,
    TResult? Function(FacebookAuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookAuthStateLoading value)? loading,
    TResult Function(FacebookAuthStateInitial value)? initial,
    TResult Function(FacebookAuthStateSuccess value)? success,
    TResult Function(FacebookAuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FacebookAuthStateError implements FacebookAuthState {
  const factory FacebookAuthStateError({required final String error}) =
      _$FacebookAuthStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$FacebookAuthStateErrorCopyWith<_$FacebookAuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

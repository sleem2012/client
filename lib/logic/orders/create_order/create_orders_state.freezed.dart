// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateOrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String url) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String url)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String url)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateOrdersStateInitial value) initial,
    required TResult Function(CreateOrdersStateLoading value) loading,
    required TResult Function(CreateOrdersStateSuccess value) success,
    required TResult Function(CreateOrdersStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateOrdersStateInitial value)? initial,
    TResult? Function(CreateOrdersStateLoading value)? loading,
    TResult? Function(CreateOrdersStateSuccess value)? success,
    TResult? Function(CreateOrdersStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateOrdersStateInitial value)? initial,
    TResult Function(CreateOrdersStateLoading value)? loading,
    TResult Function(CreateOrdersStateSuccess value)? success,
    TResult Function(CreateOrdersStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrdersStateCopyWith<$Res> {
  factory $CreateOrdersStateCopyWith(
          CreateOrdersState value, $Res Function(CreateOrdersState) then) =
      _$CreateOrdersStateCopyWithImpl<$Res, CreateOrdersState>;
}

/// @nodoc
class _$CreateOrdersStateCopyWithImpl<$Res, $Val extends CreateOrdersState>
    implements $CreateOrdersStateCopyWith<$Res> {
  _$CreateOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateOrdersStateInitialCopyWith<$Res> {
  factory _$$CreateOrdersStateInitialCopyWith(_$CreateOrdersStateInitial value,
          $Res Function(_$CreateOrdersStateInitial) then) =
      __$$CreateOrdersStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateOrdersStateInitialCopyWithImpl<$Res>
    extends _$CreateOrdersStateCopyWithImpl<$Res, _$CreateOrdersStateInitial>
    implements _$$CreateOrdersStateInitialCopyWith<$Res> {
  __$$CreateOrdersStateInitialCopyWithImpl(_$CreateOrdersStateInitial _value,
      $Res Function(_$CreateOrdersStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateOrdersStateInitial implements CreateOrdersStateInitial {
  const _$CreateOrdersStateInitial();

  @override
  String toString() {
    return 'CreateOrdersState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrdersStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String url) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String url)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String url)? success,
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
    required TResult Function(CreateOrdersStateInitial value) initial,
    required TResult Function(CreateOrdersStateLoading value) loading,
    required TResult Function(CreateOrdersStateSuccess value) success,
    required TResult Function(CreateOrdersStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateOrdersStateInitial value)? initial,
    TResult? Function(CreateOrdersStateLoading value)? loading,
    TResult? Function(CreateOrdersStateSuccess value)? success,
    TResult? Function(CreateOrdersStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateOrdersStateInitial value)? initial,
    TResult Function(CreateOrdersStateLoading value)? loading,
    TResult Function(CreateOrdersStateSuccess value)? success,
    TResult Function(CreateOrdersStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CreateOrdersStateInitial implements CreateOrdersState {
  const factory CreateOrdersStateInitial() = _$CreateOrdersStateInitial;
}

/// @nodoc
abstract class _$$CreateOrdersStateLoadingCopyWith<$Res> {
  factory _$$CreateOrdersStateLoadingCopyWith(_$CreateOrdersStateLoading value,
          $Res Function(_$CreateOrdersStateLoading) then) =
      __$$CreateOrdersStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateOrdersStateLoadingCopyWithImpl<$Res>
    extends _$CreateOrdersStateCopyWithImpl<$Res, _$CreateOrdersStateLoading>
    implements _$$CreateOrdersStateLoadingCopyWith<$Res> {
  __$$CreateOrdersStateLoadingCopyWithImpl(_$CreateOrdersStateLoading _value,
      $Res Function(_$CreateOrdersStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateOrdersStateLoading implements CreateOrdersStateLoading {
  const _$CreateOrdersStateLoading();

  @override
  String toString() {
    return 'CreateOrdersState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrdersStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String url) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String url)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String url)? success,
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
    required TResult Function(CreateOrdersStateInitial value) initial,
    required TResult Function(CreateOrdersStateLoading value) loading,
    required TResult Function(CreateOrdersStateSuccess value) success,
    required TResult Function(CreateOrdersStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateOrdersStateInitial value)? initial,
    TResult? Function(CreateOrdersStateLoading value)? loading,
    TResult? Function(CreateOrdersStateSuccess value)? success,
    TResult? Function(CreateOrdersStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateOrdersStateInitial value)? initial,
    TResult Function(CreateOrdersStateLoading value)? loading,
    TResult Function(CreateOrdersStateSuccess value)? success,
    TResult Function(CreateOrdersStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CreateOrdersStateLoading implements CreateOrdersState {
  const factory CreateOrdersStateLoading() = _$CreateOrdersStateLoading;
}

/// @nodoc
abstract class _$$CreateOrdersStateSuccessCopyWith<$Res> {
  factory _$$CreateOrdersStateSuccessCopyWith(_$CreateOrdersStateSuccess value,
          $Res Function(_$CreateOrdersStateSuccess) then) =
      __$$CreateOrdersStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$CreateOrdersStateSuccessCopyWithImpl<$Res>
    extends _$CreateOrdersStateCopyWithImpl<$Res, _$CreateOrdersStateSuccess>
    implements _$$CreateOrdersStateSuccessCopyWith<$Res> {
  __$$CreateOrdersStateSuccessCopyWithImpl(_$CreateOrdersStateSuccess _value,
      $Res Function(_$CreateOrdersStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$CreateOrdersStateSuccess(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateOrdersStateSuccess implements CreateOrdersStateSuccess {
  const _$CreateOrdersStateSuccess({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'CreateOrdersState.success(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrdersStateSuccess &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrdersStateSuccessCopyWith<_$CreateOrdersStateSuccess>
      get copyWith =>
          __$$CreateOrdersStateSuccessCopyWithImpl<_$CreateOrdersStateSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String url) success,
    required TResult Function(String error) error,
  }) {
    return success(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String url)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String url)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateOrdersStateInitial value) initial,
    required TResult Function(CreateOrdersStateLoading value) loading,
    required TResult Function(CreateOrdersStateSuccess value) success,
    required TResult Function(CreateOrdersStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateOrdersStateInitial value)? initial,
    TResult? Function(CreateOrdersStateLoading value)? loading,
    TResult? Function(CreateOrdersStateSuccess value)? success,
    TResult? Function(CreateOrdersStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateOrdersStateInitial value)? initial,
    TResult Function(CreateOrdersStateLoading value)? loading,
    TResult Function(CreateOrdersStateSuccess value)? success,
    TResult Function(CreateOrdersStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CreateOrdersStateSuccess implements CreateOrdersState {
  const factory CreateOrdersStateSuccess({required final String url}) =
      _$CreateOrdersStateSuccess;

  String get url;
  @JsonKey(ignore: true)
  _$$CreateOrdersStateSuccessCopyWith<_$CreateOrdersStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOrdersStateErrorCopyWith<$Res> {
  factory _$$CreateOrdersStateErrorCopyWith(_$CreateOrdersStateError value,
          $Res Function(_$CreateOrdersStateError) then) =
      __$$CreateOrdersStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CreateOrdersStateErrorCopyWithImpl<$Res>
    extends _$CreateOrdersStateCopyWithImpl<$Res, _$CreateOrdersStateError>
    implements _$$CreateOrdersStateErrorCopyWith<$Res> {
  __$$CreateOrdersStateErrorCopyWithImpl(_$CreateOrdersStateError _value,
      $Res Function(_$CreateOrdersStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CreateOrdersStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateOrdersStateError implements CreateOrdersStateError {
  const _$CreateOrdersStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CreateOrdersState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrdersStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrdersStateErrorCopyWith<_$CreateOrdersStateError> get copyWith =>
      __$$CreateOrdersStateErrorCopyWithImpl<_$CreateOrdersStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String url) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String url)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String url)? success,
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
    required TResult Function(CreateOrdersStateInitial value) initial,
    required TResult Function(CreateOrdersStateLoading value) loading,
    required TResult Function(CreateOrdersStateSuccess value) success,
    required TResult Function(CreateOrdersStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateOrdersStateInitial value)? initial,
    TResult? Function(CreateOrdersStateLoading value)? loading,
    TResult? Function(CreateOrdersStateSuccess value)? success,
    TResult? Function(CreateOrdersStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateOrdersStateInitial value)? initial,
    TResult Function(CreateOrdersStateLoading value)? loading,
    TResult Function(CreateOrdersStateSuccess value)? success,
    TResult Function(CreateOrdersStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CreateOrdersStateError implements CreateOrdersState {
  const factory CreateOrdersStateError({required final String error}) =
      _$CreateOrdersStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$CreateOrdersStateErrorCopyWith<_$CreateOrdersStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

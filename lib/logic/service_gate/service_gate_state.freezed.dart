// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_gate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceGateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadMore,
    required TResult Function(String? force) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadMore,
    TResult? Function(String? force)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadMore,
    TResult Function(String? force)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceGateStateLoading value) loading,
    required TResult Function(ServiceGateStateLoadMore value) loadMore,
    required TResult Function(ServiceGateStateSuccess value) success,
    required TResult Function(ServiceGateStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceGateStateLoading value)? loading,
    TResult? Function(ServiceGateStateLoadMore value)? loadMore,
    TResult? Function(ServiceGateStateSuccess value)? success,
    TResult? Function(ServiceGateStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceGateStateLoading value)? loading,
    TResult Function(ServiceGateStateLoadMore value)? loadMore,
    TResult Function(ServiceGateStateSuccess value)? success,
    TResult Function(ServiceGateStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceGateStateCopyWith<$Res> {
  factory $ServiceGateStateCopyWith(
          ServiceGateState value, $Res Function(ServiceGateState) then) =
      _$ServiceGateStateCopyWithImpl<$Res, ServiceGateState>;
}

/// @nodoc
class _$ServiceGateStateCopyWithImpl<$Res, $Val extends ServiceGateState>
    implements $ServiceGateStateCopyWith<$Res> {
  _$ServiceGateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceGateStateLoadingCopyWith<$Res> {
  factory _$$ServiceGateStateLoadingCopyWith(_$ServiceGateStateLoading value,
          $Res Function(_$ServiceGateStateLoading) then) =
      __$$ServiceGateStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceGateStateLoadingCopyWithImpl<$Res>
    extends _$ServiceGateStateCopyWithImpl<$Res, _$ServiceGateStateLoading>
    implements _$$ServiceGateStateLoadingCopyWith<$Res> {
  __$$ServiceGateStateLoadingCopyWithImpl(_$ServiceGateStateLoading _value,
      $Res Function(_$ServiceGateStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceGateStateLoading implements ServiceGateStateLoading {
  const _$ServiceGateStateLoading();

  @override
  String toString() {
    return 'ServiceGateState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceGateStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadMore,
    required TResult Function(String? force) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadMore,
    TResult? Function(String? force)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadMore,
    TResult Function(String? force)? success,
    TResult Function(KFailure error)? error,
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
    required TResult Function(ServiceGateStateLoading value) loading,
    required TResult Function(ServiceGateStateLoadMore value) loadMore,
    required TResult Function(ServiceGateStateSuccess value) success,
    required TResult Function(ServiceGateStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceGateStateLoading value)? loading,
    TResult? Function(ServiceGateStateLoadMore value)? loadMore,
    TResult? Function(ServiceGateStateSuccess value)? success,
    TResult? Function(ServiceGateStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceGateStateLoading value)? loading,
    TResult Function(ServiceGateStateLoadMore value)? loadMore,
    TResult Function(ServiceGateStateSuccess value)? success,
    TResult Function(ServiceGateStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ServiceGateStateLoading implements ServiceGateState {
  const factory ServiceGateStateLoading() = _$ServiceGateStateLoading;
}

/// @nodoc
abstract class _$$ServiceGateStateLoadMoreCopyWith<$Res> {
  factory _$$ServiceGateStateLoadMoreCopyWith(_$ServiceGateStateLoadMore value,
          $Res Function(_$ServiceGateStateLoadMore) then) =
      __$$ServiceGateStateLoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceGateStateLoadMoreCopyWithImpl<$Res>
    extends _$ServiceGateStateCopyWithImpl<$Res, _$ServiceGateStateLoadMore>
    implements _$$ServiceGateStateLoadMoreCopyWith<$Res> {
  __$$ServiceGateStateLoadMoreCopyWithImpl(_$ServiceGateStateLoadMore _value,
      $Res Function(_$ServiceGateStateLoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceGateStateLoadMore implements ServiceGateStateLoadMore {
  const _$ServiceGateStateLoadMore();

  @override
  String toString() {
    return 'ServiceGateState.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceGateStateLoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadMore,
    required TResult Function(String? force) success,
    required TResult Function(KFailure error) error,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadMore,
    TResult? Function(String? force)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadMore,
    TResult Function(String? force)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceGateStateLoading value) loading,
    required TResult Function(ServiceGateStateLoadMore value) loadMore,
    required TResult Function(ServiceGateStateSuccess value) success,
    required TResult Function(ServiceGateStateError value) error,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceGateStateLoading value)? loading,
    TResult? Function(ServiceGateStateLoadMore value)? loadMore,
    TResult? Function(ServiceGateStateSuccess value)? success,
    TResult? Function(ServiceGateStateError value)? error,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceGateStateLoading value)? loading,
    TResult Function(ServiceGateStateLoadMore value)? loadMore,
    TResult Function(ServiceGateStateSuccess value)? success,
    TResult Function(ServiceGateStateError value)? error,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class ServiceGateStateLoadMore implements ServiceGateState {
  const factory ServiceGateStateLoadMore() = _$ServiceGateStateLoadMore;
}

/// @nodoc
abstract class _$$ServiceGateStateSuccessCopyWith<$Res> {
  factory _$$ServiceGateStateSuccessCopyWith(_$ServiceGateStateSuccess value,
          $Res Function(_$ServiceGateStateSuccess) then) =
      __$$ServiceGateStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String? force});
}

/// @nodoc
class __$$ServiceGateStateSuccessCopyWithImpl<$Res>
    extends _$ServiceGateStateCopyWithImpl<$Res, _$ServiceGateStateSuccess>
    implements _$$ServiceGateStateSuccessCopyWith<$Res> {
  __$$ServiceGateStateSuccessCopyWithImpl(_$ServiceGateStateSuccess _value,
      $Res Function(_$ServiceGateStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? force = freezed,
  }) {
    return _then(_$ServiceGateStateSuccess(
      force: freezed == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServiceGateStateSuccess implements ServiceGateStateSuccess {
  const _$ServiceGateStateSuccess({this.force});

  @override
  final String? force;

  @override
  String toString() {
    return 'ServiceGateState.success(force: $force)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceGateStateSuccess &&
            (identical(other.force, force) || other.force == force));
  }

  @override
  int get hashCode => Object.hash(runtimeType, force);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceGateStateSuccessCopyWith<_$ServiceGateStateSuccess> get copyWith =>
      __$$ServiceGateStateSuccessCopyWithImpl<_$ServiceGateStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadMore,
    required TResult Function(String? force) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(force);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadMore,
    TResult? Function(String? force)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(force);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadMore,
    TResult Function(String? force)? success,
    TResult Function(KFailure error)? error,
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
    required TResult Function(ServiceGateStateLoading value) loading,
    required TResult Function(ServiceGateStateLoadMore value) loadMore,
    required TResult Function(ServiceGateStateSuccess value) success,
    required TResult Function(ServiceGateStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceGateStateLoading value)? loading,
    TResult? Function(ServiceGateStateLoadMore value)? loadMore,
    TResult? Function(ServiceGateStateSuccess value)? success,
    TResult? Function(ServiceGateStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceGateStateLoading value)? loading,
    TResult Function(ServiceGateStateLoadMore value)? loadMore,
    TResult Function(ServiceGateStateSuccess value)? success,
    TResult Function(ServiceGateStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ServiceGateStateSuccess implements ServiceGateState {
  const factory ServiceGateStateSuccess({final String? force}) =
      _$ServiceGateStateSuccess;

  String? get force;
  @JsonKey(ignore: true)
  _$$ServiceGateStateSuccessCopyWith<_$ServiceGateStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceGateStateErrorCopyWith<$Res> {
  factory _$$ServiceGateStateErrorCopyWith(_$ServiceGateStateError value,
          $Res Function(_$ServiceGateStateError) then) =
      __$$ServiceGateStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$ServiceGateStateErrorCopyWithImpl<$Res>
    extends _$ServiceGateStateCopyWithImpl<$Res, _$ServiceGateStateError>
    implements _$$ServiceGateStateErrorCopyWith<$Res> {
  __$$ServiceGateStateErrorCopyWithImpl(_$ServiceGateStateError _value,
      $Res Function(_$ServiceGateStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ServiceGateStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as KFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $KFailureCopyWith<$Res> get error {
    return $KFailureCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ServiceGateStateError implements ServiceGateStateError {
  const _$ServiceGateStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'ServiceGateState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceGateStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceGateStateErrorCopyWith<_$ServiceGateStateError> get copyWith =>
      __$$ServiceGateStateErrorCopyWithImpl<_$ServiceGateStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadMore,
    required TResult Function(String? force) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadMore,
    TResult? Function(String? force)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadMore,
    TResult Function(String? force)? success,
    TResult Function(KFailure error)? error,
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
    required TResult Function(ServiceGateStateLoading value) loading,
    required TResult Function(ServiceGateStateLoadMore value) loadMore,
    required TResult Function(ServiceGateStateSuccess value) success,
    required TResult Function(ServiceGateStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceGateStateLoading value)? loading,
    TResult? Function(ServiceGateStateLoadMore value)? loadMore,
    TResult? Function(ServiceGateStateSuccess value)? success,
    TResult? Function(ServiceGateStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceGateStateLoading value)? loading,
    TResult Function(ServiceGateStateLoadMore value)? loadMore,
    TResult Function(ServiceGateStateSuccess value)? success,
    TResult Function(ServiceGateStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ServiceGateStateError implements ServiceGateState {
  const factory ServiceGateStateError({required final KFailure error}) =
      _$ServiceGateStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$ServiceGateStateErrorCopyWith<_$ServiceGateStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

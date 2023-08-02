// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderStatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(OrderStatusModel orderStatusModel) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(OrderStatusModel orderStatusModel)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(OrderStatusModel orderStatusModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStatusStateLoading value) loading,
    required TResult Function(OrderStatusStateSuccess value) success,
    required TResult Function(OrderStatusStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStatusStateLoading value)? loading,
    TResult? Function(OrderStatusStateSuccess value)? success,
    TResult? Function(OrderStatusStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStatusStateLoading value)? loading,
    TResult Function(OrderStatusStateSuccess value)? success,
    TResult Function(OrderStatusStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusStateCopyWith<$Res> {
  factory $OrderStatusStateCopyWith(
          OrderStatusState value, $Res Function(OrderStatusState) then) =
      _$OrderStatusStateCopyWithImpl<$Res, OrderStatusState>;
}

/// @nodoc
class _$OrderStatusStateCopyWithImpl<$Res, $Val extends OrderStatusState>
    implements $OrderStatusStateCopyWith<$Res> {
  _$OrderStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrderStatusStateLoadingCopyWith<$Res> {
  factory _$$OrderStatusStateLoadingCopyWith(_$OrderStatusStateLoading value,
          $Res Function(_$OrderStatusStateLoading) then) =
      __$$OrderStatusStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStatusStateLoadingCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$OrderStatusStateLoading>
    implements _$$OrderStatusStateLoadingCopyWith<$Res> {
  __$$OrderStatusStateLoadingCopyWithImpl(_$OrderStatusStateLoading _value,
      $Res Function(_$OrderStatusStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStatusStateLoading implements OrderStatusStateLoading {
  const _$OrderStatusStateLoading();

  @override
  String toString() {
    return 'OrderStatusState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(OrderStatusModel orderStatusModel) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(OrderStatusModel orderStatusModel)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(OrderStatusModel orderStatusModel)? success,
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
    required TResult Function(OrderStatusStateLoading value) loading,
    required TResult Function(OrderStatusStateSuccess value) success,
    required TResult Function(OrderStatusStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStatusStateLoading value)? loading,
    TResult? Function(OrderStatusStateSuccess value)? success,
    TResult? Function(OrderStatusStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStatusStateLoading value)? loading,
    TResult Function(OrderStatusStateSuccess value)? success,
    TResult Function(OrderStatusStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrderStatusStateLoading implements OrderStatusState {
  const factory OrderStatusStateLoading() = _$OrderStatusStateLoading;
}

/// @nodoc
abstract class _$$OrderStatusStateSuccessCopyWith<$Res> {
  factory _$$OrderStatusStateSuccessCopyWith(_$OrderStatusStateSuccess value,
          $Res Function(_$OrderStatusStateSuccess) then) =
      __$$OrderStatusStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderStatusModel orderStatusModel});
}

/// @nodoc
class __$$OrderStatusStateSuccessCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$OrderStatusStateSuccess>
    implements _$$OrderStatusStateSuccessCopyWith<$Res> {
  __$$OrderStatusStateSuccessCopyWithImpl(_$OrderStatusStateSuccess _value,
      $Res Function(_$OrderStatusStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatusModel = null,
  }) {
    return _then(_$OrderStatusStateSuccess(
      orderStatusModel: null == orderStatusModel
          ? _value.orderStatusModel
          : orderStatusModel // ignore: cast_nullable_to_non_nullable
              as OrderStatusModel,
    ));
  }
}

/// @nodoc

class _$OrderStatusStateSuccess implements OrderStatusStateSuccess {
  const _$OrderStatusStateSuccess({required this.orderStatusModel});

  @override
  final OrderStatusModel orderStatusModel;

  @override
  String toString() {
    return 'OrderStatusState.success(orderStatusModel: $orderStatusModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusStateSuccess &&
            (identical(other.orderStatusModel, orderStatusModel) ||
                other.orderStatusModel == orderStatusModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderStatusModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusStateSuccessCopyWith<_$OrderStatusStateSuccess> get copyWith =>
      __$$OrderStatusStateSuccessCopyWithImpl<_$OrderStatusStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(OrderStatusModel orderStatusModel) success,
    required TResult Function(String error) error,
  }) {
    return success(orderStatusModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(OrderStatusModel orderStatusModel)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(orderStatusModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(OrderStatusModel orderStatusModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(orderStatusModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStatusStateLoading value) loading,
    required TResult Function(OrderStatusStateSuccess value) success,
    required TResult Function(OrderStatusStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStatusStateLoading value)? loading,
    TResult? Function(OrderStatusStateSuccess value)? success,
    TResult? Function(OrderStatusStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStatusStateLoading value)? loading,
    TResult Function(OrderStatusStateSuccess value)? success,
    TResult Function(OrderStatusStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class OrderStatusStateSuccess implements OrderStatusState {
  const factory OrderStatusStateSuccess(
          {required final OrderStatusModel orderStatusModel}) =
      _$OrderStatusStateSuccess;

  OrderStatusModel get orderStatusModel;
  @JsonKey(ignore: true)
  _$$OrderStatusStateSuccessCopyWith<_$OrderStatusStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderStatusStateErrorCopyWith<$Res> {
  factory _$$OrderStatusStateErrorCopyWith(_$OrderStatusStateError value,
          $Res Function(_$OrderStatusStateError) then) =
      __$$OrderStatusStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OrderStatusStateErrorCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$OrderStatusStateError>
    implements _$$OrderStatusStateErrorCopyWith<$Res> {
  __$$OrderStatusStateErrorCopyWithImpl(_$OrderStatusStateError _value,
      $Res Function(_$OrderStatusStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OrderStatusStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderStatusStateError implements OrderStatusStateError {
  const _$OrderStatusStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OrderStatusState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusStateErrorCopyWith<_$OrderStatusStateError> get copyWith =>
      __$$OrderStatusStateErrorCopyWithImpl<_$OrderStatusStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(OrderStatusModel orderStatusModel) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(OrderStatusModel orderStatusModel)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(OrderStatusModel orderStatusModel)? success,
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
    required TResult Function(OrderStatusStateLoading value) loading,
    required TResult Function(OrderStatusStateSuccess value) success,
    required TResult Function(OrderStatusStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStatusStateLoading value)? loading,
    TResult? Function(OrderStatusStateSuccess value)? success,
    TResult? Function(OrderStatusStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStatusStateLoading value)? loading,
    TResult Function(OrderStatusStateSuccess value)? success,
    TResult Function(OrderStatusStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrderStatusStateError implements OrderStatusState {
  const factory OrderStatusStateError({required final String error}) =
      _$OrderStatusStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$OrderStatusStateErrorCopyWith<_$OrderStatusStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

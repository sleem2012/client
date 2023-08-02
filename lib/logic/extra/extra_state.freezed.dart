// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extra_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExtraState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int? id) loading,
    required TResult Function(CartModel? cartModel) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int? id)? loading,
    TResult? Function(CartModel? cartModel)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int? id)? loading,
    TResult Function(CartModel? cartModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExtraStateInitial value) initial,
    required TResult Function(ExtraStateLoading value) loading,
    required TResult Function(ExtraStateSuccess value) success,
    required TResult Function(ExtraStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExtraStateInitial value)? initial,
    TResult? Function(ExtraStateLoading value)? loading,
    TResult? Function(ExtraStateSuccess value)? success,
    TResult? Function(ExtraStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExtraStateInitial value)? initial,
    TResult Function(ExtraStateLoading value)? loading,
    TResult Function(ExtraStateSuccess value)? success,
    TResult Function(ExtraStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraStateCopyWith<$Res> {
  factory $ExtraStateCopyWith(
          ExtraState value, $Res Function(ExtraState) then) =
      _$ExtraStateCopyWithImpl<$Res, ExtraState>;
}

/// @nodoc
class _$ExtraStateCopyWithImpl<$Res, $Val extends ExtraState>
    implements $ExtraStateCopyWith<$Res> {
  _$ExtraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ExtraStateInitialCopyWith<$Res> {
  factory _$$ExtraStateInitialCopyWith(
          _$ExtraStateInitial value, $Res Function(_$ExtraStateInitial) then) =
      __$$ExtraStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExtraStateInitialCopyWithImpl<$Res>
    extends _$ExtraStateCopyWithImpl<$Res, _$ExtraStateInitial>
    implements _$$ExtraStateInitialCopyWith<$Res> {
  __$$ExtraStateInitialCopyWithImpl(
      _$ExtraStateInitial _value, $Res Function(_$ExtraStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExtraStateInitial implements ExtraStateInitial {
  const _$ExtraStateInitial();

  @override
  String toString() {
    return 'ExtraState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExtraStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int? id) loading,
    required TResult Function(CartModel? cartModel) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int? id)? loading,
    TResult? Function(CartModel? cartModel)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int? id)? loading,
    TResult Function(CartModel? cartModel)? success,
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
    required TResult Function(ExtraStateInitial value) initial,
    required TResult Function(ExtraStateLoading value) loading,
    required TResult Function(ExtraStateSuccess value) success,
    required TResult Function(ExtraStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExtraStateInitial value)? initial,
    TResult? Function(ExtraStateLoading value)? loading,
    TResult? Function(ExtraStateSuccess value)? success,
    TResult? Function(ExtraStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExtraStateInitial value)? initial,
    TResult Function(ExtraStateLoading value)? loading,
    TResult Function(ExtraStateSuccess value)? success,
    TResult Function(ExtraStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ExtraStateInitial implements ExtraState {
  const factory ExtraStateInitial() = _$ExtraStateInitial;
}

/// @nodoc
abstract class _$$ExtraStateLoadingCopyWith<$Res> {
  factory _$$ExtraStateLoadingCopyWith(
          _$ExtraStateLoading value, $Res Function(_$ExtraStateLoading) then) =
      __$$ExtraStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$ExtraStateLoadingCopyWithImpl<$Res>
    extends _$ExtraStateCopyWithImpl<$Res, _$ExtraStateLoading>
    implements _$$ExtraStateLoadingCopyWith<$Res> {
  __$$ExtraStateLoadingCopyWithImpl(
      _$ExtraStateLoading _value, $Res Function(_$ExtraStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$ExtraStateLoading(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ExtraStateLoading implements ExtraStateLoading {
  const _$ExtraStateLoading({this.id});

  @override
  final int? id;

  @override
  String toString() {
    return 'ExtraState.loading(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraStateLoading &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraStateLoadingCopyWith<_$ExtraStateLoading> get copyWith =>
      __$$ExtraStateLoadingCopyWithImpl<_$ExtraStateLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int? id) loading,
    required TResult Function(CartModel? cartModel) success,
    required TResult Function(String error) error,
  }) {
    return loading(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int? id)? loading,
    TResult? Function(CartModel? cartModel)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int? id)? loading,
    TResult Function(CartModel? cartModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExtraStateInitial value) initial,
    required TResult Function(ExtraStateLoading value) loading,
    required TResult Function(ExtraStateSuccess value) success,
    required TResult Function(ExtraStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExtraStateInitial value)? initial,
    TResult? Function(ExtraStateLoading value)? loading,
    TResult? Function(ExtraStateSuccess value)? success,
    TResult? Function(ExtraStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExtraStateInitial value)? initial,
    TResult Function(ExtraStateLoading value)? loading,
    TResult Function(ExtraStateSuccess value)? success,
    TResult Function(ExtraStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ExtraStateLoading implements ExtraState {
  const factory ExtraStateLoading({final int? id}) = _$ExtraStateLoading;

  int? get id;
  @JsonKey(ignore: true)
  _$$ExtraStateLoadingCopyWith<_$ExtraStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExtraStateSuccessCopyWith<$Res> {
  factory _$$ExtraStateSuccessCopyWith(
          _$ExtraStateSuccess value, $Res Function(_$ExtraStateSuccess) then) =
      __$$ExtraStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({CartModel? cartModel});
}

/// @nodoc
class __$$ExtraStateSuccessCopyWithImpl<$Res>
    extends _$ExtraStateCopyWithImpl<$Res, _$ExtraStateSuccess>
    implements _$$ExtraStateSuccessCopyWith<$Res> {
  __$$ExtraStateSuccessCopyWithImpl(
      _$ExtraStateSuccess _value, $Res Function(_$ExtraStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartModel = freezed,
  }) {
    return _then(_$ExtraStateSuccess(
      cartModel: freezed == cartModel
          ? _value.cartModel
          : cartModel // ignore: cast_nullable_to_non_nullable
              as CartModel?,
    ));
  }
}

/// @nodoc

class _$ExtraStateSuccess implements ExtraStateSuccess {
  const _$ExtraStateSuccess({this.cartModel});

  @override
  final CartModel? cartModel;

  @override
  String toString() {
    return 'ExtraState.success(cartModel: $cartModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraStateSuccess &&
            (identical(other.cartModel, cartModel) ||
                other.cartModel == cartModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraStateSuccessCopyWith<_$ExtraStateSuccess> get copyWith =>
      __$$ExtraStateSuccessCopyWithImpl<_$ExtraStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int? id) loading,
    required TResult Function(CartModel? cartModel) success,
    required TResult Function(String error) error,
  }) {
    return success(cartModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int? id)? loading,
    TResult? Function(CartModel? cartModel)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(cartModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int? id)? loading,
    TResult Function(CartModel? cartModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(cartModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExtraStateInitial value) initial,
    required TResult Function(ExtraStateLoading value) loading,
    required TResult Function(ExtraStateSuccess value) success,
    required TResult Function(ExtraStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExtraStateInitial value)? initial,
    TResult? Function(ExtraStateLoading value)? loading,
    TResult? Function(ExtraStateSuccess value)? success,
    TResult? Function(ExtraStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExtraStateInitial value)? initial,
    TResult Function(ExtraStateLoading value)? loading,
    TResult Function(ExtraStateSuccess value)? success,
    TResult Function(ExtraStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ExtraStateSuccess implements ExtraState {
  const factory ExtraStateSuccess({final CartModel? cartModel}) =
      _$ExtraStateSuccess;

  CartModel? get cartModel;
  @JsonKey(ignore: true)
  _$$ExtraStateSuccessCopyWith<_$ExtraStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExtraStateErrorCopyWith<$Res> {
  factory _$$ExtraStateErrorCopyWith(
          _$ExtraStateError value, $Res Function(_$ExtraStateError) then) =
      __$$ExtraStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ExtraStateErrorCopyWithImpl<$Res>
    extends _$ExtraStateCopyWithImpl<$Res, _$ExtraStateError>
    implements _$$ExtraStateErrorCopyWith<$Res> {
  __$$ExtraStateErrorCopyWithImpl(
      _$ExtraStateError _value, $Res Function(_$ExtraStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ExtraStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExtraStateError implements ExtraStateError {
  const _$ExtraStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ExtraState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraStateErrorCopyWith<_$ExtraStateError> get copyWith =>
      __$$ExtraStateErrorCopyWithImpl<_$ExtraStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int? id) loading,
    required TResult Function(CartModel? cartModel) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int? id)? loading,
    TResult? Function(CartModel? cartModel)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int? id)? loading,
    TResult Function(CartModel? cartModel)? success,
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
    required TResult Function(ExtraStateInitial value) initial,
    required TResult Function(ExtraStateLoading value) loading,
    required TResult Function(ExtraStateSuccess value) success,
    required TResult Function(ExtraStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExtraStateInitial value)? initial,
    TResult? Function(ExtraStateLoading value)? loading,
    TResult? Function(ExtraStateSuccess value)? success,
    TResult? Function(ExtraStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExtraStateInitial value)? initial,
    TResult Function(ExtraStateLoading value)? loading,
    TResult Function(ExtraStateSuccess value)? success,
    TResult Function(ExtraStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ExtraStateError implements ExtraState {
  const factory ExtraStateError({required final String error}) =
      _$ExtraStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ExtraStateErrorCopyWith<_$ExtraStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

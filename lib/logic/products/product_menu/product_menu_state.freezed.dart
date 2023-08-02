// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductMenuState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductMenu> proMenuList) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductMenu> proMenuList)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductMenu> proMenuList)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductMenuStateInitial value) initial,
    required TResult Function(ProductMenuStateLoading value) loading,
    required TResult Function(ProductMenuStateSuccess value) success,
    required TResult Function(ProductMenuStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductMenuStateInitial value)? initial,
    TResult? Function(ProductMenuStateLoading value)? loading,
    TResult? Function(ProductMenuStateSuccess value)? success,
    TResult? Function(ProductMenuStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductMenuStateInitial value)? initial,
    TResult Function(ProductMenuStateLoading value)? loading,
    TResult Function(ProductMenuStateSuccess value)? success,
    TResult Function(ProductMenuStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMenuStateCopyWith<$Res> {
  factory $ProductMenuStateCopyWith(
          ProductMenuState value, $Res Function(ProductMenuState) then) =
      _$ProductMenuStateCopyWithImpl<$Res, ProductMenuState>;
}

/// @nodoc
class _$ProductMenuStateCopyWithImpl<$Res, $Val extends ProductMenuState>
    implements $ProductMenuStateCopyWith<$Res> {
  _$ProductMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductMenuStateInitialCopyWith<$Res> {
  factory _$$ProductMenuStateInitialCopyWith(_$ProductMenuStateInitial value,
          $Res Function(_$ProductMenuStateInitial) then) =
      __$$ProductMenuStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductMenuStateInitialCopyWithImpl<$Res>
    extends _$ProductMenuStateCopyWithImpl<$Res, _$ProductMenuStateInitial>
    implements _$$ProductMenuStateInitialCopyWith<$Res> {
  __$$ProductMenuStateInitialCopyWithImpl(_$ProductMenuStateInitial _value,
      $Res Function(_$ProductMenuStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductMenuStateInitial implements ProductMenuStateInitial {
  const _$ProductMenuStateInitial();

  @override
  String toString() {
    return 'ProductMenuState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMenuStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductMenu> proMenuList) success,
    required TResult Function(KFailure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductMenu> proMenuList)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductMenu> proMenuList)? success,
    TResult Function(KFailure error)? error,
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
    required TResult Function(ProductMenuStateInitial value) initial,
    required TResult Function(ProductMenuStateLoading value) loading,
    required TResult Function(ProductMenuStateSuccess value) success,
    required TResult Function(ProductMenuStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductMenuStateInitial value)? initial,
    TResult? Function(ProductMenuStateLoading value)? loading,
    TResult? Function(ProductMenuStateSuccess value)? success,
    TResult? Function(ProductMenuStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductMenuStateInitial value)? initial,
    TResult Function(ProductMenuStateLoading value)? loading,
    TResult Function(ProductMenuStateSuccess value)? success,
    TResult Function(ProductMenuStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProductMenuStateInitial implements ProductMenuState {
  const factory ProductMenuStateInitial() = _$ProductMenuStateInitial;
}

/// @nodoc
abstract class _$$ProductMenuStateLoadingCopyWith<$Res> {
  factory _$$ProductMenuStateLoadingCopyWith(_$ProductMenuStateLoading value,
          $Res Function(_$ProductMenuStateLoading) then) =
      __$$ProductMenuStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductMenuStateLoadingCopyWithImpl<$Res>
    extends _$ProductMenuStateCopyWithImpl<$Res, _$ProductMenuStateLoading>
    implements _$$ProductMenuStateLoadingCopyWith<$Res> {
  __$$ProductMenuStateLoadingCopyWithImpl(_$ProductMenuStateLoading _value,
      $Res Function(_$ProductMenuStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductMenuStateLoading implements ProductMenuStateLoading {
  const _$ProductMenuStateLoading();

  @override
  String toString() {
    return 'ProductMenuState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMenuStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductMenu> proMenuList) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductMenu> proMenuList)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductMenu> proMenuList)? success,
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
    required TResult Function(ProductMenuStateInitial value) initial,
    required TResult Function(ProductMenuStateLoading value) loading,
    required TResult Function(ProductMenuStateSuccess value) success,
    required TResult Function(ProductMenuStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductMenuStateInitial value)? initial,
    TResult? Function(ProductMenuStateLoading value)? loading,
    TResult? Function(ProductMenuStateSuccess value)? success,
    TResult? Function(ProductMenuStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductMenuStateInitial value)? initial,
    TResult Function(ProductMenuStateLoading value)? loading,
    TResult Function(ProductMenuStateSuccess value)? success,
    TResult Function(ProductMenuStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductMenuStateLoading implements ProductMenuState {
  const factory ProductMenuStateLoading() = _$ProductMenuStateLoading;
}

/// @nodoc
abstract class _$$ProductMenuStateSuccessCopyWith<$Res> {
  factory _$$ProductMenuStateSuccessCopyWith(_$ProductMenuStateSuccess value,
          $Res Function(_$ProductMenuStateSuccess) then) =
      __$$ProductMenuStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductMenu> proMenuList});
}

/// @nodoc
class __$$ProductMenuStateSuccessCopyWithImpl<$Res>
    extends _$ProductMenuStateCopyWithImpl<$Res, _$ProductMenuStateSuccess>
    implements _$$ProductMenuStateSuccessCopyWith<$Res> {
  __$$ProductMenuStateSuccessCopyWithImpl(_$ProductMenuStateSuccess _value,
      $Res Function(_$ProductMenuStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proMenuList = null,
  }) {
    return _then(_$ProductMenuStateSuccess(
      null == proMenuList
          ? _value._proMenuList
          : proMenuList // ignore: cast_nullable_to_non_nullable
              as List<ProductMenu>,
    ));
  }
}

/// @nodoc

class _$ProductMenuStateSuccess implements ProductMenuStateSuccess {
  const _$ProductMenuStateSuccess(final List<ProductMenu> proMenuList)
      : _proMenuList = proMenuList;

  final List<ProductMenu> _proMenuList;
  @override
  List<ProductMenu> get proMenuList {
    if (_proMenuList is EqualUnmodifiableListView) return _proMenuList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proMenuList);
  }

  @override
  String toString() {
    return 'ProductMenuState.success(proMenuList: $proMenuList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMenuStateSuccess &&
            const DeepCollectionEquality()
                .equals(other._proMenuList, _proMenuList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_proMenuList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMenuStateSuccessCopyWith<_$ProductMenuStateSuccess> get copyWith =>
      __$$ProductMenuStateSuccessCopyWithImpl<_$ProductMenuStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductMenu> proMenuList) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(proMenuList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductMenu> proMenuList)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(proMenuList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductMenu> proMenuList)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(proMenuList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductMenuStateInitial value) initial,
    required TResult Function(ProductMenuStateLoading value) loading,
    required TResult Function(ProductMenuStateSuccess value) success,
    required TResult Function(ProductMenuStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductMenuStateInitial value)? initial,
    TResult? Function(ProductMenuStateLoading value)? loading,
    TResult? Function(ProductMenuStateSuccess value)? success,
    TResult? Function(ProductMenuStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductMenuStateInitial value)? initial,
    TResult Function(ProductMenuStateLoading value)? loading,
    TResult Function(ProductMenuStateSuccess value)? success,
    TResult Function(ProductMenuStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProductMenuStateSuccess implements ProductMenuState {
  const factory ProductMenuStateSuccess(final List<ProductMenu> proMenuList) =
      _$ProductMenuStateSuccess;

  List<ProductMenu> get proMenuList;
  @JsonKey(ignore: true)
  _$$ProductMenuStateSuccessCopyWith<_$ProductMenuStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductMenuStateErrorCopyWith<$Res> {
  factory _$$ProductMenuStateErrorCopyWith(_$ProductMenuStateError value,
          $Res Function(_$ProductMenuStateError) then) =
      __$$ProductMenuStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$ProductMenuStateErrorCopyWithImpl<$Res>
    extends _$ProductMenuStateCopyWithImpl<$Res, _$ProductMenuStateError>
    implements _$$ProductMenuStateErrorCopyWith<$Res> {
  __$$ProductMenuStateErrorCopyWithImpl(_$ProductMenuStateError _value,
      $Res Function(_$ProductMenuStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ProductMenuStateError(
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

class _$ProductMenuStateError implements ProductMenuStateError {
  const _$ProductMenuStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'ProductMenuState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMenuStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMenuStateErrorCopyWith<_$ProductMenuStateError> get copyWith =>
      __$$ProductMenuStateErrorCopyWithImpl<_$ProductMenuStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductMenu> proMenuList) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductMenu> proMenuList)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductMenu> proMenuList)? success,
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
    required TResult Function(ProductMenuStateInitial value) initial,
    required TResult Function(ProductMenuStateLoading value) loading,
    required TResult Function(ProductMenuStateSuccess value) success,
    required TResult Function(ProductMenuStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductMenuStateInitial value)? initial,
    TResult? Function(ProductMenuStateLoading value)? loading,
    TResult? Function(ProductMenuStateSuccess value)? success,
    TResult? Function(ProductMenuStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductMenuStateInitial value)? initial,
    TResult Function(ProductMenuStateLoading value)? loading,
    TResult Function(ProductMenuStateSuccess value)? success,
    TResult Function(ProductMenuStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductMenuStateError implements ProductMenuState {
  const factory ProductMenuStateError({required final KFailure error}) =
      _$ProductMenuStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$ProductMenuStateErrorCopyWith<_$ProductMenuStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

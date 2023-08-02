// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetProductsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ProductsSysModel model) loadMore,
    required TResult Function(ProductsSysModel model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductsSysModel model)? loadMore,
    TResult? Function(ProductsSysModel model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductsSysModel model)? loadMore,
    TResult Function(ProductsSysModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsLoading value) loading,
    required TResult Function(GetProductsLoadMore value) loadMore,
    required TResult Function(GetProductsSuccess value) success,
    required TResult Function(GetProductsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsLoading value)? loading,
    TResult? Function(GetProductsLoadMore value)? loadMore,
    TResult? Function(GetProductsSuccess value)? success,
    TResult? Function(GetProductsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsLoading value)? loading,
    TResult Function(GetProductsLoadMore value)? loadMore,
    TResult Function(GetProductsSuccess value)? success,
    TResult Function(GetProductsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductsStateCopyWith<$Res> {
  factory $GetProductsStateCopyWith(
          GetProductsState value, $Res Function(GetProductsState) then) =
      _$GetProductsStateCopyWithImpl<$Res, GetProductsState>;
}

/// @nodoc
class _$GetProductsStateCopyWithImpl<$Res, $Val extends GetProductsState>
    implements $GetProductsStateCopyWith<$Res> {
  _$GetProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetProductsLoadingCopyWith<$Res> {
  factory _$$GetProductsLoadingCopyWith(_$GetProductsLoading value,
          $Res Function(_$GetProductsLoading) then) =
      __$$GetProductsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProductsLoadingCopyWithImpl<$Res>
    extends _$GetProductsStateCopyWithImpl<$Res, _$GetProductsLoading>
    implements _$$GetProductsLoadingCopyWith<$Res> {
  __$$GetProductsLoadingCopyWithImpl(
      _$GetProductsLoading _value, $Res Function(_$GetProductsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetProductsLoading implements GetProductsLoading {
  const _$GetProductsLoading();

  @override
  String toString() {
    return 'GetProductsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProductsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ProductsSysModel model) loadMore,
    required TResult Function(ProductsSysModel model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductsSysModel model)? loadMore,
    TResult? Function(ProductsSysModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductsSysModel model)? loadMore,
    TResult Function(ProductsSysModel model)? success,
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
    required TResult Function(GetProductsLoading value) loading,
    required TResult Function(GetProductsLoadMore value) loadMore,
    required TResult Function(GetProductsSuccess value) success,
    required TResult Function(GetProductsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsLoading value)? loading,
    TResult? Function(GetProductsLoadMore value)? loadMore,
    TResult? Function(GetProductsSuccess value)? success,
    TResult? Function(GetProductsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsLoading value)? loading,
    TResult Function(GetProductsLoadMore value)? loadMore,
    TResult Function(GetProductsSuccess value)? success,
    TResult Function(GetProductsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetProductsLoading implements GetProductsState {
  const factory GetProductsLoading() = _$GetProductsLoading;
}

/// @nodoc
abstract class _$$GetProductsLoadMoreCopyWith<$Res> {
  factory _$$GetProductsLoadMoreCopyWith(_$GetProductsLoadMore value,
          $Res Function(_$GetProductsLoadMore) then) =
      __$$GetProductsLoadMoreCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductsSysModel model});
}

/// @nodoc
class __$$GetProductsLoadMoreCopyWithImpl<$Res>
    extends _$GetProductsStateCopyWithImpl<$Res, _$GetProductsLoadMore>
    implements _$$GetProductsLoadMoreCopyWith<$Res> {
  __$$GetProductsLoadMoreCopyWithImpl(
      _$GetProductsLoadMore _value, $Res Function(_$GetProductsLoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$GetProductsLoadMore(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ProductsSysModel,
    ));
  }
}

/// @nodoc

class _$GetProductsLoadMore implements GetProductsLoadMore {
  const _$GetProductsLoadMore({required this.model});

  @override
  final ProductsSysModel model;

  @override
  String toString() {
    return 'GetProductsState.loadMore(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsLoadMore &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsLoadMoreCopyWith<_$GetProductsLoadMore> get copyWith =>
      __$$GetProductsLoadMoreCopyWithImpl<_$GetProductsLoadMore>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ProductsSysModel model) loadMore,
    required TResult Function(ProductsSysModel model) success,
    required TResult Function(String error) error,
  }) {
    return loadMore(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductsSysModel model)? loadMore,
    TResult? Function(ProductsSysModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loadMore?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductsSysModel model)? loadMore,
    TResult Function(ProductsSysModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsLoading value) loading,
    required TResult Function(GetProductsLoadMore value) loadMore,
    required TResult Function(GetProductsSuccess value) success,
    required TResult Function(GetProductsError value) error,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsLoading value)? loading,
    TResult? Function(GetProductsLoadMore value)? loadMore,
    TResult? Function(GetProductsSuccess value)? success,
    TResult? Function(GetProductsError value)? error,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsLoading value)? loading,
    TResult Function(GetProductsLoadMore value)? loadMore,
    TResult Function(GetProductsSuccess value)? success,
    TResult Function(GetProductsError value)? error,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class GetProductsLoadMore implements GetProductsState {
  const factory GetProductsLoadMore({required final ProductsSysModel model}) =
      _$GetProductsLoadMore;

  ProductsSysModel get model;
  @JsonKey(ignore: true)
  _$$GetProductsLoadMoreCopyWith<_$GetProductsLoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProductsSuccessCopyWith<$Res> {
  factory _$$GetProductsSuccessCopyWith(_$GetProductsSuccess value,
          $Res Function(_$GetProductsSuccess) then) =
      __$$GetProductsSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductsSysModel model});
}

/// @nodoc
class __$$GetProductsSuccessCopyWithImpl<$Res>
    extends _$GetProductsStateCopyWithImpl<$Res, _$GetProductsSuccess>
    implements _$$GetProductsSuccessCopyWith<$Res> {
  __$$GetProductsSuccessCopyWithImpl(
      _$GetProductsSuccess _value, $Res Function(_$GetProductsSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$GetProductsSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ProductsSysModel,
    ));
  }
}

/// @nodoc

class _$GetProductsSuccess implements GetProductsSuccess {
  const _$GetProductsSuccess({required this.model});

  @override
  final ProductsSysModel model;

  @override
  String toString() {
    return 'GetProductsState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsSuccessCopyWith<_$GetProductsSuccess> get copyWith =>
      __$$GetProductsSuccessCopyWithImpl<_$GetProductsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ProductsSysModel model) loadMore,
    required TResult Function(ProductsSysModel model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductsSysModel model)? loadMore,
    TResult? Function(ProductsSysModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductsSysModel model)? loadMore,
    TResult Function(ProductsSysModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsLoading value) loading,
    required TResult Function(GetProductsLoadMore value) loadMore,
    required TResult Function(GetProductsSuccess value) success,
    required TResult Function(GetProductsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsLoading value)? loading,
    TResult? Function(GetProductsLoadMore value)? loadMore,
    TResult? Function(GetProductsSuccess value)? success,
    TResult? Function(GetProductsError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsLoading value)? loading,
    TResult Function(GetProductsLoadMore value)? loadMore,
    TResult Function(GetProductsSuccess value)? success,
    TResult Function(GetProductsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetProductsSuccess implements GetProductsState {
  const factory GetProductsSuccess({required final ProductsSysModel model}) =
      _$GetProductsSuccess;

  ProductsSysModel get model;
  @JsonKey(ignore: true)
  _$$GetProductsSuccessCopyWith<_$GetProductsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProductsErrorCopyWith<$Res> {
  factory _$$GetProductsErrorCopyWith(
          _$GetProductsError value, $Res Function(_$GetProductsError) then) =
      __$$GetProductsErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetProductsErrorCopyWithImpl<$Res>
    extends _$GetProductsStateCopyWithImpl<$Res, _$GetProductsError>
    implements _$$GetProductsErrorCopyWith<$Res> {
  __$$GetProductsErrorCopyWithImpl(
      _$GetProductsError _value, $Res Function(_$GetProductsError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetProductsError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProductsError implements GetProductsError {
  const _$GetProductsError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetProductsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsErrorCopyWith<_$GetProductsError> get copyWith =>
      __$$GetProductsErrorCopyWithImpl<_$GetProductsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ProductsSysModel model) loadMore,
    required TResult Function(ProductsSysModel model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductsSysModel model)? loadMore,
    TResult? Function(ProductsSysModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductsSysModel model)? loadMore,
    TResult Function(ProductsSysModel model)? success,
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
    required TResult Function(GetProductsLoading value) loading,
    required TResult Function(GetProductsLoadMore value) loadMore,
    required TResult Function(GetProductsSuccess value) success,
    required TResult Function(GetProductsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsLoading value)? loading,
    TResult? Function(GetProductsLoadMore value)? loadMore,
    TResult? Function(GetProductsSuccess value)? success,
    TResult? Function(GetProductsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsLoading value)? loading,
    TResult Function(GetProductsLoadMore value)? loadMore,
    TResult Function(GetProductsSuccess value)? success,
    TResult Function(GetProductsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetProductsError implements GetProductsState {
  const factory GetProductsError({required final String error}) =
      _$GetProductsError;

  String get error;
  @JsonKey(ignore: true)
  _$$GetProductsErrorCopyWith<_$GetProductsError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetProductsEvents {
  CategoryModel? get sub => throw _privateConstructorUsedError;
  bool get isMore => throw _privateConstructorUsedError;
  bool? get isRefresh => throw _privateConstructorUsedError;
  int? get companyId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId)
        get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId)?
        get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId)?
        get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsEventsGet value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsEventsGet value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsEventsGet value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetProductsEventsCopyWith<GetProductsEvents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductsEventsCopyWith<$Res> {
  factory $GetProductsEventsCopyWith(
          GetProductsEvents value, $Res Function(GetProductsEvents) then) =
      _$GetProductsEventsCopyWithImpl<$Res, GetProductsEvents>;
  @useResult
  $Res call({CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId});
}

/// @nodoc
class _$GetProductsEventsCopyWithImpl<$Res, $Val extends GetProductsEvents>
    implements $GetProductsEventsCopyWith<$Res> {
  _$GetProductsEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = freezed,
    Object? isMore = null,
    Object? isRefresh = freezed,
    Object? companyId = freezed,
  }) {
    return _then(_value.copyWith(
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      isMore: null == isMore
          ? _value.isMore
          : isMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetProductsEventsGetCopyWith<$Res>
    implements $GetProductsEventsCopyWith<$Res> {
  factory _$$GetProductsEventsGetCopyWith(_$GetProductsEventsGet value,
          $Res Function(_$GetProductsEventsGet) then) =
      __$$GetProductsEventsGetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId});
}

/// @nodoc
class __$$GetProductsEventsGetCopyWithImpl<$Res>
    extends _$GetProductsEventsCopyWithImpl<$Res, _$GetProductsEventsGet>
    implements _$$GetProductsEventsGetCopyWith<$Res> {
  __$$GetProductsEventsGetCopyWithImpl(_$GetProductsEventsGet _value,
      $Res Function(_$GetProductsEventsGet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = freezed,
    Object? isMore = null,
    Object? isRefresh = freezed,
    Object? companyId = freezed,
  }) {
    return _then(_$GetProductsEventsGet(
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      isMore: null == isMore
          ? _value.isMore
          : isMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetProductsEventsGet implements GetProductsEventsGet {
  const _$GetProductsEventsGet(
      {this.sub, required this.isMore, this.isRefresh, this.companyId});

  @override
  final CategoryModel? sub;
  @override
  final bool isMore;
  @override
  final bool? isRefresh;
  @override
  final int? companyId;

  @override
  String toString() {
    return 'GetProductsEvents.get(sub: $sub, isMore: $isMore, isRefresh: $isRefresh, companyId: $companyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsEventsGet &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.isMore, isMore) || other.isMore == isMore) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sub, isMore, isRefresh, companyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsEventsGetCopyWith<_$GetProductsEventsGet> get copyWith =>
      __$$GetProductsEventsGetCopyWithImpl<_$GetProductsEventsGet>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId)
        get,
  }) {
    return get(sub, isMore, isRefresh, companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId)?
        get,
  }) {
    return get?.call(sub, isMore, isRefresh, companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CategoryModel? sub, bool isMore, bool? isRefresh, int? companyId)?
        get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(sub, isMore, isRefresh, companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductsEventsGet value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductsEventsGet value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductsEventsGet value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetProductsEventsGet implements GetProductsEvents {
  const factory GetProductsEventsGet(
      {final CategoryModel? sub,
      required final bool isMore,
      final bool? isRefresh,
      final int? companyId}) = _$GetProductsEventsGet;

  @override
  CategoryModel? get sub;
  @override
  bool get isMore;
  @override
  bool? get isRefresh;
  @override
  int? get companyId;
  @override
  @JsonKey(ignore: true)
  _$$GetProductsEventsGetCopyWith<_$GetProductsEventsGet> get copyWith =>
      throw _privateConstructorUsedError;
}

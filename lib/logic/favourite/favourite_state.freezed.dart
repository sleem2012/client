// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteStateLoadingCopyWith<$Res> {
  factory _$$FavoriteStateLoadingCopyWith(_$FavoriteStateLoading value,
          $Res Function(_$FavoriteStateLoading) then) =
      __$$FavoriteStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteStateLoadingCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateLoading>
    implements _$$FavoriteStateLoadingCopyWith<$Res> {
  __$$FavoriteStateLoadingCopyWithImpl(_$FavoriteStateLoading _value,
      $Res Function(_$FavoriteStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteStateLoading implements FavoriteStateLoading {
  const _$FavoriteStateLoading();

  @override
  String toString() {
    return 'FavoriteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoriteStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
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
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoriteStateLoading implements FavoriteState {
  const factory FavoriteStateLoading() = _$FavoriteStateLoading;
}

/// @nodoc
abstract class _$$FavoriteStateTogglingCopyWith<$Res> {
  factory _$$FavoriteStateTogglingCopyWith(_$FavoriteStateToggling value,
          $Res Function(_$FavoriteStateToggling) then) =
      __$$FavoriteStateTogglingCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FavoriteStateTogglingCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateToggling>
    implements _$$FavoriteStateTogglingCopyWith<$Res> {
  __$$FavoriteStateTogglingCopyWithImpl(_$FavoriteStateToggling _value,
      $Res Function(_$FavoriteStateToggling) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FavoriteStateToggling(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FavoriteStateToggling implements FavoriteStateToggling {
  const _$FavoriteStateToggling({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FavoriteState.toggling(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateToggling &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteStateTogglingCopyWith<_$FavoriteStateToggling> get copyWith =>
      __$$FavoriteStateTogglingCopyWithImpl<_$FavoriteStateToggling>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return toggling(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return toggling?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (toggling != null) {
      return toggling(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) {
    return toggling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) {
    return toggling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) {
    if (toggling != null) {
      return toggling(this);
    }
    return orElse();
  }
}

abstract class FavoriteStateToggling implements FavoriteState {
  const factory FavoriteStateToggling({required final int id}) =
      _$FavoriteStateToggling;

  int get id;
  @JsonKey(ignore: true)
  _$$FavoriteStateTogglingCopyWith<_$FavoriteStateToggling> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteStateLoadMoreCopyWith<$Res> {
  factory _$$FavoriteStateLoadMoreCopyWith(_$FavoriteStateLoadMore value,
          $Res Function(_$FavoriteStateLoadMore) then) =
      __$$FavoriteStateLoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteStateLoadMoreCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateLoadMore>
    implements _$$FavoriteStateLoadMoreCopyWith<$Res> {
  __$$FavoriteStateLoadMoreCopyWithImpl(_$FavoriteStateLoadMore _value,
      $Res Function(_$FavoriteStateLoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteStateLoadMore implements FavoriteStateLoadMore {
  const _$FavoriteStateLoadMore();

  @override
  String toString() {
    return 'FavoriteState.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoriteStateLoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
    TResult Function()? success,
    TResult Function(String error)? error,
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
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class FavoriteStateLoadMore implements FavoriteState {
  const factory FavoriteStateLoadMore() = _$FavoriteStateLoadMore;
}

/// @nodoc
abstract class _$$FavoriteStateToggleSuccessCopyWith<$Res> {
  factory _$$FavoriteStateToggleSuccessCopyWith(
          _$FavoriteStateToggleSuccess value,
          $Res Function(_$FavoriteStateToggleSuccess) then) =
      __$$FavoriteStateToggleSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteStateToggleSuccessCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateToggleSuccess>
    implements _$$FavoriteStateToggleSuccessCopyWith<$Res> {
  __$$FavoriteStateToggleSuccessCopyWithImpl(
      _$FavoriteStateToggleSuccess _value,
      $Res Function(_$FavoriteStateToggleSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteStateToggleSuccess implements FavoriteStateToggleSuccess {
  const _$FavoriteStateToggleSuccess();

  @override
  String toString() {
    return 'FavoriteState.toggleSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateToggleSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return toggleSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return toggleSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (toggleSuccess != null) {
      return toggleSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) {
    return toggleSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) {
    return toggleSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) {
    if (toggleSuccess != null) {
      return toggleSuccess(this);
    }
    return orElse();
  }
}

abstract class FavoriteStateToggleSuccess implements FavoriteState {
  const factory FavoriteStateToggleSuccess() = _$FavoriteStateToggleSuccess;
}

/// @nodoc
abstract class _$$FavoriteStateToggleLocaleSuccessCopyWith<$Res> {
  factory _$$FavoriteStateToggleLocaleSuccessCopyWith(
          _$FavoriteStateToggleLocaleSuccess value,
          $Res Function(_$FavoriteStateToggleLocaleSuccess) then) =
      __$$FavoriteStateToggleLocaleSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteStateToggleLocaleSuccessCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res,
        _$FavoriteStateToggleLocaleSuccess>
    implements _$$FavoriteStateToggleLocaleSuccessCopyWith<$Res> {
  __$$FavoriteStateToggleLocaleSuccessCopyWithImpl(
      _$FavoriteStateToggleLocaleSuccess _value,
      $Res Function(_$FavoriteStateToggleLocaleSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteStateToggleLocaleSuccess
    implements FavoriteStateToggleLocaleSuccess {
  const _$FavoriteStateToggleLocaleSuccess();

  @override
  String toString() {
    return 'FavoriteState.toggleLocaleSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateToggleLocaleSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return toggleLocaleSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return toggleLocaleSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (toggleLocaleSuccess != null) {
      return toggleLocaleSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) {
    return toggleLocaleSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) {
    return toggleLocaleSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) {
    if (toggleLocaleSuccess != null) {
      return toggleLocaleSuccess(this);
    }
    return orElse();
  }
}

abstract class FavoriteStateToggleLocaleSuccess implements FavoriteState {
  const factory FavoriteStateToggleLocaleSuccess() =
      _$FavoriteStateToggleLocaleSuccess;
}

/// @nodoc
abstract class _$$FavoriteStateSuccessCopyWith<$Res> {
  factory _$$FavoriteStateSuccessCopyWith(_$FavoriteStateSuccess value,
          $Res Function(_$FavoriteStateSuccess) then) =
      __$$FavoriteStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteStateSuccessCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateSuccess>
    implements _$$FavoriteStateSuccessCopyWith<$Res> {
  __$$FavoriteStateSuccessCopyWithImpl(_$FavoriteStateSuccess _value,
      $Res Function(_$FavoriteStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteStateSuccess implements FavoriteStateSuccess {
  const _$FavoriteStateSuccess();

  @override
  String toString() {
    return 'FavoriteState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoriteStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
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
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FavoriteStateSuccess implements FavoriteState {
  const factory FavoriteStateSuccess() = _$FavoriteStateSuccess;
}

/// @nodoc
abstract class _$$FavoriteStateErrorCopyWith<$Res> {
  factory _$$FavoriteStateErrorCopyWith(_$FavoriteStateError value,
          $Res Function(_$FavoriteStateError) then) =
      __$$FavoriteStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FavoriteStateErrorCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateError>
    implements _$$FavoriteStateErrorCopyWith<$Res> {
  __$$FavoriteStateErrorCopyWithImpl(
      _$FavoriteStateError _value, $Res Function(_$FavoriteStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FavoriteStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoriteStateError implements FavoriteStateError {
  const _$FavoriteStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'FavoriteState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteStateErrorCopyWith<_$FavoriteStateError> get copyWith =>
      __$$FavoriteStateErrorCopyWithImpl<_$FavoriteStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int id) toggling,
    required TResult Function() loadMore,
    required TResult Function() toggleSuccess,
    required TResult Function() toggleLocaleSuccess,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int id)? toggling,
    TResult? Function()? loadMore,
    TResult? Function()? toggleSuccess,
    TResult? Function()? toggleLocaleSuccess,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int id)? toggling,
    TResult Function()? loadMore,
    TResult Function()? toggleSuccess,
    TResult Function()? toggleLocaleSuccess,
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
    required TResult Function(FavoriteStateLoading value) loading,
    required TResult Function(FavoriteStateToggling value) toggling,
    required TResult Function(FavoriteStateLoadMore value) loadMore,
    required TResult Function(FavoriteStateToggleSuccess value) toggleSuccess,
    required TResult Function(FavoriteStateToggleLocaleSuccess value)
        toggleLocaleSuccess,
    required TResult Function(FavoriteStateSuccess value) success,
    required TResult Function(FavoriteStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStateLoading value)? loading,
    TResult? Function(FavoriteStateToggling value)? toggling,
    TResult? Function(FavoriteStateLoadMore value)? loadMore,
    TResult? Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult? Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult? Function(FavoriteStateSuccess value)? success,
    TResult? Function(FavoriteStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteStateLoading value)? loading,
    TResult Function(FavoriteStateToggling value)? toggling,
    TResult Function(FavoriteStateLoadMore value)? loadMore,
    TResult Function(FavoriteStateToggleSuccess value)? toggleSuccess,
    TResult Function(FavoriteStateToggleLocaleSuccess value)?
        toggleLocaleSuccess,
    TResult Function(FavoriteStateSuccess value)? success,
    TResult Function(FavoriteStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FavoriteStateError implements FavoriteState {
  const factory FavoriteStateError({required final String error}) =
      _$FavoriteStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$FavoriteStateErrorCopyWith<_$FavoriteStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

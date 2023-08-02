// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompanyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadmore,
    required TResult Function(CompanyModel model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadmore,
    TResult? Function(CompanyModel model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadmore,
    TResult Function(CompanyModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyStateLoading value) loading,
    required TResult Function(CompanyStateLoadmore value) loadmore,
    required TResult Function(CompanyStateSuccess value) success,
    required TResult Function(CompanyStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompanyStateLoading value)? loading,
    TResult? Function(CompanyStateLoadmore value)? loadmore,
    TResult? Function(CompanyStateSuccess value)? success,
    TResult? Function(CompanyStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyStateLoading value)? loading,
    TResult Function(CompanyStateLoadmore value)? loadmore,
    TResult Function(CompanyStateSuccess value)? success,
    TResult Function(CompanyStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyStateCopyWith<$Res> {
  factory $CompanyStateCopyWith(
          CompanyState value, $Res Function(CompanyState) then) =
      _$CompanyStateCopyWithImpl<$Res, CompanyState>;
}

/// @nodoc
class _$CompanyStateCopyWithImpl<$Res, $Val extends CompanyState>
    implements $CompanyStateCopyWith<$Res> {
  _$CompanyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CompanyStateLoadingCopyWith<$Res> {
  factory _$$CompanyStateLoadingCopyWith(_$CompanyStateLoading value,
          $Res Function(_$CompanyStateLoading) then) =
      __$$CompanyStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompanyStateLoadingCopyWithImpl<$Res>
    extends _$CompanyStateCopyWithImpl<$Res, _$CompanyStateLoading>
    implements _$$CompanyStateLoadingCopyWith<$Res> {
  __$$CompanyStateLoadingCopyWithImpl(
      _$CompanyStateLoading _value, $Res Function(_$CompanyStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompanyStateLoading implements CompanyStateLoading {
  const _$CompanyStateLoading();

  @override
  String toString() {
    return 'CompanyState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompanyStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadmore,
    required TResult Function(CompanyModel model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadmore,
    TResult? Function(CompanyModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadmore,
    TResult Function(CompanyModel model)? success,
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
    required TResult Function(CompanyStateLoading value) loading,
    required TResult Function(CompanyStateLoadmore value) loadmore,
    required TResult Function(CompanyStateSuccess value) success,
    required TResult Function(CompanyStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompanyStateLoading value)? loading,
    TResult? Function(CompanyStateLoadmore value)? loadmore,
    TResult? Function(CompanyStateSuccess value)? success,
    TResult? Function(CompanyStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyStateLoading value)? loading,
    TResult Function(CompanyStateLoadmore value)? loadmore,
    TResult Function(CompanyStateSuccess value)? success,
    TResult Function(CompanyStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CompanyStateLoading implements CompanyState {
  const factory CompanyStateLoading() = _$CompanyStateLoading;
}

/// @nodoc
abstract class _$$CompanyStateLoadmoreCopyWith<$Res> {
  factory _$$CompanyStateLoadmoreCopyWith(_$CompanyStateLoadmore value,
          $Res Function(_$CompanyStateLoadmore) then) =
      __$$CompanyStateLoadmoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompanyStateLoadmoreCopyWithImpl<$Res>
    extends _$CompanyStateCopyWithImpl<$Res, _$CompanyStateLoadmore>
    implements _$$CompanyStateLoadmoreCopyWith<$Res> {
  __$$CompanyStateLoadmoreCopyWithImpl(_$CompanyStateLoadmore _value,
      $Res Function(_$CompanyStateLoadmore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompanyStateLoadmore implements CompanyStateLoadmore {
  const _$CompanyStateLoadmore();

  @override
  String toString() {
    return 'CompanyState.loadmore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompanyStateLoadmore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadmore,
    required TResult Function(CompanyModel model) success,
    required TResult Function(String error) error,
  }) {
    return loadmore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadmore,
    TResult? Function(CompanyModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loadmore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadmore,
    TResult Function(CompanyModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loadmore != null) {
      return loadmore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyStateLoading value) loading,
    required TResult Function(CompanyStateLoadmore value) loadmore,
    required TResult Function(CompanyStateSuccess value) success,
    required TResult Function(CompanyStateError value) error,
  }) {
    return loadmore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompanyStateLoading value)? loading,
    TResult? Function(CompanyStateLoadmore value)? loadmore,
    TResult? Function(CompanyStateSuccess value)? success,
    TResult? Function(CompanyStateError value)? error,
  }) {
    return loadmore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyStateLoading value)? loading,
    TResult Function(CompanyStateLoadmore value)? loadmore,
    TResult Function(CompanyStateSuccess value)? success,
    TResult Function(CompanyStateError value)? error,
    required TResult orElse(),
  }) {
    if (loadmore != null) {
      return loadmore(this);
    }
    return orElse();
  }
}

abstract class CompanyStateLoadmore implements CompanyState {
  const factory CompanyStateLoadmore() = _$CompanyStateLoadmore;
}

/// @nodoc
abstract class _$$CompanyStateSuccessCopyWith<$Res> {
  factory _$$CompanyStateSuccessCopyWith(_$CompanyStateSuccess value,
          $Res Function(_$CompanyStateSuccess) then) =
      __$$CompanyStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({CompanyModel model});
}

/// @nodoc
class __$$CompanyStateSuccessCopyWithImpl<$Res>
    extends _$CompanyStateCopyWithImpl<$Res, _$CompanyStateSuccess>
    implements _$$CompanyStateSuccessCopyWith<$Res> {
  __$$CompanyStateSuccessCopyWithImpl(
      _$CompanyStateSuccess _value, $Res Function(_$CompanyStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$CompanyStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
    ));
  }
}

/// @nodoc

class _$CompanyStateSuccess implements CompanyStateSuccess {
  const _$CompanyStateSuccess({required this.model});

  @override
  final CompanyModel model;

  @override
  String toString() {
    return 'CompanyState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyStateSuccessCopyWith<_$CompanyStateSuccess> get copyWith =>
      __$$CompanyStateSuccessCopyWithImpl<_$CompanyStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadmore,
    required TResult Function(CompanyModel model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadmore,
    TResult? Function(CompanyModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadmore,
    TResult Function(CompanyModel model)? success,
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
    required TResult Function(CompanyStateLoading value) loading,
    required TResult Function(CompanyStateLoadmore value) loadmore,
    required TResult Function(CompanyStateSuccess value) success,
    required TResult Function(CompanyStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompanyStateLoading value)? loading,
    TResult? Function(CompanyStateLoadmore value)? loadmore,
    TResult? Function(CompanyStateSuccess value)? success,
    TResult? Function(CompanyStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyStateLoading value)? loading,
    TResult Function(CompanyStateLoadmore value)? loadmore,
    TResult Function(CompanyStateSuccess value)? success,
    TResult Function(CompanyStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CompanyStateSuccess implements CompanyState {
  const factory CompanyStateSuccess({required final CompanyModel model}) =
      _$CompanyStateSuccess;

  CompanyModel get model;
  @JsonKey(ignore: true)
  _$$CompanyStateSuccessCopyWith<_$CompanyStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompanyStateErrorCopyWith<$Res> {
  factory _$$CompanyStateErrorCopyWith(
          _$CompanyStateError value, $Res Function(_$CompanyStateError) then) =
      __$$CompanyStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CompanyStateErrorCopyWithImpl<$Res>
    extends _$CompanyStateCopyWithImpl<$Res, _$CompanyStateError>
    implements _$$CompanyStateErrorCopyWith<$Res> {
  __$$CompanyStateErrorCopyWithImpl(
      _$CompanyStateError _value, $Res Function(_$CompanyStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CompanyStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompanyStateError implements CompanyStateError {
  const _$CompanyStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CompanyState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyStateErrorCopyWith<_$CompanyStateError> get copyWith =>
      __$$CompanyStateErrorCopyWithImpl<_$CompanyStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadmore,
    required TResult Function(CompanyModel model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loadmore,
    TResult? Function(CompanyModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadmore,
    TResult Function(CompanyModel model)? success,
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
    required TResult Function(CompanyStateLoading value) loading,
    required TResult Function(CompanyStateLoadmore value) loadmore,
    required TResult Function(CompanyStateSuccess value) success,
    required TResult Function(CompanyStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompanyStateLoading value)? loading,
    TResult? Function(CompanyStateLoadmore value)? loadmore,
    TResult? Function(CompanyStateSuccess value)? success,
    TResult? Function(CompanyStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyStateLoading value)? loading,
    TResult Function(CompanyStateLoadmore value)? loadmore,
    TResult Function(CompanyStateSuccess value)? success,
    TResult Function(CompanyStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CompanyStateError implements CompanyState {
  const factory CompanyStateError({required final String error}) =
      _$CompanyStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$CompanyStateErrorCopyWith<_$CompanyStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

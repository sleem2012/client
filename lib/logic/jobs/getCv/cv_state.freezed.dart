// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetCvState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyCvsModel? model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyCvsModel? model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyCvsModel? model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CvStateLoading value) loading,
    required TResult Function(CvStateSuccess value) success,
    required TResult Function(CvStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CvStateLoading value)? loading,
    TResult? Function(CvStateSuccess value)? success,
    TResult? Function(CvStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CvStateLoading value)? loading,
    TResult Function(CvStateSuccess value)? success,
    TResult Function(CvStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCvStateCopyWith<$Res> {
  factory $GetCvStateCopyWith(
          GetCvState value, $Res Function(GetCvState) then) =
      _$GetCvStateCopyWithImpl<$Res, GetCvState>;
}

/// @nodoc
class _$GetCvStateCopyWithImpl<$Res, $Val extends GetCvState>
    implements $GetCvStateCopyWith<$Res> {
  _$GetCvStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CvStateLoadingCopyWith<$Res> {
  factory _$$CvStateLoadingCopyWith(
          _$CvStateLoading value, $Res Function(_$CvStateLoading) then) =
      __$$CvStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CvStateLoadingCopyWithImpl<$Res>
    extends _$GetCvStateCopyWithImpl<$Res, _$CvStateLoading>
    implements _$$CvStateLoadingCopyWith<$Res> {
  __$$CvStateLoadingCopyWithImpl(
      _$CvStateLoading _value, $Res Function(_$CvStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CvStateLoading implements CvStateLoading {
  const _$CvStateLoading();

  @override
  String toString() {
    return 'GetCvState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CvStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyCvsModel? model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyCvsModel? model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyCvsModel? model)? success,
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
    required TResult Function(CvStateLoading value) loading,
    required TResult Function(CvStateSuccess value) success,
    required TResult Function(CvStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CvStateLoading value)? loading,
    TResult? Function(CvStateSuccess value)? success,
    TResult? Function(CvStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CvStateLoading value)? loading,
    TResult Function(CvStateSuccess value)? success,
    TResult Function(CvStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CvStateLoading implements GetCvState {
  const factory CvStateLoading() = _$CvStateLoading;
}

/// @nodoc
abstract class _$$CvStateSuccessCopyWith<$Res> {
  factory _$$CvStateSuccessCopyWith(
          _$CvStateSuccess value, $Res Function(_$CvStateSuccess) then) =
      __$$CvStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({MyCvsModel? model});
}

/// @nodoc
class __$$CvStateSuccessCopyWithImpl<$Res>
    extends _$GetCvStateCopyWithImpl<$Res, _$CvStateSuccess>
    implements _$$CvStateSuccessCopyWith<$Res> {
  __$$CvStateSuccessCopyWithImpl(
      _$CvStateSuccess _value, $Res Function(_$CvStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$CvStateSuccess(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MyCvsModel?,
    ));
  }
}

/// @nodoc

class _$CvStateSuccess implements CvStateSuccess {
  const _$CvStateSuccess({this.model});

  @override
  final MyCvsModel? model;

  @override
  String toString() {
    return 'GetCvState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CvStateSuccessCopyWith<_$CvStateSuccess> get copyWith =>
      __$$CvStateSuccessCopyWithImpl<_$CvStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyCvsModel? model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyCvsModel? model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyCvsModel? model)? success,
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
    required TResult Function(CvStateLoading value) loading,
    required TResult Function(CvStateSuccess value) success,
    required TResult Function(CvStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CvStateLoading value)? loading,
    TResult? Function(CvStateSuccess value)? success,
    TResult? Function(CvStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CvStateLoading value)? loading,
    TResult Function(CvStateSuccess value)? success,
    TResult Function(CvStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CvStateSuccess implements GetCvState {
  const factory CvStateSuccess({final MyCvsModel? model}) = _$CvStateSuccess;

  MyCvsModel? get model;
  @JsonKey(ignore: true)
  _$$CvStateSuccessCopyWith<_$CvStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CvStateErrorCopyWith<$Res> {
  factory _$$CvStateErrorCopyWith(
          _$CvStateError value, $Res Function(_$CvStateError) then) =
      __$$CvStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CvStateErrorCopyWithImpl<$Res>
    extends _$GetCvStateCopyWithImpl<$Res, _$CvStateError>
    implements _$$CvStateErrorCopyWith<$Res> {
  __$$CvStateErrorCopyWithImpl(
      _$CvStateError _value, $Res Function(_$CvStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CvStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CvStateError implements CvStateError {
  const _$CvStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetCvState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CvStateErrorCopyWith<_$CvStateError> get copyWith =>
      __$$CvStateErrorCopyWithImpl<_$CvStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MyCvsModel? model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MyCvsModel? model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MyCvsModel? model)? success,
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
    required TResult Function(CvStateLoading value) loading,
    required TResult Function(CvStateSuccess value) success,
    required TResult Function(CvStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CvStateLoading value)? loading,
    TResult? Function(CvStateSuccess value)? success,
    TResult? Function(CvStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CvStateLoading value)? loading,
    TResult Function(CvStateSuccess value)? success,
    TResult Function(CvStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CvStateError implements GetCvState {
  const factory CvStateError({required final String error}) = _$CvStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$CvStateErrorCopyWith<_$CvStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

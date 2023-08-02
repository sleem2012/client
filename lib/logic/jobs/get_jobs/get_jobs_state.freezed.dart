// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_jobs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JobsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel jobModel) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel jobModel)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel jobModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JobsStateInitial value) initial,
    required TResult Function(JobsStateLoading value) loading,
    required TResult Function(JobsStateSuccess value) success,
    required TResult Function(JobsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JobsStateInitial value)? initial,
    TResult? Function(JobsStateLoading value)? loading,
    TResult? Function(JobsStateSuccess value)? success,
    TResult? Function(JobsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JobsStateInitial value)? initial,
    TResult Function(JobsStateLoading value)? loading,
    TResult Function(JobsStateSuccess value)? success,
    TResult Function(JobsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsStateCopyWith<$Res> {
  factory $JobsStateCopyWith(JobsState value, $Res Function(JobsState) then) =
      _$JobsStateCopyWithImpl<$Res, JobsState>;
}

/// @nodoc
class _$JobsStateCopyWithImpl<$Res, $Val extends JobsState>
    implements $JobsStateCopyWith<$Res> {
  _$JobsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$JobsStateInitialCopyWith<$Res> {
  factory _$$JobsStateInitialCopyWith(
          _$JobsStateInitial value, $Res Function(_$JobsStateInitial) then) =
      __$$JobsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JobsStateInitialCopyWithImpl<$Res>
    extends _$JobsStateCopyWithImpl<$Res, _$JobsStateInitial>
    implements _$$JobsStateInitialCopyWith<$Res> {
  __$$JobsStateInitialCopyWithImpl(
      _$JobsStateInitial _value, $Res Function(_$JobsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JobsStateInitial implements JobsStateInitial {
  const _$JobsStateInitial();

  @override
  String toString() {
    return 'JobsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JobsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel jobModel) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel jobModel)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel jobModel)? success,
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
    required TResult Function(JobsStateInitial value) initial,
    required TResult Function(JobsStateLoading value) loading,
    required TResult Function(JobsStateSuccess value) success,
    required TResult Function(JobsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JobsStateInitial value)? initial,
    TResult? Function(JobsStateLoading value)? loading,
    TResult? Function(JobsStateSuccess value)? success,
    TResult? Function(JobsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JobsStateInitial value)? initial,
    TResult Function(JobsStateLoading value)? loading,
    TResult Function(JobsStateSuccess value)? success,
    TResult Function(JobsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class JobsStateInitial implements JobsState {
  const factory JobsStateInitial() = _$JobsStateInitial;
}

/// @nodoc
abstract class _$$JobsStateLoadingCopyWith<$Res> {
  factory _$$JobsStateLoadingCopyWith(
          _$JobsStateLoading value, $Res Function(_$JobsStateLoading) then) =
      __$$JobsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JobsStateLoadingCopyWithImpl<$Res>
    extends _$JobsStateCopyWithImpl<$Res, _$JobsStateLoading>
    implements _$$JobsStateLoadingCopyWith<$Res> {
  __$$JobsStateLoadingCopyWithImpl(
      _$JobsStateLoading _value, $Res Function(_$JobsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JobsStateLoading implements JobsStateLoading {
  const _$JobsStateLoading();

  @override
  String toString() {
    return 'JobsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JobsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel jobModel) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel jobModel)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel jobModel)? success,
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
    required TResult Function(JobsStateInitial value) initial,
    required TResult Function(JobsStateLoading value) loading,
    required TResult Function(JobsStateSuccess value) success,
    required TResult Function(JobsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JobsStateInitial value)? initial,
    TResult? Function(JobsStateLoading value)? loading,
    TResult? Function(JobsStateSuccess value)? success,
    TResult? Function(JobsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JobsStateInitial value)? initial,
    TResult Function(JobsStateLoading value)? loading,
    TResult Function(JobsStateSuccess value)? success,
    TResult Function(JobsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class JobsStateLoading implements JobsState {
  const factory JobsStateLoading() = _$JobsStateLoading;
}

/// @nodoc
abstract class _$$JobsStateSuccessCopyWith<$Res> {
  factory _$$JobsStateSuccessCopyWith(
          _$JobsStateSuccess value, $Res Function(_$JobsStateSuccess) then) =
      __$$JobsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({JobModel jobModel});
}

/// @nodoc
class __$$JobsStateSuccessCopyWithImpl<$Res>
    extends _$JobsStateCopyWithImpl<$Res, _$JobsStateSuccess>
    implements _$$JobsStateSuccessCopyWith<$Res> {
  __$$JobsStateSuccessCopyWithImpl(
      _$JobsStateSuccess _value, $Res Function(_$JobsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobModel = null,
  }) {
    return _then(_$JobsStateSuccess(
      jobModel: null == jobModel
          ? _value.jobModel
          : jobModel // ignore: cast_nullable_to_non_nullable
              as JobModel,
    ));
  }
}

/// @nodoc

class _$JobsStateSuccess implements JobsStateSuccess {
  const _$JobsStateSuccess({required this.jobModel});

  @override
  final JobModel jobModel;

  @override
  String toString() {
    return 'JobsState.success(jobModel: $jobModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobsStateSuccess &&
            (identical(other.jobModel, jobModel) ||
                other.jobModel == jobModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobsStateSuccessCopyWith<_$JobsStateSuccess> get copyWith =>
      __$$JobsStateSuccessCopyWithImpl<_$JobsStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel jobModel) success,
    required TResult Function(String error) error,
  }) {
    return success(jobModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel jobModel)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(jobModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel jobModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(jobModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JobsStateInitial value) initial,
    required TResult Function(JobsStateLoading value) loading,
    required TResult Function(JobsStateSuccess value) success,
    required TResult Function(JobsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JobsStateInitial value)? initial,
    TResult? Function(JobsStateLoading value)? loading,
    TResult? Function(JobsStateSuccess value)? success,
    TResult? Function(JobsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JobsStateInitial value)? initial,
    TResult Function(JobsStateLoading value)? loading,
    TResult Function(JobsStateSuccess value)? success,
    TResult Function(JobsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class JobsStateSuccess implements JobsState {
  const factory JobsStateSuccess({required final JobModel jobModel}) =
      _$JobsStateSuccess;

  JobModel get jobModel;
  @JsonKey(ignore: true)
  _$$JobsStateSuccessCopyWith<_$JobsStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JobsStateErrorCopyWith<$Res> {
  factory _$$JobsStateErrorCopyWith(
          _$JobsStateError value, $Res Function(_$JobsStateError) then) =
      __$$JobsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$JobsStateErrorCopyWithImpl<$Res>
    extends _$JobsStateCopyWithImpl<$Res, _$JobsStateError>
    implements _$$JobsStateErrorCopyWith<$Res> {
  __$$JobsStateErrorCopyWithImpl(
      _$JobsStateError _value, $Res Function(_$JobsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$JobsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JobsStateError implements JobsStateError {
  const _$JobsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'JobsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobsStateErrorCopyWith<_$JobsStateError> get copyWith =>
      __$$JobsStateErrorCopyWithImpl<_$JobsStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel jobModel) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel jobModel)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel jobModel)? success,
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
    required TResult Function(JobsStateInitial value) initial,
    required TResult Function(JobsStateLoading value) loading,
    required TResult Function(JobsStateSuccess value) success,
    required TResult Function(JobsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JobsStateInitial value)? initial,
    TResult? Function(JobsStateLoading value)? loading,
    TResult? Function(JobsStateSuccess value)? success,
    TResult? Function(JobsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JobsStateInitial value)? initial,
    TResult Function(JobsStateLoading value)? loading,
    TResult Function(JobsStateSuccess value)? success,
    TResult Function(JobsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class JobsStateError implements JobsState {
  const factory JobsStateError({required final String error}) =
      _$JobsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$JobsStateErrorCopyWith<_$JobsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

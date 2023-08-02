// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ScheduleModel model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ScheduleModel model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ScheduleModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScheduleStateInitial value) initial,
    required TResult Function(ScheduleStateLoading value) loading,
    required TResult Function(ScheduleStateSuccess value) success,
    required TResult Function(ScheduleStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleStateInitial value)? initial,
    TResult? Function(ScheduleStateLoading value)? loading,
    TResult? Function(ScheduleStateSuccess value)? success,
    TResult? Function(ScheduleStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleStateInitial value)? initial,
    TResult Function(ScheduleStateLoading value)? loading,
    TResult Function(ScheduleStateSuccess value)? success,
    TResult Function(ScheduleStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res, ScheduleState>;
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res, $Val extends ScheduleState>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScheduleStateInitialCopyWith<$Res> {
  factory _$$ScheduleStateInitialCopyWith(_$ScheduleStateInitial value,
          $Res Function(_$ScheduleStateInitial) then) =
      __$$ScheduleStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScheduleStateInitialCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$ScheduleStateInitial>
    implements _$$ScheduleStateInitialCopyWith<$Res> {
  __$$ScheduleStateInitialCopyWithImpl(_$ScheduleStateInitial _value,
      $Res Function(_$ScheduleStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScheduleStateInitial implements ScheduleStateInitial {
  const _$ScheduleStateInitial();

  @override
  String toString() {
    return 'ScheduleState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScheduleStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ScheduleModel model) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ScheduleModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ScheduleModel model)? success,
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
    required TResult Function(ScheduleStateInitial value) initial,
    required TResult Function(ScheduleStateLoading value) loading,
    required TResult Function(ScheduleStateSuccess value) success,
    required TResult Function(ScheduleStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleStateInitial value)? initial,
    TResult? Function(ScheduleStateLoading value)? loading,
    TResult? Function(ScheduleStateSuccess value)? success,
    TResult? Function(ScheduleStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleStateInitial value)? initial,
    TResult Function(ScheduleStateLoading value)? loading,
    TResult Function(ScheduleStateSuccess value)? success,
    TResult Function(ScheduleStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ScheduleStateInitial implements ScheduleState {
  const factory ScheduleStateInitial() = _$ScheduleStateInitial;
}

/// @nodoc
abstract class _$$ScheduleStateLoadingCopyWith<$Res> {
  factory _$$ScheduleStateLoadingCopyWith(_$ScheduleStateLoading value,
          $Res Function(_$ScheduleStateLoading) then) =
      __$$ScheduleStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScheduleStateLoadingCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$ScheduleStateLoading>
    implements _$$ScheduleStateLoadingCopyWith<$Res> {
  __$$ScheduleStateLoadingCopyWithImpl(_$ScheduleStateLoading _value,
      $Res Function(_$ScheduleStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScheduleStateLoading implements ScheduleStateLoading {
  const _$ScheduleStateLoading();

  @override
  String toString() {
    return 'ScheduleState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScheduleStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ScheduleModel model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ScheduleModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ScheduleModel model)? success,
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
    required TResult Function(ScheduleStateInitial value) initial,
    required TResult Function(ScheduleStateLoading value) loading,
    required TResult Function(ScheduleStateSuccess value) success,
    required TResult Function(ScheduleStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleStateInitial value)? initial,
    TResult? Function(ScheduleStateLoading value)? loading,
    TResult? Function(ScheduleStateSuccess value)? success,
    TResult? Function(ScheduleStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleStateInitial value)? initial,
    TResult Function(ScheduleStateLoading value)? loading,
    TResult Function(ScheduleStateSuccess value)? success,
    TResult Function(ScheduleStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ScheduleStateLoading implements ScheduleState {
  const factory ScheduleStateLoading() = _$ScheduleStateLoading;
}

/// @nodoc
abstract class _$$ScheduleStateSuccessCopyWith<$Res> {
  factory _$$ScheduleStateSuccessCopyWith(_$ScheduleStateSuccess value,
          $Res Function(_$ScheduleStateSuccess) then) =
      __$$ScheduleStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({ScheduleModel model});
}

/// @nodoc
class __$$ScheduleStateSuccessCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$ScheduleStateSuccess>
    implements _$$ScheduleStateSuccessCopyWith<$Res> {
  __$$ScheduleStateSuccessCopyWithImpl(_$ScheduleStateSuccess _value,
      $Res Function(_$ScheduleStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$ScheduleStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ScheduleModel,
    ));
  }
}

/// @nodoc

class _$ScheduleStateSuccess implements ScheduleStateSuccess {
  const _$ScheduleStateSuccess({required this.model});

  @override
  final ScheduleModel model;

  @override
  String toString() {
    return 'ScheduleState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleStateSuccessCopyWith<_$ScheduleStateSuccess> get copyWith =>
      __$$ScheduleStateSuccessCopyWithImpl<_$ScheduleStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ScheduleModel model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ScheduleModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ScheduleModel model)? success,
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
    required TResult Function(ScheduleStateInitial value) initial,
    required TResult Function(ScheduleStateLoading value) loading,
    required TResult Function(ScheduleStateSuccess value) success,
    required TResult Function(ScheduleStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleStateInitial value)? initial,
    TResult? Function(ScheduleStateLoading value)? loading,
    TResult? Function(ScheduleStateSuccess value)? success,
    TResult? Function(ScheduleStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleStateInitial value)? initial,
    TResult Function(ScheduleStateLoading value)? loading,
    TResult Function(ScheduleStateSuccess value)? success,
    TResult Function(ScheduleStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ScheduleStateSuccess implements ScheduleState {
  const factory ScheduleStateSuccess({required final ScheduleModel model}) =
      _$ScheduleStateSuccess;

  ScheduleModel get model;
  @JsonKey(ignore: true)
  _$$ScheduleStateSuccessCopyWith<_$ScheduleStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScheduleStateErrorCopyWith<$Res> {
  factory _$$ScheduleStateErrorCopyWith(_$ScheduleStateError value,
          $Res Function(_$ScheduleStateError) then) =
      __$$ScheduleStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ScheduleStateErrorCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$ScheduleStateError>
    implements _$$ScheduleStateErrorCopyWith<$Res> {
  __$$ScheduleStateErrorCopyWithImpl(
      _$ScheduleStateError _value, $Res Function(_$ScheduleStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ScheduleStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScheduleStateError implements ScheduleStateError {
  const _$ScheduleStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ScheduleState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleStateErrorCopyWith<_$ScheduleStateError> get copyWith =>
      __$$ScheduleStateErrorCopyWithImpl<_$ScheduleStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ScheduleModel model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ScheduleModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ScheduleModel model)? success,
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
    required TResult Function(ScheduleStateInitial value) initial,
    required TResult Function(ScheduleStateLoading value) loading,
    required TResult Function(ScheduleStateSuccess value) success,
    required TResult Function(ScheduleStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleStateInitial value)? initial,
    TResult? Function(ScheduleStateLoading value)? loading,
    TResult? Function(ScheduleStateSuccess value)? success,
    TResult? Function(ScheduleStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleStateInitial value)? initial,
    TResult Function(ScheduleStateLoading value)? loading,
    TResult Function(ScheduleStateSuccess value)? success,
    TResult Function(ScheduleStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ScheduleStateError implements ScheduleState {
  const factory ScheduleStateError({required final String error}) =
      _$ScheduleStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ScheduleStateErrorCopyWith<_$ScheduleStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

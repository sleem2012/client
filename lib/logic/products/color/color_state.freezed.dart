// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductColor>? model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductColor>? model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductColor>? model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorStateInitial value) initial,
    required TResult Function(ColorStateLoading value) loading,
    required TResult Function(ColorStateSuccess value) success,
    required TResult Function(ColorStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorStateInitial value)? initial,
    TResult? Function(ColorStateLoading value)? loading,
    TResult? Function(ColorStateSuccess value)? success,
    TResult? Function(ColorStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorStateInitial value)? initial,
    TResult Function(ColorStateLoading value)? loading,
    TResult Function(ColorStateSuccess value)? success,
    TResult Function(ColorStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorStateCopyWith<$Res> {
  factory $ColorStateCopyWith(
          ColorState value, $Res Function(ColorState) then) =
      _$ColorStateCopyWithImpl<$Res, ColorState>;
}

/// @nodoc
class _$ColorStateCopyWithImpl<$Res, $Val extends ColorState>
    implements $ColorStateCopyWith<$Res> {
  _$ColorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ColorStateInitialCopyWith<$Res> {
  factory _$$ColorStateInitialCopyWith(
          _$ColorStateInitial value, $Res Function(_$ColorStateInitial) then) =
      __$$ColorStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ColorStateInitialCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorStateInitial>
    implements _$$ColorStateInitialCopyWith<$Res> {
  __$$ColorStateInitialCopyWithImpl(
      _$ColorStateInitial _value, $Res Function(_$ColorStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ColorStateInitial implements ColorStateInitial {
  const _$ColorStateInitial();

  @override
  String toString() {
    return 'ColorState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ColorStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductColor>? model) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductColor>? model)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductColor>? model)? success,
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
    required TResult Function(ColorStateInitial value) initial,
    required TResult Function(ColorStateLoading value) loading,
    required TResult Function(ColorStateSuccess value) success,
    required TResult Function(ColorStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorStateInitial value)? initial,
    TResult? Function(ColorStateLoading value)? loading,
    TResult? Function(ColorStateSuccess value)? success,
    TResult? Function(ColorStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorStateInitial value)? initial,
    TResult Function(ColorStateLoading value)? loading,
    TResult Function(ColorStateSuccess value)? success,
    TResult Function(ColorStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ColorStateInitial implements ColorState {
  const factory ColorStateInitial() = _$ColorStateInitial;
}

/// @nodoc
abstract class _$$ColorStateLoadingCopyWith<$Res> {
  factory _$$ColorStateLoadingCopyWith(
          _$ColorStateLoading value, $Res Function(_$ColorStateLoading) then) =
      __$$ColorStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ColorStateLoadingCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorStateLoading>
    implements _$$ColorStateLoadingCopyWith<$Res> {
  __$$ColorStateLoadingCopyWithImpl(
      _$ColorStateLoading _value, $Res Function(_$ColorStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ColorStateLoading implements ColorStateLoading {
  const _$ColorStateLoading();

  @override
  String toString() {
    return 'ColorState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ColorStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductColor>? model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductColor>? model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductColor>? model)? success,
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
    required TResult Function(ColorStateInitial value) initial,
    required TResult Function(ColorStateLoading value) loading,
    required TResult Function(ColorStateSuccess value) success,
    required TResult Function(ColorStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorStateInitial value)? initial,
    TResult? Function(ColorStateLoading value)? loading,
    TResult? Function(ColorStateSuccess value)? success,
    TResult? Function(ColorStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorStateInitial value)? initial,
    TResult Function(ColorStateLoading value)? loading,
    TResult Function(ColorStateSuccess value)? success,
    TResult Function(ColorStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ColorStateLoading implements ColorState {
  const factory ColorStateLoading() = _$ColorStateLoading;
}

/// @nodoc
abstract class _$$ColorStateSuccessCopyWith<$Res> {
  factory _$$ColorStateSuccessCopyWith(
          _$ColorStateSuccess value, $Res Function(_$ColorStateSuccess) then) =
      __$$ColorStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductColor>? model});
}

/// @nodoc
class __$$ColorStateSuccessCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorStateSuccess>
    implements _$$ColorStateSuccessCopyWith<$Res> {
  __$$ColorStateSuccessCopyWithImpl(
      _$ColorStateSuccess _value, $Res Function(_$ColorStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$ColorStateSuccess(
      model: freezed == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<ProductColor>?,
    ));
  }
}

/// @nodoc

class _$ColorStateSuccess implements ColorStateSuccess {
  const _$ColorStateSuccess({required final List<ProductColor>? model})
      : _model = model;

  final List<ProductColor>? _model;
  @override
  List<ProductColor>? get model {
    final value = _model;
    if (value == null) return null;
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ColorState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorStateSuccess &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorStateSuccessCopyWith<_$ColorStateSuccess> get copyWith =>
      __$$ColorStateSuccessCopyWithImpl<_$ColorStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductColor>? model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductColor>? model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductColor>? model)? success,
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
    required TResult Function(ColorStateInitial value) initial,
    required TResult Function(ColorStateLoading value) loading,
    required TResult Function(ColorStateSuccess value) success,
    required TResult Function(ColorStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorStateInitial value)? initial,
    TResult? Function(ColorStateLoading value)? loading,
    TResult? Function(ColorStateSuccess value)? success,
    TResult? Function(ColorStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorStateInitial value)? initial,
    TResult Function(ColorStateLoading value)? loading,
    TResult Function(ColorStateSuccess value)? success,
    TResult Function(ColorStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ColorStateSuccess implements ColorState {
  const factory ColorStateSuccess({required final List<ProductColor>? model}) =
      _$ColorStateSuccess;

  List<ProductColor>? get model;
  @JsonKey(ignore: true)
  _$$ColorStateSuccessCopyWith<_$ColorStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorStateErrorCopyWith<$Res> {
  factory _$$ColorStateErrorCopyWith(
          _$ColorStateError value, $Res Function(_$ColorStateError) then) =
      __$$ColorStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ColorStateErrorCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorStateError>
    implements _$$ColorStateErrorCopyWith<$Res> {
  __$$ColorStateErrorCopyWithImpl(
      _$ColorStateError _value, $Res Function(_$ColorStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ColorStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ColorStateError implements ColorStateError {
  const _$ColorStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ColorState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorStateErrorCopyWith<_$ColorStateError> get copyWith =>
      __$$ColorStateErrorCopyWithImpl<_$ColorStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProductColor>? model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProductColor>? model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProductColor>? model)? success,
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
    required TResult Function(ColorStateInitial value) initial,
    required TResult Function(ColorStateLoading value) loading,
    required TResult Function(ColorStateSuccess value) success,
    required TResult Function(ColorStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorStateInitial value)? initial,
    TResult? Function(ColorStateLoading value)? loading,
    TResult? Function(ColorStateSuccess value)? success,
    TResult? Function(ColorStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorStateInitial value)? initial,
    TResult Function(ColorStateLoading value)? loading,
    TResult Function(ColorStateSuccess value)? success,
    TResult Function(ColorStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ColorStateError implements ColorState {
  const factory ColorStateError({required final String error}) =
      _$ColorStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ColorStateErrorCopyWith<_$ColorStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

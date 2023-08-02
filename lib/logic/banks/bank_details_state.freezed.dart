// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserCompany model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserCompany model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserCompany model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BankDetailsStateLoading value) loading,
    required TResult Function(BankDetailsStateSuccess value) success,
    required TResult Function(BankDetailsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BankDetailsStateLoading value)? loading,
    TResult? Function(BankDetailsStateSuccess value)? success,
    TResult? Function(BankDetailsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BankDetailsStateLoading value)? loading,
    TResult Function(BankDetailsStateSuccess value)? success,
    TResult Function(BankDetailsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDetailsStateCopyWith<$Res> {
  factory $BankDetailsStateCopyWith(
          BankDetailsState value, $Res Function(BankDetailsState) then) =
      _$BankDetailsStateCopyWithImpl<$Res, BankDetailsState>;
}

/// @nodoc
class _$BankDetailsStateCopyWithImpl<$Res, $Val extends BankDetailsState>
    implements $BankDetailsStateCopyWith<$Res> {
  _$BankDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BankDetailsStateLoadingCopyWith<$Res> {
  factory _$$BankDetailsStateLoadingCopyWith(_$BankDetailsStateLoading value,
          $Res Function(_$BankDetailsStateLoading) then) =
      __$$BankDetailsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BankDetailsStateLoadingCopyWithImpl<$Res>
    extends _$BankDetailsStateCopyWithImpl<$Res, _$BankDetailsStateLoading>
    implements _$$BankDetailsStateLoadingCopyWith<$Res> {
  __$$BankDetailsStateLoadingCopyWithImpl(_$BankDetailsStateLoading _value,
      $Res Function(_$BankDetailsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BankDetailsStateLoading implements BankDetailsStateLoading {
  const _$BankDetailsStateLoading();

  @override
  String toString() {
    return 'BankDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserCompany model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserCompany model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserCompany model)? success,
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
    required TResult Function(BankDetailsStateLoading value) loading,
    required TResult Function(BankDetailsStateSuccess value) success,
    required TResult Function(BankDetailsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BankDetailsStateLoading value)? loading,
    TResult? Function(BankDetailsStateSuccess value)? success,
    TResult? Function(BankDetailsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BankDetailsStateLoading value)? loading,
    TResult Function(BankDetailsStateSuccess value)? success,
    TResult Function(BankDetailsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BankDetailsStateLoading implements BankDetailsState {
  const factory BankDetailsStateLoading() = _$BankDetailsStateLoading;
}

/// @nodoc
abstract class _$$BankDetailsStateSuccessCopyWith<$Res> {
  factory _$$BankDetailsStateSuccessCopyWith(_$BankDetailsStateSuccess value,
          $Res Function(_$BankDetailsStateSuccess) then) =
      __$$BankDetailsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCompany model});
}

/// @nodoc
class __$$BankDetailsStateSuccessCopyWithImpl<$Res>
    extends _$BankDetailsStateCopyWithImpl<$Res, _$BankDetailsStateSuccess>
    implements _$$BankDetailsStateSuccessCopyWith<$Res> {
  __$$BankDetailsStateSuccessCopyWithImpl(_$BankDetailsStateSuccess _value,
      $Res Function(_$BankDetailsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$BankDetailsStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as UserCompany,
    ));
  }
}

/// @nodoc

class _$BankDetailsStateSuccess implements BankDetailsStateSuccess {
  const _$BankDetailsStateSuccess({required this.model});

  @override
  final UserCompany model;

  @override
  String toString() {
    return 'BankDetailsState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailsStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankDetailsStateSuccessCopyWith<_$BankDetailsStateSuccess> get copyWith =>
      __$$BankDetailsStateSuccessCopyWithImpl<_$BankDetailsStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserCompany model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserCompany model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserCompany model)? success,
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
    required TResult Function(BankDetailsStateLoading value) loading,
    required TResult Function(BankDetailsStateSuccess value) success,
    required TResult Function(BankDetailsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BankDetailsStateLoading value)? loading,
    TResult? Function(BankDetailsStateSuccess value)? success,
    TResult? Function(BankDetailsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BankDetailsStateLoading value)? loading,
    TResult Function(BankDetailsStateSuccess value)? success,
    TResult Function(BankDetailsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BankDetailsStateSuccess implements BankDetailsState {
  const factory BankDetailsStateSuccess({required final UserCompany model}) =
      _$BankDetailsStateSuccess;

  UserCompany get model;
  @JsonKey(ignore: true)
  _$$BankDetailsStateSuccessCopyWith<_$BankDetailsStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BankDetailsStateErrorCopyWith<$Res> {
  factory _$$BankDetailsStateErrorCopyWith(_$BankDetailsStateError value,
          $Res Function(_$BankDetailsStateError) then) =
      __$$BankDetailsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$BankDetailsStateErrorCopyWithImpl<$Res>
    extends _$BankDetailsStateCopyWithImpl<$Res, _$BankDetailsStateError>
    implements _$$BankDetailsStateErrorCopyWith<$Res> {
  __$$BankDetailsStateErrorCopyWithImpl(_$BankDetailsStateError _value,
      $Res Function(_$BankDetailsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$BankDetailsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BankDetailsStateError implements BankDetailsStateError {
  const _$BankDetailsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'BankDetailsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankDetailsStateErrorCopyWith<_$BankDetailsStateError> get copyWith =>
      __$$BankDetailsStateErrorCopyWithImpl<_$BankDetailsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserCompany model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserCompany model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserCompany model)? success,
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
    required TResult Function(BankDetailsStateLoading value) loading,
    required TResult Function(BankDetailsStateSuccess value) success,
    required TResult Function(BankDetailsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BankDetailsStateLoading value)? loading,
    TResult? Function(BankDetailsStateSuccess value)? success,
    TResult? Function(BankDetailsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BankDetailsStateLoading value)? loading,
    TResult Function(BankDetailsStateSuccess value)? success,
    TResult Function(BankDetailsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BankDetailsStateError implements BankDetailsState {
  const factory BankDetailsStateError({required final String error}) =
      _$BankDetailsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$BankDetailsStateErrorCopyWith<_$BankDetailsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_request_quoet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetRequestQuoteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(RequestQuoteResponse quotes) success,
    required TResult Function(KFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(RequestQuoteResponse quotes)? success,
    TResult? Function(KFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(RequestQuoteResponse quotes)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRequestQuoteStateLoading value) loading,
    required TResult Function(GetRequestQuoteStateSuccess value) success,
    required TResult Function(GetRequestQuoteStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRequestQuoteStateLoading value)? loading,
    TResult? Function(GetRequestQuoteStateSuccess value)? success,
    TResult? Function(GetRequestQuoteStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRequestQuoteStateLoading value)? loading,
    TResult Function(GetRequestQuoteStateSuccess value)? success,
    TResult Function(GetRequestQuoteStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRequestQuoteStateCopyWith<$Res> {
  factory $GetRequestQuoteStateCopyWith(GetRequestQuoteState value,
          $Res Function(GetRequestQuoteState) then) =
      _$GetRequestQuoteStateCopyWithImpl<$Res, GetRequestQuoteState>;
}

/// @nodoc
class _$GetRequestQuoteStateCopyWithImpl<$Res,
        $Val extends GetRequestQuoteState>
    implements $GetRequestQuoteStateCopyWith<$Res> {
  _$GetRequestQuoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetRequestQuoteStateLoadingCopyWith<$Res> {
  factory _$$GetRequestQuoteStateLoadingCopyWith(
          _$GetRequestQuoteStateLoading value,
          $Res Function(_$GetRequestQuoteStateLoading) then) =
      __$$GetRequestQuoteStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRequestQuoteStateLoadingCopyWithImpl<$Res>
    extends _$GetRequestQuoteStateCopyWithImpl<$Res,
        _$GetRequestQuoteStateLoading>
    implements _$$GetRequestQuoteStateLoadingCopyWith<$Res> {
  __$$GetRequestQuoteStateLoadingCopyWithImpl(
      _$GetRequestQuoteStateLoading _value,
      $Res Function(_$GetRequestQuoteStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetRequestQuoteStateLoading implements GetRequestQuoteStateLoading {
  const _$GetRequestQuoteStateLoading();

  @override
  String toString() {
    return 'GetRequestQuoteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRequestQuoteStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(RequestQuoteResponse quotes) success,
    required TResult Function(KFailure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(RequestQuoteResponse quotes)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(RequestQuoteResponse quotes)? success,
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
    required TResult Function(GetRequestQuoteStateLoading value) loading,
    required TResult Function(GetRequestQuoteStateSuccess value) success,
    required TResult Function(GetRequestQuoteStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRequestQuoteStateLoading value)? loading,
    TResult? Function(GetRequestQuoteStateSuccess value)? success,
    TResult? Function(GetRequestQuoteStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRequestQuoteStateLoading value)? loading,
    TResult Function(GetRequestQuoteStateSuccess value)? success,
    TResult Function(GetRequestQuoteStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetRequestQuoteStateLoading implements GetRequestQuoteState {
  const factory GetRequestQuoteStateLoading() = _$GetRequestQuoteStateLoading;
}

/// @nodoc
abstract class _$$GetRequestQuoteStateSuccessCopyWith<$Res> {
  factory _$$GetRequestQuoteStateSuccessCopyWith(
          _$GetRequestQuoteStateSuccess value,
          $Res Function(_$GetRequestQuoteStateSuccess) then) =
      __$$GetRequestQuoteStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({RequestQuoteResponse quotes});
}

/// @nodoc
class __$$GetRequestQuoteStateSuccessCopyWithImpl<$Res>
    extends _$GetRequestQuoteStateCopyWithImpl<$Res,
        _$GetRequestQuoteStateSuccess>
    implements _$$GetRequestQuoteStateSuccessCopyWith<$Res> {
  __$$GetRequestQuoteStateSuccessCopyWithImpl(
      _$GetRequestQuoteStateSuccess _value,
      $Res Function(_$GetRequestQuoteStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quotes = null,
  }) {
    return _then(_$GetRequestQuoteStateSuccess(
      null == quotes
          ? _value.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as RequestQuoteResponse,
    ));
  }
}

/// @nodoc

class _$GetRequestQuoteStateSuccess implements GetRequestQuoteStateSuccess {
  const _$GetRequestQuoteStateSuccess(this.quotes);

  @override
  final RequestQuoteResponse quotes;

  @override
  String toString() {
    return 'GetRequestQuoteState.success(quotes: $quotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRequestQuoteStateSuccess &&
            (identical(other.quotes, quotes) || other.quotes == quotes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRequestQuoteStateSuccessCopyWith<_$GetRequestQuoteStateSuccess>
      get copyWith => __$$GetRequestQuoteStateSuccessCopyWithImpl<
          _$GetRequestQuoteStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(RequestQuoteResponse quotes) success,
    required TResult Function(KFailure error) error,
  }) {
    return success(quotes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(RequestQuoteResponse quotes)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return success?.call(quotes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(RequestQuoteResponse quotes)? success,
    TResult Function(KFailure error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(quotes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRequestQuoteStateLoading value) loading,
    required TResult Function(GetRequestQuoteStateSuccess value) success,
    required TResult Function(GetRequestQuoteStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRequestQuoteStateLoading value)? loading,
    TResult? Function(GetRequestQuoteStateSuccess value)? success,
    TResult? Function(GetRequestQuoteStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRequestQuoteStateLoading value)? loading,
    TResult Function(GetRequestQuoteStateSuccess value)? success,
    TResult Function(GetRequestQuoteStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetRequestQuoteStateSuccess implements GetRequestQuoteState {
  const factory GetRequestQuoteStateSuccess(final RequestQuoteResponse quotes) =
      _$GetRequestQuoteStateSuccess;

  RequestQuoteResponse get quotes;
  @JsonKey(ignore: true)
  _$$GetRequestQuoteStateSuccessCopyWith<_$GetRequestQuoteStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRequestQuoteStateErrorCopyWith<$Res> {
  factory _$$GetRequestQuoteStateErrorCopyWith(
          _$GetRequestQuoteStateError value,
          $Res Function(_$GetRequestQuoteStateError) then) =
      __$$GetRequestQuoteStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure error});

  $KFailureCopyWith<$Res> get error;
}

/// @nodoc
class __$$GetRequestQuoteStateErrorCopyWithImpl<$Res>
    extends _$GetRequestQuoteStateCopyWithImpl<$Res,
        _$GetRequestQuoteStateError>
    implements _$$GetRequestQuoteStateErrorCopyWith<$Res> {
  __$$GetRequestQuoteStateErrorCopyWithImpl(_$GetRequestQuoteStateError _value,
      $Res Function(_$GetRequestQuoteStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetRequestQuoteStateError(
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

class _$GetRequestQuoteStateError implements GetRequestQuoteStateError {
  const _$GetRequestQuoteStateError({required this.error});

  @override
  final KFailure error;

  @override
  String toString() {
    return 'GetRequestQuoteState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRequestQuoteStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRequestQuoteStateErrorCopyWith<_$GetRequestQuoteStateError>
      get copyWith => __$$GetRequestQuoteStateErrorCopyWithImpl<
          _$GetRequestQuoteStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(RequestQuoteResponse quotes) success,
    required TResult Function(KFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(RequestQuoteResponse quotes)? success,
    TResult? Function(KFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(RequestQuoteResponse quotes)? success,
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
    required TResult Function(GetRequestQuoteStateLoading value) loading,
    required TResult Function(GetRequestQuoteStateSuccess value) success,
    required TResult Function(GetRequestQuoteStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRequestQuoteStateLoading value)? loading,
    TResult? Function(GetRequestQuoteStateSuccess value)? success,
    TResult? Function(GetRequestQuoteStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRequestQuoteStateLoading value)? loading,
    TResult Function(GetRequestQuoteStateSuccess value)? success,
    TResult Function(GetRequestQuoteStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetRequestQuoteStateError implements GetRequestQuoteState {
  const factory GetRequestQuoteStateError({required final KFailure error}) =
      _$GetRequestQuoteStateError;

  KFailure get error;
  @JsonKey(ignore: true)
  _$$GetRequestQuoteStateErrorCopyWith<_$GetRequestQuoteStateError>
      get copyWith => throw _privateConstructorUsedError;
}

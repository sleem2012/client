// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ReviewModel reviewModel) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ReviewModel reviewModel)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ReviewModel reviewModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewsStateLoading value) loading,
    required TResult Function(ReviewsStateSuccess value) success,
    required TResult Function(ReviewsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsStateLoading value)? loading,
    TResult? Function(ReviewsStateSuccess value)? success,
    TResult? Function(ReviewsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsStateLoading value)? loading,
    TResult Function(ReviewsStateSuccess value)? success,
    TResult Function(ReviewsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsStateCopyWith<$Res> {
  factory $ReviewsStateCopyWith(
          ReviewsState value, $Res Function(ReviewsState) then) =
      _$ReviewsStateCopyWithImpl<$Res, ReviewsState>;
}

/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res, $Val extends ReviewsState>
    implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReviewsStateLoadingCopyWith<$Res> {
  factory _$$ReviewsStateLoadingCopyWith(_$ReviewsStateLoading value,
          $Res Function(_$ReviewsStateLoading) then) =
      __$$ReviewsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReviewsStateLoadingCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsStateLoading>
    implements _$$ReviewsStateLoadingCopyWith<$Res> {
  __$$ReviewsStateLoadingCopyWithImpl(
      _$ReviewsStateLoading _value, $Res Function(_$ReviewsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReviewsStateLoading implements ReviewsStateLoading {
  const _$ReviewsStateLoading();

  @override
  String toString() {
    return 'ReviewsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReviewsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ReviewModel reviewModel) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ReviewModel reviewModel)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ReviewModel reviewModel)? success,
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
    required TResult Function(ReviewsStateLoading value) loading,
    required TResult Function(ReviewsStateSuccess value) success,
    required TResult Function(ReviewsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsStateLoading value)? loading,
    TResult? Function(ReviewsStateSuccess value)? success,
    TResult? Function(ReviewsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsStateLoading value)? loading,
    TResult Function(ReviewsStateSuccess value)? success,
    TResult Function(ReviewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReviewsStateLoading implements ReviewsState {
  const factory ReviewsStateLoading() = _$ReviewsStateLoading;
}

/// @nodoc
abstract class _$$ReviewsStateSuccessCopyWith<$Res> {
  factory _$$ReviewsStateSuccessCopyWith(_$ReviewsStateSuccess value,
          $Res Function(_$ReviewsStateSuccess) then) =
      __$$ReviewsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewModel reviewModel});
}

/// @nodoc
class __$$ReviewsStateSuccessCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsStateSuccess>
    implements _$$ReviewsStateSuccessCopyWith<$Res> {
  __$$ReviewsStateSuccessCopyWithImpl(
      _$ReviewsStateSuccess _value, $Res Function(_$ReviewsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewModel = null,
  }) {
    return _then(_$ReviewsStateSuccess(
      reviewModel: null == reviewModel
          ? _value.reviewModel
          : reviewModel // ignore: cast_nullable_to_non_nullable
              as ReviewModel,
    ));
  }
}

/// @nodoc

class _$ReviewsStateSuccess implements ReviewsStateSuccess {
  const _$ReviewsStateSuccess({required this.reviewModel});

  @override
  final ReviewModel reviewModel;

  @override
  String toString() {
    return 'ReviewsState.success(reviewModel: $reviewModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsStateSuccess &&
            (identical(other.reviewModel, reviewModel) ||
                other.reviewModel == reviewModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reviewModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsStateSuccessCopyWith<_$ReviewsStateSuccess> get copyWith =>
      __$$ReviewsStateSuccessCopyWithImpl<_$ReviewsStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ReviewModel reviewModel) success,
    required TResult Function(String error) error,
  }) {
    return success(reviewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ReviewModel reviewModel)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(reviewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ReviewModel reviewModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(reviewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewsStateLoading value) loading,
    required TResult Function(ReviewsStateSuccess value) success,
    required TResult Function(ReviewsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsStateLoading value)? loading,
    TResult? Function(ReviewsStateSuccess value)? success,
    TResult? Function(ReviewsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsStateLoading value)? loading,
    TResult Function(ReviewsStateSuccess value)? success,
    TResult Function(ReviewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ReviewsStateSuccess implements ReviewsState {
  const factory ReviewsStateSuccess({required final ReviewModel reviewModel}) =
      _$ReviewsStateSuccess;

  ReviewModel get reviewModel;
  @JsonKey(ignore: true)
  _$$ReviewsStateSuccessCopyWith<_$ReviewsStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReviewsStateErrorCopyWith<$Res> {
  factory _$$ReviewsStateErrorCopyWith(
          _$ReviewsStateError value, $Res Function(_$ReviewsStateError) then) =
      __$$ReviewsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ReviewsStateErrorCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsStateError>
    implements _$$ReviewsStateErrorCopyWith<$Res> {
  __$$ReviewsStateErrorCopyWithImpl(
      _$ReviewsStateError _value, $Res Function(_$ReviewsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ReviewsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReviewsStateError implements ReviewsStateError {
  const _$ReviewsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ReviewsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsStateErrorCopyWith<_$ReviewsStateError> get copyWith =>
      __$$ReviewsStateErrorCopyWithImpl<_$ReviewsStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ReviewModel reviewModel) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ReviewModel reviewModel)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ReviewModel reviewModel)? success,
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
    required TResult Function(ReviewsStateLoading value) loading,
    required TResult Function(ReviewsStateSuccess value) success,
    required TResult Function(ReviewsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsStateLoading value)? loading,
    TResult? Function(ReviewsStateSuccess value)? success,
    TResult? Function(ReviewsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsStateLoading value)? loading,
    TResult Function(ReviewsStateSuccess value)? success,
    TResult Function(ReviewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReviewsStateError implements ReviewsState {
  const factory ReviewsStateError({required final String error}) =
      _$ReviewsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ReviewsStateErrorCopyWith<_$ReviewsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

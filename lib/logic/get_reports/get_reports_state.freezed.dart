// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetReportsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ReportData> reports) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ReportData> reports)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ReportData> reports)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetReportsStateLoading value) loading,
    required TResult Function(GetReportsStateSuccess value) success,
    required TResult Function(GetReportsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetReportsStateLoading value)? loading,
    TResult? Function(GetReportsStateSuccess value)? success,
    TResult? Function(GetReportsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetReportsStateLoading value)? loading,
    TResult Function(GetReportsStateSuccess value)? success,
    TResult Function(GetReportsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReportsStateCopyWith<$Res> {
  factory $GetReportsStateCopyWith(
          GetReportsState value, $Res Function(GetReportsState) then) =
      _$GetReportsStateCopyWithImpl<$Res, GetReportsState>;
}

/// @nodoc
class _$GetReportsStateCopyWithImpl<$Res, $Val extends GetReportsState>
    implements $GetReportsStateCopyWith<$Res> {
  _$GetReportsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetReportsStateLoadingCopyWith<$Res> {
  factory _$$GetReportsStateLoadingCopyWith(_$GetReportsStateLoading value,
          $Res Function(_$GetReportsStateLoading) then) =
      __$$GetReportsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetReportsStateLoadingCopyWithImpl<$Res>
    extends _$GetReportsStateCopyWithImpl<$Res, _$GetReportsStateLoading>
    implements _$$GetReportsStateLoadingCopyWith<$Res> {
  __$$GetReportsStateLoadingCopyWithImpl(_$GetReportsStateLoading _value,
      $Res Function(_$GetReportsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetReportsStateLoading implements GetReportsStateLoading {
  const _$GetReportsStateLoading();

  @override
  String toString() {
    return 'GetReportsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetReportsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ReportData> reports) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ReportData> reports)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ReportData> reports)? success,
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
    required TResult Function(GetReportsStateLoading value) loading,
    required TResult Function(GetReportsStateSuccess value) success,
    required TResult Function(GetReportsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetReportsStateLoading value)? loading,
    TResult? Function(GetReportsStateSuccess value)? success,
    TResult? Function(GetReportsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetReportsStateLoading value)? loading,
    TResult Function(GetReportsStateSuccess value)? success,
    TResult Function(GetReportsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetReportsStateLoading implements GetReportsState {
  const factory GetReportsStateLoading() = _$GetReportsStateLoading;
}

/// @nodoc
abstract class _$$GetReportsStateSuccessCopyWith<$Res> {
  factory _$$GetReportsStateSuccessCopyWith(_$GetReportsStateSuccess value,
          $Res Function(_$GetReportsStateSuccess) then) =
      __$$GetReportsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReportData> reports});
}

/// @nodoc
class __$$GetReportsStateSuccessCopyWithImpl<$Res>
    extends _$GetReportsStateCopyWithImpl<$Res, _$GetReportsStateSuccess>
    implements _$$GetReportsStateSuccessCopyWith<$Res> {
  __$$GetReportsStateSuccessCopyWithImpl(_$GetReportsStateSuccess _value,
      $Res Function(_$GetReportsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
  }) {
    return _then(_$GetReportsStateSuccess(
      null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportData>,
    ));
  }
}

/// @nodoc

class _$GetReportsStateSuccess implements GetReportsStateSuccess {
  const _$GetReportsStateSuccess(final List<ReportData> reports)
      : _reports = reports;

  final List<ReportData> _reports;
  @override
  List<ReportData> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  String toString() {
    return 'GetReportsState.success(reports: $reports)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReportsStateSuccess &&
            const DeepCollectionEquality().equals(other._reports, _reports));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reports));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReportsStateSuccessCopyWith<_$GetReportsStateSuccess> get copyWith =>
      __$$GetReportsStateSuccessCopyWithImpl<_$GetReportsStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ReportData> reports) success,
    required TResult Function(String error) error,
  }) {
    return success(reports);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ReportData> reports)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(reports);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ReportData> reports)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(reports);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetReportsStateLoading value) loading,
    required TResult Function(GetReportsStateSuccess value) success,
    required TResult Function(GetReportsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetReportsStateLoading value)? loading,
    TResult? Function(GetReportsStateSuccess value)? success,
    TResult? Function(GetReportsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetReportsStateLoading value)? loading,
    TResult Function(GetReportsStateSuccess value)? success,
    TResult Function(GetReportsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetReportsStateSuccess implements GetReportsState {
  const factory GetReportsStateSuccess(final List<ReportData> reports) =
      _$GetReportsStateSuccess;

  List<ReportData> get reports;
  @JsonKey(ignore: true)
  _$$GetReportsStateSuccessCopyWith<_$GetReportsStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetReportsStateErrorCopyWith<$Res> {
  factory _$$GetReportsStateErrorCopyWith(_$GetReportsStateError value,
          $Res Function(_$GetReportsStateError) then) =
      __$$GetReportsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetReportsStateErrorCopyWithImpl<$Res>
    extends _$GetReportsStateCopyWithImpl<$Res, _$GetReportsStateError>
    implements _$$GetReportsStateErrorCopyWith<$Res> {
  __$$GetReportsStateErrorCopyWithImpl(_$GetReportsStateError _value,
      $Res Function(_$GetReportsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetReportsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetReportsStateError implements GetReportsStateError {
  const _$GetReportsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetReportsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReportsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReportsStateErrorCopyWith<_$GetReportsStateError> get copyWith =>
      __$$GetReportsStateErrorCopyWithImpl<_$GetReportsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ReportData> reports) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ReportData> reports)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ReportData> reports)? success,
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
    required TResult Function(GetReportsStateLoading value) loading,
    required TResult Function(GetReportsStateSuccess value) success,
    required TResult Function(GetReportsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetReportsStateLoading value)? loading,
    TResult? Function(GetReportsStateSuccess value)? success,
    TResult? Function(GetReportsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetReportsStateLoading value)? loading,
    TResult Function(GetReportsStateSuccess value)? success,
    TResult Function(GetReportsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetReportsStateError implements GetReportsState {
  const factory GetReportsStateError({required final String error}) =
      _$GetReportsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$GetReportsStateErrorCopyWith<_$GetReportsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddAddressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressData addressData) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressData addressData)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressData addressData)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddAddressStateInitial value) initial,
    required TResult Function(AddAddressStateLoading value) loading,
    required TResult Function(AddAddressStateSuccess value) success,
    required TResult Function(AddAddressStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddAddressStateInitial value)? initial,
    TResult? Function(AddAddressStateLoading value)? loading,
    TResult? Function(AddAddressStateSuccess value)? success,
    TResult? Function(AddAddressStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddAddressStateInitial value)? initial,
    TResult Function(AddAddressStateLoading value)? loading,
    TResult Function(AddAddressStateSuccess value)? success,
    TResult Function(AddAddressStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAddressStateCopyWith<$Res> {
  factory $AddAddressStateCopyWith(
          AddAddressState value, $Res Function(AddAddressState) then) =
      _$AddAddressStateCopyWithImpl<$Res, AddAddressState>;
}

/// @nodoc
class _$AddAddressStateCopyWithImpl<$Res, $Val extends AddAddressState>
    implements $AddAddressStateCopyWith<$Res> {
  _$AddAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddAddressStateInitialCopyWith<$Res> {
  factory _$$AddAddressStateInitialCopyWith(_$AddAddressStateInitial value,
          $Res Function(_$AddAddressStateInitial) then) =
      __$$AddAddressStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddAddressStateInitialCopyWithImpl<$Res>
    extends _$AddAddressStateCopyWithImpl<$Res, _$AddAddressStateInitial>
    implements _$$AddAddressStateInitialCopyWith<$Res> {
  __$$AddAddressStateInitialCopyWithImpl(_$AddAddressStateInitial _value,
      $Res Function(_$AddAddressStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddAddressStateInitial implements AddAddressStateInitial {
  const _$AddAddressStateInitial();

  @override
  String toString() {
    return 'AddAddressState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddAddressStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressData addressData) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressData addressData)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressData addressData)? success,
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
    required TResult Function(AddAddressStateInitial value) initial,
    required TResult Function(AddAddressStateLoading value) loading,
    required TResult Function(AddAddressStateSuccess value) success,
    required TResult Function(AddAddressStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddAddressStateInitial value)? initial,
    TResult? Function(AddAddressStateLoading value)? loading,
    TResult? Function(AddAddressStateSuccess value)? success,
    TResult? Function(AddAddressStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddAddressStateInitial value)? initial,
    TResult Function(AddAddressStateLoading value)? loading,
    TResult Function(AddAddressStateSuccess value)? success,
    TResult Function(AddAddressStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AddAddressStateInitial implements AddAddressState {
  const factory AddAddressStateInitial() = _$AddAddressStateInitial;
}

/// @nodoc
abstract class _$$AddAddressStateLoadingCopyWith<$Res> {
  factory _$$AddAddressStateLoadingCopyWith(_$AddAddressStateLoading value,
          $Res Function(_$AddAddressStateLoading) then) =
      __$$AddAddressStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddAddressStateLoadingCopyWithImpl<$Res>
    extends _$AddAddressStateCopyWithImpl<$Res, _$AddAddressStateLoading>
    implements _$$AddAddressStateLoadingCopyWith<$Res> {
  __$$AddAddressStateLoadingCopyWithImpl(_$AddAddressStateLoading _value,
      $Res Function(_$AddAddressStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddAddressStateLoading implements AddAddressStateLoading {
  const _$AddAddressStateLoading();

  @override
  String toString() {
    return 'AddAddressState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddAddressStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressData addressData) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressData addressData)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressData addressData)? success,
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
    required TResult Function(AddAddressStateInitial value) initial,
    required TResult Function(AddAddressStateLoading value) loading,
    required TResult Function(AddAddressStateSuccess value) success,
    required TResult Function(AddAddressStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddAddressStateInitial value)? initial,
    TResult? Function(AddAddressStateLoading value)? loading,
    TResult? Function(AddAddressStateSuccess value)? success,
    TResult? Function(AddAddressStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddAddressStateInitial value)? initial,
    TResult Function(AddAddressStateLoading value)? loading,
    TResult Function(AddAddressStateSuccess value)? success,
    TResult Function(AddAddressStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddAddressStateLoading implements AddAddressState {
  const factory AddAddressStateLoading() = _$AddAddressStateLoading;
}

/// @nodoc
abstract class _$$AddAddressStateSuccessCopyWith<$Res> {
  factory _$$AddAddressStateSuccessCopyWith(_$AddAddressStateSuccess value,
          $Res Function(_$AddAddressStateSuccess) then) =
      __$$AddAddressStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressData addressData});
}

/// @nodoc
class __$$AddAddressStateSuccessCopyWithImpl<$Res>
    extends _$AddAddressStateCopyWithImpl<$Res, _$AddAddressStateSuccess>
    implements _$$AddAddressStateSuccessCopyWith<$Res> {
  __$$AddAddressStateSuccessCopyWithImpl(_$AddAddressStateSuccess _value,
      $Res Function(_$AddAddressStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressData = null,
  }) {
    return _then(_$AddAddressStateSuccess(
      addressData: null == addressData
          ? _value.addressData
          : addressData // ignore: cast_nullable_to_non_nullable
              as AddressData,
    ));
  }
}

/// @nodoc

class _$AddAddressStateSuccess implements AddAddressStateSuccess {
  const _$AddAddressStateSuccess({required this.addressData});

  @override
  final AddressData addressData;

  @override
  String toString() {
    return 'AddAddressState.success(addressData: $addressData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAddressStateSuccess &&
            (identical(other.addressData, addressData) ||
                other.addressData == addressData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAddressStateSuccessCopyWith<_$AddAddressStateSuccess> get copyWith =>
      __$$AddAddressStateSuccessCopyWithImpl<_$AddAddressStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressData addressData) success,
    required TResult Function(String error) error,
  }) {
    return success(addressData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressData addressData)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(addressData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressData addressData)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(addressData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddAddressStateInitial value) initial,
    required TResult Function(AddAddressStateLoading value) loading,
    required TResult Function(AddAddressStateSuccess value) success,
    required TResult Function(AddAddressStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddAddressStateInitial value)? initial,
    TResult? Function(AddAddressStateLoading value)? loading,
    TResult? Function(AddAddressStateSuccess value)? success,
    TResult? Function(AddAddressStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddAddressStateInitial value)? initial,
    TResult Function(AddAddressStateLoading value)? loading,
    TResult Function(AddAddressStateSuccess value)? success,
    TResult Function(AddAddressStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AddAddressStateSuccess implements AddAddressState {
  const factory AddAddressStateSuccess(
      {required final AddressData addressData}) = _$AddAddressStateSuccess;

  AddressData get addressData;
  @JsonKey(ignore: true)
  _$$AddAddressStateSuccessCopyWith<_$AddAddressStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAddressStateErrorCopyWith<$Res> {
  factory _$$AddAddressStateErrorCopyWith(_$AddAddressStateError value,
          $Res Function(_$AddAddressStateError) then) =
      __$$AddAddressStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AddAddressStateErrorCopyWithImpl<$Res>
    extends _$AddAddressStateCopyWithImpl<$Res, _$AddAddressStateError>
    implements _$$AddAddressStateErrorCopyWith<$Res> {
  __$$AddAddressStateErrorCopyWithImpl(_$AddAddressStateError _value,
      $Res Function(_$AddAddressStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AddAddressStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddAddressStateError implements AddAddressStateError {
  const _$AddAddressStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AddAddressState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAddressStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAddressStateErrorCopyWith<_$AddAddressStateError> get copyWith =>
      __$$AddAddressStateErrorCopyWithImpl<_$AddAddressStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressData addressData) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressData addressData)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressData addressData)? success,
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
    required TResult Function(AddAddressStateInitial value) initial,
    required TResult Function(AddAddressStateLoading value) loading,
    required TResult Function(AddAddressStateSuccess value) success,
    required TResult Function(AddAddressStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddAddressStateInitial value)? initial,
    TResult? Function(AddAddressStateLoading value)? loading,
    TResult? Function(AddAddressStateSuccess value)? success,
    TResult? Function(AddAddressStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddAddressStateInitial value)? initial,
    TResult Function(AddAddressStateLoading value)? loading,
    TResult Function(AddAddressStateSuccess value)? success,
    TResult Function(AddAddressStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddAddressStateError implements AddAddressState {
  const factory AddAddressStateError({required final String error}) =
      _$AddAddressStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$AddAddressStateErrorCopyWith<_$AddAddressStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

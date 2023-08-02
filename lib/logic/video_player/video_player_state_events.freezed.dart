// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_player_state_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoPlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VideoPlayerStateLoading value) loading,
    required TResult Function(_VideoPlayerStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VideoPlayerStateLoading value)? loading,
    TResult? Function(_VideoPlayerStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VideoPlayerStateLoading value)? loading,
    TResult Function(_VideoPlayerStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPlayerStateCopyWith<$Res> {
  factory $VideoPlayerStateCopyWith(
          VideoPlayerState value, $Res Function(VideoPlayerState) then) =
      _$VideoPlayerStateCopyWithImpl<$Res, VideoPlayerState>;
}

/// @nodoc
class _$VideoPlayerStateCopyWithImpl<$Res, $Val extends VideoPlayerState>
    implements $VideoPlayerStateCopyWith<$Res> {
  _$VideoPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_VideoPlayerStateLoadingCopyWith<$Res> {
  factory _$$_VideoPlayerStateLoadingCopyWith(_$_VideoPlayerStateLoading value,
          $Res Function(_$_VideoPlayerStateLoading) then) =
      __$$_VideoPlayerStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_VideoPlayerStateLoadingCopyWithImpl<$Res>
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$_VideoPlayerStateLoading>
    implements _$$_VideoPlayerStateLoadingCopyWith<$Res> {
  __$$_VideoPlayerStateLoadingCopyWithImpl(_$_VideoPlayerStateLoading _value,
      $Res Function(_$_VideoPlayerStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_VideoPlayerStateLoading implements _VideoPlayerStateLoading {
  const _$_VideoPlayerStateLoading();

  @override
  String toString() {
    return 'VideoPlayerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoPlayerStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)?
        loaded,
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
    required TResult Function(_VideoPlayerStateLoading value) loading,
    required TResult Function(_VideoPlayerStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VideoPlayerStateLoading value)? loading,
    TResult? Function(_VideoPlayerStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VideoPlayerStateLoading value)? loading,
    TResult Function(_VideoPlayerStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _VideoPlayerStateLoading implements VideoPlayerState {
  const factory _VideoPlayerStateLoading() = _$_VideoPlayerStateLoading;
}

/// @nodoc
abstract class _$$_VideoPlayerStateLoadedCopyWith<$Res> {
  factory _$$_VideoPlayerStateLoadedCopyWith(_$_VideoPlayerStateLoaded value,
          $Res Function(_$_VideoPlayerStateLoaded) then) =
      __$$_VideoPlayerStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VideoPlayerController controller,
      double duration,
      double position,
      bool isPlaying});
}

/// @nodoc
class __$$_VideoPlayerStateLoadedCopyWithImpl<$Res>
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$_VideoPlayerStateLoaded>
    implements _$$_VideoPlayerStateLoadedCopyWith<$Res> {
  __$$_VideoPlayerStateLoadedCopyWithImpl(_$_VideoPlayerStateLoaded _value,
      $Res Function(_$_VideoPlayerStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? duration = null,
    Object? position = null,
    Object? isPlaying = null,
  }) {
    return _then(_$_VideoPlayerStateLoaded(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as double,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_VideoPlayerStateLoaded implements _VideoPlayerStateLoaded {
  const _$_VideoPlayerStateLoaded(
      {required this.controller,
      required this.duration,
      required this.position,
      required this.isPlaying});

  @override
  final VideoPlayerController controller;
  @override
  final double duration;
  @override
  final double position;
  @override
  final bool isPlaying;

  @override
  String toString() {
    return 'VideoPlayerState.loaded(controller: $controller, duration: $duration, position: $position, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoPlayerStateLoaded &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, controller, duration, position, isPlaying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoPlayerStateLoadedCopyWith<_$_VideoPlayerStateLoaded> get copyWith =>
      __$$_VideoPlayerStateLoadedCopyWithImpl<_$_VideoPlayerStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)
        loaded,
  }) {
    return loaded(controller, duration, position, isPlaying);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)?
        loaded,
  }) {
    return loaded?.call(controller, duration, position, isPlaying);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(VideoPlayerController controller, double duration,
            double position, bool isPlaying)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(controller, duration, position, isPlaying);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VideoPlayerStateLoading value) loading,
    required TResult Function(_VideoPlayerStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VideoPlayerStateLoading value)? loading,
    TResult? Function(_VideoPlayerStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VideoPlayerStateLoading value)? loading,
    TResult Function(_VideoPlayerStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _VideoPlayerStateLoaded implements VideoPlayerState {
  const factory _VideoPlayerStateLoaded(
      {required final VideoPlayerController controller,
      required final double duration,
      required final double position,
      required final bool isPlaying}) = _$_VideoPlayerStateLoaded;

  VideoPlayerController get controller;
  double get duration;
  double get position;
  bool get isPlaying;
  @JsonKey(ignore: true)
  _$$_VideoPlayerStateLoadedCopyWith<_$_VideoPlayerStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

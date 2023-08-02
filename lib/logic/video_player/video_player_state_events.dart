import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';
part 'video_player_state_events.freezed.dart';


@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState.loading() = _VideoPlayerStateLoading;
  const factory VideoPlayerState.loaded({
    required VideoPlayerController controller,
    required double duration,
    required double position,
    required bool isPlaying,
  }) = _VideoPlayerStateLoaded;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
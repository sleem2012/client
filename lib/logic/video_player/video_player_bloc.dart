import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'video_player_state_events.dart';
import '../../packages/cache/locale_storage.dart';
import '../../shared/localization/trans.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerBloc extends Cubit<VideoPlayerState> {
  VideoPlayerBloc() : super(const VideoPlayerState.loading());

  static VideoPlayerBloc of(BuildContext context) {
    return BlocProvider.of<VideoPlayerBloc>(context);
  }

  late VideoPlayerController controller;
  late double duration, position = 0;
  String error = '';
  Timer timer = Timer(const Duration(milliseconds: 500), () {});
  bool seeking = false;
  bool isMuted = true;

  final String dummyVid = 'https://forall.4all.ltd/uploads/Setting/video/b026c13176bbceefb46a61eb6a26ebd192cb5609.mp4';

  FutureOr<void> initPlayer() async {
    controller = VideoPlayerController.network(KStorage.i.getvideo ?? dummyVid);
    await controller.initialize().then(
      (_) {
        duration = controller.value.duration.inSeconds.toDouble();
        error = '';
        emit(VideoPlayerState.loaded(controller: controller, duration: duration, position: position, isPlaying: controller.value.isPlaying));
      },
    ).onError((error, stackTrace) {
      error = Tr.get.cantPlayVideo;
    });
  }

  FutureOr<void> addListener() async {
    controller.addListener(() {
      if ((controller.value.isPlaying && !timer.isActive) && !seeking) {
        controller.position.then((value) {
          position = value != null ? value.inSeconds.toDouble() : 0.0;
          timer = Timer(const Duration(milliseconds: 500), () {});
        }).whenComplete(() {
          // ignore: invalid_use_of_visible_for_testing_member
          emit(VideoPlayerState.loaded(controller: controller, duration: duration, position: position, isPlaying: controller.value.isPlaying));
        });
      }
    });
  }

  FutureOr<void> togglePlayer() {
    controller.value.isPlaying ? controller.pause() : controller.play();
    emit(VideoPlayerState.loaded(controller: controller, duration: duration, position: position, isPlaying: controller.value.isPlaying));
  }

  FutureOr<void> onChanged(double value) {
    position = value;
    emit(VideoPlayerState.loaded(controller: controller, duration: duration, position: position, isPlaying: controller.value.isPlaying));
  }

  FutureOr<void> toggleMute() {
    isMuted = !isMuted;
    controller.setVolume(isMuted ? 0.4 : 0.0);
    emit(const VideoPlayerState.loading());
    emit(VideoPlayerState.loaded(controller: controller, duration: duration, position: position, isPlaying: controller.value.isPlaying));
  }

  FutureOr<void> onChangeEnd(double value) {
    controller.seekTo(Duration(seconds: value.toInt()));
    seeking = false;
    controller.play();
    emit(VideoPlayerState.loaded(controller: controller, duration: duration, position: position, isPlaying: controller.value.isPlaying));
  }

  FutureOr<void> seek10(bool isBack) {
    final val = controller.value.position.inMicroseconds;
    controller.seekTo(Duration(microseconds: val + (isBack ? -10000000 : 10000000)));
    seeking = false;
    controller.play();
    emit(VideoPlayerState.loaded(controller: controller, duration: duration, position: position, isPlaying: controller.value.isPlaying));
  }

  FutureOr<void> onChangeStart() {
    seeking = true;
  }

  @override
  Future<void> close() {
    controller.dispose();
    timer.cancel();
    return super.close();
  }
}

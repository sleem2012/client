import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/video_player/video_player_bloc.dart';
import '../../logic/video_player/video_player_state_events.dart';
import '../../packages/cache/locale_storage.dart';
import '../home_screen/widgets/location_widget.dart';
import '../../packages/widgets/icon_button.dart';
import '../widgets/shimmer_box.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({Key? key}) : super(key: key);
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => VideoPlayerBloc()
        ..initPlayer()
        ..addListener(),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => const ShimmerBox(),
              loaded: (value) => Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () => VideoPlayerBloc.of(context).togglePlayer(),
                    child: Column(
                      children: [
                        if (value.controller.value.isInitialized)
                          AspectRatio(
                            aspectRatio: VideoPlayerBloc.of(context).controller.value.aspectRatio,
                            child: LimitedBox(child: VideoPlayer(VideoPlayerBloc.of(context).controller)),
                          ),
                      ],
                    ),
                  ),

                  /// Row(
                  ///   children: [
                  ///     GestureDetector(
                  ///       onTap: () => VideoPlayerBloc.of(context).seek10(true),
                  ///       child: Container(
                  ///         width: Get.width * .25,
                  ///         color: Colors.black.withOpacity(.1),
                  ///         child: Center(
                  ///           child: Icon(Icons.replay_10, color: Colors.grey.shade200.withOpacity(.3), size: 30),
                  ///         ),
                  ///       ),
                  ///     ),
                  ///     IgnorePointer(
                  ///       child: Container(width: Get.width * .5, color: Colors.black.withOpacity(.1)),
                  ///     ),
                  ///     GestureDetector(
                  ///       onTap: () => VideoPlayerBloc.of(context).seek10(false),
                  ///       child: Container(
                  ///         width: Get.width * .25,
                  ///         color: Colors.black.withOpacity(.1),
                  ///         child: Center(
                  ///           child: Icon(Icons.forward_10_rounded, color: Colors.grey.shade200.withOpacity(.3), size: 30),
                  ///         ),
                  ///       ),
                  ///     ),
                  ///   ],
                  /// ),
                  Positioned(
                    bottom: 0,
                    width: Get.width,
                    child: LimitedBox(
                      child: SliderTheme(
                        data: const SliderThemeData(
                          thumbColor: Colors.green,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
                          trackHeight: 1,
                        ),
                        child: Slider(
                          value: value.position,
                          max: value.duration,
                          min: 0,
                          thumbColor: Colors.white,
                          activeColor: Colors.white.withOpacity(.8),
                          inactiveColor: Colors.white.withOpacity(.2),
                          onChanged: VideoPlayerBloc.of(context).onChanged,
                          onChangeEnd: VideoPlayerBloc.of(context).onChangeEnd,
                          onChangeStart: (value) {
                            VideoPlayerBloc.of(context).onChangeStart();
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Column(
                      children: [
                        if (!value.controller.value.isPlaying && KStorage.i.getToken != null) const LocationWidget(),
                        Row(
                          children: [
                            KIconButton(
                              radius: 40,
                              onPressed: VideoPlayerBloc.of(context).toggleMute,
                              child: Icon(
                                VideoPlayerBloc.of(context).isMuted ? Icons.volume_down_rounded : Icons.volume_off_rounded,
                                color: Colors.grey.shade200,
                                size: 18,
                              ),
                            ),
                            KIconButton(
                              radius: 40,
                              onPressed: VideoPlayerBloc.of(context).togglePlayer,
                              child: Icon(
                                value.controller.value.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                color: Colors.grey.shade200,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!value.controller.value.isPlaying)
                    Positioned(
                      top: 30,
                      width: 40,
                      height: 40,
                      child: Image.asset("assets/images/logo_with_name.png", width: 50, height: 50),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

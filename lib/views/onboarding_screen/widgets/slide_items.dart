import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/global/settings/settings_bloc.dart';
import '../../../logic/global/settings/settings_state.dart';
import '../../../shared/theme/colors.dart';
import 'slide.dart';
import '../../widgets/error/error_widget.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';

class SlideItems extends StatefulWidget {
  final int index;

  const SlideItems(this.index, {Key? key}) : super(key: key);

  @override
  State<SlideItems> createState() => SlideItemsState();
}

class SlideItemsState extends State<SlideItems> {
  String? currentVal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          initial: () => const KLoadingOverlay(isLoading: true),
          loading: () => const KLoadingOverlay(isLoading: true),
          error: (e) => KErrorWidget(error: e, onTryAgain: () {
            SettingsBloc.of(context).getSettings();
          }),
          success: (e) {
            final slideList = [
              // Slide(
              //   image: "${e.data?.first.introScreen?.screen?.image}",
              //   desc: "${e.data?.first.introScreen?.screen?.paragraph?.value}",
              //   title: "${e.data?.first.introScreen?.screen?.title?.value}",
              // ),
              Slide(
                image: "${e.data?.first.introScreen?.screen0?.image}",
                desc: "${e.data?.first.introScreen?.screen0?.paragraph?.value}",
                title: "${e.data?.first.introScreen?.screen0?.title?.value}",
              ),
            ];
            return Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 16.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KImageWidget(
                   imageUrl:  "${slideList[widget.index].image}",
                    width: Get.width,
                  ),
                  Text(
                    "${slideList[widget.index].title}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: KColors.of(context).accentColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "${slideList[widget.index].desc}",
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

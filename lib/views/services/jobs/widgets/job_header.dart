import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/jobs/jobs_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import 'job_apply_dialog.dart';
import '../../../../packages/widgets/icon_button.dart';
import '../../../../packages/widgets/image_widget.dart';
import 'package:get/get.dart';
import '../../../../shared/theme/text_theme.dart';

class JobHeader extends StatelessWidget {
  const JobHeader({Key? key, required this.jobData}) : super(key: key);

  final JobData jobData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 230,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 1,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    aspectRatio: 1.7,
                  ),
                  items: [
                    KImageWidget(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      imageUrl: jobData.company?.logo?.s512px ?? '',
                    ),
                  ]),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                      jobData.company?.logo?.s512px ?? '',
                      maxHeight: Get.height.toInt(),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 20,
                    child: RawMaterialButton(
                      onPressed: () {
                        Get.bottomSheet(

                          JobApplyDialog(
                            jobId: jobData.id ?? 0,
                            companyImage: jobData.company?.logo?.s512px ?? '',
                          ),
                        );
                      },
                      fillColor: KColors.of(context).freeShiping,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        Tr.get.apply_now,
                        style: KTextStyle.of(context).editBTN.copyWith(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              right: 0,
              child: SizedBox(
                width: Get.width,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: KColors.of(context).activeIcons,
                      child: const Icon(
                        Icons.chat,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: KColors.of(context).activeIcons,
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    // NotAuthedWidget(
                    //   child: CircleAvatar(
                    //     radius: 15,
                    //     backgroundColor: KColors.of(context).activeIcons,
                    //     child: BlocBuilder<FavouriteBloc, FavouriteState>(
                    //       builder: (context, state) {
                    //         return KIconButton(
                    //           onPressed: () {
                    //             FavouriteBloc.of(context).toggle(
                    //                 jobData.proSysId,
                    //                 ProductDetailsBloc.of(context).productsSys);
                    //           },
                    //           child: Icon(
                    //             FavouriteBloc.of(context).isFav(
                    //                     ProductDetailsBloc.of(context).proSysId)
                    //                 ? Icons.favorite
                    //                 : Icons.favorite_border,
                    //             color: Colors.red,
                    //             size: 20,
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: KColors.of(context).activeIcons,
                      child: KIconButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    CircleAvatar(
                      radius: 15,
                      backgroundColor: KColors.of(context).activeIcons,
                      child: KIconButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

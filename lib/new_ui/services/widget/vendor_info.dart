import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../packages/extensions.dart';
import '../../../logic/company/company_by_id/company_bloc_by_id.dart';
import '../../../logic/favourite/favorite_bloc.dart';
import '../../../logic/favourite/favourite_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../shared/theme/helper.dart';
import '../../../views/widgets/not_loggedin.dart';
import '../../../views/widgets/photo_viewer.dart';
import 'package:get/get.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../packages/widgets/image_widget.dart';

class VendorInfo extends StatefulWidget {
  const VendorInfo({Key? key, this.data}) : super(key: key);
  final CompanyBlocById? data;

  @override
  State<VendorInfo> createState() => _VendorInfoState();
}

class _VendorInfoState extends State<VendorInfo> {
  final double radius = 45;

  bool get isAr => Directionality.of(context) == TextDirection.rtl;

  @override
  Widget build(BuildContext context) {
    final finalData = widget.data;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: () {
                Nav.to(KPhotoView(image: finalData?.compCover ?? dummyNetCover));
              },
              child: KImageWidget(fit: BoxFit.cover, width: Get.width, height: 170, imageUrl: finalData?.compCover ?? dummyNetCover),
            ),
            Positioned(
              bottom: -60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Nav.to(KPhotoView(image: finalData?.compLogo ?? dummyNetLogo));
                  },
                  child: CircleAvatar(
                    radius: radius,
                    foregroundImage: NetworkImage(
                      finalData?.compLogo ?? dummyNetCover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: isAr ? 0 : radius + 60, right: isAr ? radius + 60 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      finalData?.compName ?? '',
                      style: KTextStyle.of(context).black_grey_bold.S(1.4),
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  IgnorePointer(
                    child: RatingBar.builder(
                      unratedColor: KColors.of(context).greyColor.withOpacity(.5),
                      initialRating: finalData?.compRate.toDouble() ?? 0.0,
                      allowHalfRating: true,
                      itemBuilder: (context, _) => Icon(Icons.star, color: Color(0xffD5B100)),
                      onRatingUpdate: (rating) {},
                      itemSize: 13,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text('(${finalData?.compRate.toString() ?? ' '})', style: KTextStyle.of(context).hint),
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: KColors.of(context).activeIcons,
                          child: KIconButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.ios_share,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        KNotLoggedInWidget(
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: KColors.of(context).activeIcons,
                            child: BlocBuilder<FavoriteBloc, FavoriteState>(
                              builder: (context, state) {
                                return KIconButton(
                                  onPressed: () {
                                    // FavoriteBloc.of(context).add(
                                    //     details.proSystem?.id, details.proSystem);
                                  },
                                  child: const Icon(
                                      // FavoriteBloc.of(context)
                                      //     .isFav(details.proSystem?.id ?? -1)
                                      //     ? Icons.favorite
                                      //     :
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 20),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  10.w,
                ],
              ),
              SizedBox(
                height: 20,
                child: Text(
                  finalData?.compCategory ?? '',
                  style: KTextStyle.of(context).hint,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

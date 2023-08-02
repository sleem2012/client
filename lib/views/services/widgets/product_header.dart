import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/favourite/favorite_bloc.dart';
import '../../../logic/favourite/favourite_state.dart';
import '../../../logic/products/product_details/product_details_bloc_cubit.dart';
import '../../../logic/products/product_details/product_details_bloc_state.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../widgets/not_loggedin.dart';
import 'package:get/get.dart';

import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';


class ProductHeader extends StatelessWidget {
  const ProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 230,
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return Stack(
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
                  items: ProductDetailsBloc.of(context)
                      .images
                      .map<Widget>(
                        (item) => KImageWidget(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          imageUrl: item.s512px!,
                        ),
                      )
                      .toList(),
                ),
              ),
              Positioned(
                bottom: 5,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(
                    ProductDetailsBloc.of(context).brandImg ?? dummyNetLogo,
                    maxHeight: Get.height.toInt(),
                  ),
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
                      KNotLoggedInWidget(
                        child: KChatIconButton(
                          roomType: ChatRoomType.product,
                          room_type_id: ProductDetailsBloc.of(context).proMenuId,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // CircleAvatar(
                      //   radius: 15,
                      //   backgroundColor: KColors.of(context).activeIcons,
                      //   child: const Icon(Icons.share, color: Colors.white, size: 20),
                      // ),
                      const Spacer(),
                      KNotLoggedInWidget(
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: KColors.of(context).activeIcons,
                          child: BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) {
                              return KIconButton(
                                onPressed: () {
                                  FavoriteBloc.of(context).add(ProductDetailsBloc.of(context).proSysId, ProductDetailsBloc.of(context).productsSys);
                                },
                                child: Icon(
                                  FavoriteBloc.of(context).isFav(ProductDetailsBloc.of(context).proSysId) ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

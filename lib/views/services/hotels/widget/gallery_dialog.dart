import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/user_info/user_model.dart';
import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../widgets/appbar.dart';
import '../../../../packages/widgets/image_widget.dart';
import '../../../widgets/photo_viewer.dart';
import 'package:photo_view/photo_view.dart';

class GalleryDialog extends StatelessWidget {
  const GalleryDialog({Key? key, required this.img}) : super(key: key);
  final List<Logo> img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Material(
          color: KColors.of(context).background,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              pauseAutoPlayOnTouch: true,
              viewportFraction: .9,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enlargeCenterPage: false,
              autoPlayInterval: const Duration(seconds: 2),
              aspectRatio: 1.5,
            ),
            items: img
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Nav.to(KPhotoView(image: e.s256px ?? ''));
                        },
                        child: KImageWidget(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          imageUrl: e.s512px ?? '',
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class GalleryViewer extends StatelessWidget {
  const GalleryViewer({Key? key, required this.images}) : super(key: key);
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return PhotoView(
            imageProvider: CachedNetworkImageProvider(images[index]),
            tightMode: true,
            initialScale: .7,
            backgroundDecoration: BoxDecoration(color: KColors.of(context).background),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: KColors.of(context).fabBackground,
        child: const Icon(Icons.arrow_forward, size: KHelper.iconSize, color: Colors.white),
        onPressed: () {
          Nav.back();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../packages/widgets/image_widget.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_info/user_model.dart';
import 'gallery_dialog.dart';

class HotelGallery extends StatelessWidget {
  const HotelGallery({Key? key, required this.img}) : super(key: key);
  final List<Logo> img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .47,
      child: GridView.builder(
        itemCount: img.length > 4 ? 4 : img.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return index == 3
              ? Container(
                  decoration: KHelper.of(context).elevatedBox,
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(GalleryDialog(img: img));
                    },
                    child: Stack(
                      children: [
                        KImageWidget(
                          imageUrl: img[index].s128px ?? dummyNetLogo,
                        ),
                        Container(
                          color: Colors.grey.withOpacity(.5),
                        ),
                        Center(child: Text(img.length.toString())),
                      ],
                    ),
                  ))
              : Container(
                  decoration: KHelper.of(context).elevatedBox,
                  child: KImageWidget(
                    imageUrl: img[index].s128px ?? dummyNetLogo,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                );
        },
      ),
    );
  }
}

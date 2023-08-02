import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../packages/widgets/image_widget.dart';


class CustomImage extends StatelessWidget {
  const CustomImage(
      {this.imageUrl, this.height = 40, this.width, this.boxFit, Key? key})
      : super(key: key);

  final String? imageUrl;
  final double height;
  final double? width;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return KImageWidget(
      height: height,
      width: width??Get.width/100,
      imageUrl: imageUrl!,
      fit: boxFit ?? BoxFit.cover,


    );
  }
}

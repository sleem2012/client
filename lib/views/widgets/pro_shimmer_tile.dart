




import 'package:flutter/material.dart';
import '../../shared/theme/helper.dart';
import 'package:get/get.dart';

import 'shimmer_box.dart';

class ProductLoadingPH extends StatelessWidget {
  const ProductLoadingPH({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      final width = box.maxWidth - 35;
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
        height: 100,
        width: Get.width,
        decoration: KHelper.of(context).elevatedBox,
        child: Row(
          children: [
            ShimmerBox(width: width * .28, height: 130),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerBox(width: width * .5, height: 14),
                const SizedBox(height: 6),
                ShimmerBox(width: width * .5, height: 12),
                const SizedBox(height: 6),
                ShimmerBox(width: width * .55, height: 10),
                const SizedBox(height: 6),
                ShimmerBox(width: width * .3, height: 10),
                const SizedBox(height: 6),
                ShimmerBox(width: width * .6, height: 12),
              ],
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerBox(width: width * .1, height: 35),
                const SizedBox(height: 6),
                ShimmerBox(width: width * .1, height: 30),
                const SizedBox(height: 6),
                ShimmerBox(width: width * .1, height: 15),
              ],
            ),
            const SizedBox(width: 5),
          ],
        ),
      );
    });
  }
}

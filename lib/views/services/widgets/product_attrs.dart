import 'package:flutter/material.dart';
import '../../../data/models/products/products_model.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/widgets/image_widget.dart';

import '../hotels/hotels_vm.dart';

class ProductAttributesView extends StatelessWidget {
  const ProductAttributesView({Key? key, required this.productMenu}) : super(key: key);
  final ProductMenu productMenu;
  @override
  Widget build(BuildContext context) {
    final HotelVm vm = HotelVm(productMenu);
    final product_attr_with_icons = vm.product_attr_with_icons;
    final hasAttr = vm.has_attr;
    final product_attr_with_check = vm.product_attr_with_check;
    final product_attr_with_answer = vm.product_attr_with_answer;
    if (hasAttr) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Tr.get.product_attr, style: KTextStyle.of(context).title2.copyWith(fontSize: 11)),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 5,
              spacing: 5,
              children: product_attr_with_icons.map((e) {
                return Container(
                  decoration: KHelper.of(context).outlineBorder,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KImageWidget(imageUrl: e.attrValue!.icon!, width: 25, height: 25),
                      const SizedBox(width: 8),
                      Text('${e.answer}', style: KTextStyle.of(context).hint),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: product_attr_with_check.map((e) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (e.answer == e.attrValue?.name)
                      Icon(Icons.check, size: 16, color: KColors.of(context).actionBTN)
                    else
                      Icon(Icons.close, size: 16, color: KColors.of(context).error),
                    const SizedBox(width: 8),
                    Text('${e.attrValue?.name}', style: KTextStyle.of(context).body2),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: product_attr_with_answer.map((e) {
                return Container(
                  decoration: KHelper.of(context).outlineBorder,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${e.attrValue?.name}  : ', style: KTextStyle.of(context).body2),
                      const SizedBox(width: 8),
                      Text('${e.answer}', style: KTextStyle.of(context).hint),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

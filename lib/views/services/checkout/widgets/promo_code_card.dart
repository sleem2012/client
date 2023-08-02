import 'package:flutter/material.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../widgets/text_field.dart';
import 'package:get/get.dart';

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Tr.get.summary,
                style: KTextStyle.of(context).title2.copyWith(fontSize: 11, color: KColors.of(context).text),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Get.height * .01,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(color: KColors.of(context).bluish),
          child: KTextFormField(
            suffixIcon: SizedBox(
              width: 100,
              child: RawMaterialButton(
                onPressed: () {},
                fillColor: KColors.of(context).freeShiping,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Tr.get.apply,
                      style: KTextStyle.of(context).editBTN.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            hintText: Tr.get.add_promo_code,
          ),
        ),
      ],
    );
  }
}

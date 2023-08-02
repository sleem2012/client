import 'package:flutter/material.dart';
import '../../../../data/models/user_info/user_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import 'package:get/get.dart';

class DescriptionAdsDetails extends StatelessWidget {
  const DescriptionAdsDetails({Key? key, required this.data}) : super(key: key);

  final UserCompany data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            Tr.get.description,
            style: KTextStyle.of(context).title2.copyWith(fontSize: 11),
          ),
        ),
        SizedBox(
          height: Get.height * .02,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: KHelper.of(context).elevatedBox,
          child: Text(data.description?.value ?? "", style: KTextStyle.of(context).title2.copyWith(fontSize: 10, fontWeight: FontWeight.normal)),
        ),
      ],
    );
  }
}

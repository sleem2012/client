import 'package:flutter/material.dart';
import '../../../../packages/cache/locale_storage.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/text_theme.dart';
import 'package:get/get.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Tr.get.address_details, style: KTextStyle.of(context).boldTitle1),
          ],
        ),
        SizedBox(height: Get.height * .01),
        SizedBox(
          // padding: const EdgeInsets.all(10),
          width: double.infinity,
          // decoration: KHelper.of(context).elevatedBox,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on_rounded, color: KColors.of(context).accentColor, size: 19),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        KStorage.i.getUserInfo?.data?.address?.detailedAddress ?? '',
                        style: KTextStyle.of(context).blackbody3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

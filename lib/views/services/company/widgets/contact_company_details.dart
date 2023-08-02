import 'package:flutter/material.dart';
import '../../../../data/models/user_info/user_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ContactAdsDetails extends StatelessWidget {
  const ContactAdsDetails({Key? key, required this.data, this.fromBank = false}) : super(key: key);

  final UserCompany data;

  final bool fromBank;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            Tr.get.contact_with_email,
            style: KTextStyle.of(context).title2.copyWith(fontSize: 11),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: KHelper.of(context).elevatedBox,
          child: Column(
            children: [
              if (!fromBank) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Tr.get.customer_service, style: KTextStyle.of(context).title2.copyWith(fontSize: 10)),
                    Text(data.emails?.contact ?? '', style: KTextStyle.of(context).hint.copyWith(fontSize: 10, fontWeight: FontWeight.normal)),
                    const SizedBox(
                      width: 100,
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Tr.get.marketing, style: KTextStyle.of(context).title2.copyWith(fontSize: 10)),
                    Text(data.hotlines?.founded ?? '', style: KTextStyle.of(context).hint.copyWith(fontSize: 10, fontWeight: FontWeight.normal)),
                    const SizedBox(
                      width: 70,
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Tr.get.hR, style: KTextStyle.of(context).title2.copyWith(fontSize: 10)),
                    const SizedBox(
                      width: 40,
                    )
                  ],
                )
              ],
              if (fromBank) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          const Icon(Icons.email_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(Tr.get.email, style: KTextStyle.of(context).title2.copyWith(fontSize: 10)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                          textAlign: TextAlign.start,
                          data.emails?.contact ?? '',
                          style: KTextStyle.of(context).hint.copyWith(fontSize: 10, fontWeight: FontWeight.normal)),
                    ),
                    const SizedBox(
                      width: 100,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          const Icon(Icons.link_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(Tr.get.website, style: KTextStyle.of(context).title2.copyWith(fontSize: 10)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                          textAlign: TextAlign.start,
                          data.socialLinks?.website ?? '',
                          style: KTextStyle.of(context).hint.copyWith(fontSize: 10, fontWeight: FontWeight.normal)),
                    ),
                    const SizedBox(
                      width: 100,
                    )
                  ],
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

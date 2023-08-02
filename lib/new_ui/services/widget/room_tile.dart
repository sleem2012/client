import 'package:flutter/material.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../packages/extensions.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/widgets/custom_button.dart';
import 'package:get/get.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = [
      Text(
        "Double Room with Side Sea view",
        style: KTextStyle.of(context).black_grey_bold.S(1.4),
      ),
      Text(
        "All-inclusive",
        style: KTextStyle.of(context).green_txt.S(1.2),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          IconWithText(
            icon: Icons.bed,
            text: "2 twin beds",
          ),
          SizedBox(
            width: 10,
          ),
          IconWithText(
            icon: Icons.person,
            text: "Fits 2",
          ),
        ],
      ),
      IconWithText(
        icon: Icons.check,
        style: KTextStyle.of(context).green_txt.S(1.2),
        text: "Free Cancellation until 11:59 PM on March 20",
      ),
      Divider(
        // height: 10,
        color: KColors.of(context).accentColor,
        thickness: 1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price for 7 nights',
                style: KTextStyle.of(context).black_grey.S(1.2),
              ),
              8.h,
              Text(
                'EGP 12,660',
                style: KTextStyle.of(context).accent_txt_B.S(1.5),
              ),
            ],
          ),
          CustomBtn(
            text: "View Room",
            onChange: () {},
            width: Get.width * .25,
            height: 30,
          )
        ],
      ),
    ];
    return Container(
      decoration: KHelper.of(context).outSelectedBox,
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (c, i) => list[i],
        separatorBuilder: (c, i) => 6.h,
        itemCount: list.length,
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText(
      {Key? key, required this.icon, required this.text, this.style})
      : super(key: key);
  final IconData icon;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 4,

        ),
        Text(
          text,

          style: style,
        )
      ],
    );
  }
}

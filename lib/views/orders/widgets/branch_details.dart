import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:get/get.dart';

import '../../../data/models/cart/cart_model.dart';
import '../../../data/models/orders/orders_model.dart' hide Image hide Icons;
import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../cart/widgets/cart_card.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/hero_dialog/btn_to_dialog.dart';
import '../../widgets/new_bg_img.dart';
import '../history_screen.dart';
import '../order_review.dart';
import 'extra_widget.dart';

class BranchDetails extends StatelessWidget {
  const BranchDetails({Key? key, required this.data}) : super(key: key);
  final Shipping data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: ""),
      body: BgImg(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Tr.get.shipping_status,
                        style: KTextStyle.of(context).title2,
                      ),
                      Text(
                        '${data.state}',
                        style: KTextStyle.of(context).title2.copyWith(color: const Color(0xff30A834), fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: KHelper.of(context).elevatedBox.copyWith(borderRadius: BorderRadius.circular(0)),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(data.vendor?.company?.logo?.s128px ?? dummyNetLogo),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.vendor?.company?.name?.value ?? '',
                                style: KTextStyle.of(context).boldTitle1,
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: Get.width * .5,
                                child: Text(
                                  data.vendor?.address?.detailedAddress.toString() ?? '',
                                  style: KTextStyle.of(context).body3.S(1.3),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: [
                              KChatIconButton(roomType: ChatRoomType.order, room_type_id: data.id, order_chat_type: 'vendor'),
                              8.h,
                              if (data.isLocal!)
                                FittedBox(
                                  child: SizedBox(
                                    width: 70,
                                    child: Text(
                                      data.state?.toString() ?? '',
                                      style: KTextStyle.of(context).black_txt.S(1),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (data.orderRider == null)
                        Column(
                          children: [
                            if (data.noProvider!)
                              const SizedBox()
                            else if (data.isLocal!)
                              SizedBox()
                            else
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  KImageWidget(imageUrl: data.providerContentModel?.icon ?? '', width: 30, height: 30),
                                  const SizedBox(width: 10),
                                  Expanded(child: Text(data.providerContentModel?.name ?? '', textAlign: TextAlign.start)),
                                  Row(
                                    children: [
                                      Text(data.providerContentModel?.id.toString() ?? '', textAlign: TextAlign.start),
                                      const SizedBox(width: 10),
                                      KIconButton(
                                        onPressed: () async {
                                          await Clipboard.setData(ClipboardData(text: data.providerContentModel?.id.toString() ?? ''));
                                          KHelper.showSnackBar(Tr.get.idCopiedSuccessfully);
                                        },
                                        child: const Icon(Icons.copy, size: 15),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundImage: NetworkImage(
                                    data.orderRider?.image?.s128px?.toString() ?? dummyNetLogo,
                                  ),
                                )),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.orderRider?.name ?? '', style: KTextStyle.of(context).black_txt.S(1.4).B),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: Get.width * .6,
                                  child: Text(
                                    data.orderRider?.address?.detailedAddress.toString() ?? '',
                                    style: KTextStyle.of(context).body3,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                            KChatIconButton(roomType: ChatRoomType.order, room_type_id: data.id, order_chat_type: 'rider'),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    final item = data.shippingContent?.items?[i];
                    String? formatFrom;
                    String? formatTo;
                    if (item?.timePikerFrom != null) {
                      final date = DateTime.parse((item ?? [] as CartItems).timePikerFrom!);
                      formatFrom = KHelper.apiDateFormatter(date);
                    }
                    if (item?.timePikerTo != null) {
                      final date = DateTime.parse((item ?? [] as CartItems).timePikerTo!);
                      formatTo = KHelper.apiDateFormatter(date);
                    }
                    return Container(
                      decoration: KHelper.of(context).elevatedBox,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.network(item?.images?.firstOrNull?.s128px ?? dummyNetLogo, fit: BoxFit.cover, width: 56, height: 60),
                              const SizedBox(width: 13),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'x${item?.quantity ?? ''} ${item?.name ?? ' '} - ${item?.productSize != null ? item?.productSize?.name : ''}/${item?.productColor != null ? item?.productColor?.name : ''}',
                                    style: KTextStyle.of(context).black_txt.S(1.2),
                                  ),
                                  const SizedBox(height: 3),
                                  // if (item?.productColor != null)
                                  //   Text(
                                  //     '${Tr.get.color} : ${item?.productColor?.name ?? ''}',
                                  //     style: const TextStyle(fontSize: 10),
                                  //   ),
                                  // const SizedBox(width: 8),
                                  // Text('${Tr.get.amount} : ${item?.quantity ?? ''}', style: const TextStyle(fontSize: 10)),
                                  Row(
                                    children: [
                                      Text(' ${item?.price ?? ''}  SAR', style: const TextStyle(fontSize: 10)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        ' ${item?.discount ?? ''} SAR',
                                        style: KTextStyle.of(context).lineThrough.S(.8),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  if (item?.note != null)
                                    Row(
                                      children: [
                                        Text(Tr.get.special_notes, style: KTextStyle.of(context).names),
                                        Text(item?.note ?? '', style: const TextStyle(fontSize: 8)),
                                      ],
                                    ),
                                  if (item?.timePikerFrom != null)
                                    Text(
                                      '${getDateTitle(data.shippingContent?.features, true)} : ${formatFrom.toString()}',
                                      style: KTextStyle.of(context).body3,
                                    ),
                                  if (item?.timePikerTo != null)
                                    Text('${getDateTitle(data.shippingContent?.features, false)} : ${formatTo.toString()}', style: KTextStyle.of(context).body3),
                                ],
                              ),
                            ],
                          ),
                          if ((item?.extras ?? <CartItemExtra>[]).isNotEmpty)
                            SizedBox(
                              width: 70,
                              child: KButtonToDialog(
                                tag: 'aaaaaa',
                                dialog: ExtraWidget(extraCollection: (item?.extras ?? <CartItemExtra>[])),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(color: KColors.of(context).freeShiping, borderRadius: BorderRadius.circular(8)),
                                  child: Text(Tr.get.extra),
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, i) => const SizedBox(height: 8),
                  itemCount: data.shippingContent?.items?.length ?? 0,
                ),
                const SizedBox(height: 20),
                if (data.isLocal!)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: KButton(
                      title: Tr.get.shipping_status,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HistoryScreen()));
                      },
                    ),
                  ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderReview()));
                  },
                  child: Text(Tr.get.rate_order, style: KTextStyle.of(context).names),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:forall_client/shared/theme/colors.dart';
import 'package:get/get.dart';

import '../../../../data/models/orders/get_delivering_order_model.dart';
import '../../../../logic/delivering/get_delivering_order/get_delivering_order_bloc.dart';
import '../../../../logic/delivering/get_delivering_order/get_delivering_order_state.dart';
import '../../../../packages/chat/data/models/chat_model.dart';
import '../../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../../../packages/widgets/image_widget.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import 'key_value_text.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({Key? key, required this.data}) : super(key: key);
  final DeliveringOrderData data;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetDeliveringOrderBloc, GetDeliveringOrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        final riderInfo = data.orderRider;
        final plate = riderInfo?.rider?.commercial?.vehicle?.plate;
        final plateNumber = '${plate?.left} ${plate?.middle} ${plate?.right} ${plate?.number}';
        return Container(
          color: KColors.of(context).sBackground,
          padding: const EdgeInsets.all(10),
          width: Get.width,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: Get.width * .2,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: KImageWidget(
                          imageUrl: riderInfo?.rider?.commercial?.vehicle?.images?.front?.s128px ?? dummyNetLogo,
                        ),
                      ),
                      Positioned(
                        top: Get.height * .03,
                        right: Get.width * .001,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(
                            riderInfo?.image?.s128px ?? dummyNetLogo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${data.orderRider?.name}',
                          style: KTextStyle.of(context).names,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        10.h,
                        KeyValueText(
                          title: Tr.get.car_number,
                          value: plateNumber,
                        ),
                        10.h,

                        KeyValueText(title: Tr.get.phone_number, value: '${data.orderRider?.mobile}'),
                        10.h,

                        // const KeyValueText(title: 'Date: ', value: '4 jul 2022 '),
                        KeyValueText(title: Tr.get.order_iD, value: data.id?.toString() ?? ''),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${data.state}",
                      style: KTextStyle.of(context).names.copyWith(fontSize: 10),
                    ),
                    10.h,
                    KChatIconButton(
                      roomType: ChatRoomType.order,
                      room_type_id: data.id,
                      order_chat_type: 'rider',
                    ),
                    10.h,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

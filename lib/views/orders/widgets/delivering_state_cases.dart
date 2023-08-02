import 'package:flutter/material.dart';
import '../../../data/models/orders/get_delivering_order_model.dart';
import '../../../logic/delivering/get_delivering_order/get_delivering_order_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import '../../services/delivering/widgets/delivering_payment.dart';
import '../../widgets/action_dialog.dart';
import '../../widgets/qr_code/qr_generator.dart';
import '../../widgets/slugs_drop_down.dart';
import 'package:get/get.dart';

import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';

class DeliveringStatesCases extends StatelessWidget {
  const DeliveringStatesCases({Key? key, required this.data}) : super(key: key);
  final DeliveringOrderData data;

  @override
  Widget build(BuildContext context) {
    switch (data.state) {
      case KSlugModel.pending:
        return KChatIconButton(
          roomType: ChatRoomType.billOrder,
          room_type_id: data.id,
          order_chat_type: 'rider',
        );
      case KSlugModel.lookingForRider:
        return const SizedBox(
          width: 70,
          height: 20,
          // child: RawMaterialButton(
          //   onPressed: () {
          //     if (data.state != KSlugModel.inPayment) {
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetails(data: orderData)));
          //       GetOrderBloc.of(context).setOrderId(orderData.id);
          //     } else {
          //       return;
          //     }
          //   },
          //   fillColor: KColors.of(context).trackColor,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //   child: Text(
          //     Tr.get.view,
          //     style: KTextStyle.of(context).editBTN.copyWith(
          //         fontSize: 10,
          //         color: Colors.white,
          //         fontWeight: FontWeight.bol0d),
          //   ),
          // ),
        );
      case KSlugModel.paymentNeeded:
        return SizedBox(
          width: 70,
          height: 20,
          child: RawMaterialButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => DeliveringPayment(Id: data.id),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              );
            },
            fillColor: KColors.of(context).trackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Pay ${data.PaymentValue} ${data.currency}',
              style: KTextStyle.of(context).editBTN.copyWith(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      case KSlugModel.arrivedClient:
        return SizedBox(
          height: 20,
          width: Get.width * .2,
          child: RawMaterialButton(
            onPressed: () {
              ActionDialog(
                title: Tr.get.driver_arrived,
                approveAction: Tr.get.yes_message,
                cancelAction: Tr.get.no_message,
                onApproveClick: () {
                  GetDeliveringOrderBloc.of(context).updateOrder(
                      data: data, orderState: KSlugModel.completedCode);
                  Navigator.pop(context);
                },
                onCancelClick: () {
                  Navigator.pop(context);
                },
              ).show<void>(context);
            },
            fillColor: KColors.of(context).accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: FittedBox(
                child: Text(Tr.get.generate_code,
                    style: KTextStyle.of(context).editBTN)),
          ),
        );
      case KSlugModel.completedCode:
        return IconButton(
          onPressed: () {
            Get.dialog(
              QRCodeView(qrCode: data.completedCode ?? ''),
              barrierDismissible: true,
              transitionDuration: const Duration(seconds: 1),
              // barrierColor: KColors.of(context).background
            );
          },
          icon: const Icon(Icons.qr_code, size: 50),
        );

      default:
        return SizedBox(
          height: 20,
          child: RawMaterialButton(
            onPressed: () {},
            fillColor: KColors.of(context).trackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: FittedBox(
              child: Text(
                data.state?.toString() ?? '',
                style: KTextStyle.of(context).editBTN.copyWith(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
    }
  }
}

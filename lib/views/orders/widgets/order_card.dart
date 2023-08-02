import 'package:flutter/material.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:get/get.dart';

import '../../../data/models/orders/orders_model.dart' hide Image hide Icons;
import '../../../logic/orders/get_orders/get_orders_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/action_dialog.dart';
import '../../widgets/qr_code/qr_generator.dart';
import '../../widgets/slugs_drop_down.dart';
import 'branch_details.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({Key? key, required this.shippingData}) : super(key: key);
  final Shipping shippingData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BranchDetails(data: shippingData)));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: KHelper.of(context).elevatedBox.copyWith(borderRadius: BorderRadius.circular(0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(shippingData.vendor?.company?.logo?.s512px.toString() ?? ''),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    shippingData.vendor?.company?.name?.value ?? '',
                    style: KTextStyle.of(context).black_grey.S(1.3).B,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${Tr.get.order_iD} : ', style: KTextStyle.of(context).black_grey.S(1.3).B),
                      Text(
                        shippingData.id?.toString() ?? '',
                        style: KTextStyle.of(context).black_txt.S(1.3).B,
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                children: [
                  if (shippingData.state == KSlugModel.arrivedClient)
                    SizedBox(
                      height: 20,
                      width: Get.width * .2,
                      child: RawMaterialButton(
                        onPressed: () {
                          ActionDialog(
                            title: Tr.get.driver_arrived,
                            approveAction: Tr.get.yes_message,
                            cancelAction: Tr.get.no_message,
                            onApproveClick: () {
                              Navigator.pop(context);
                              GetOrderBloc.of(context).updateOrder(state: KSlugModel.completedCode, shipping: shippingData);
                            },
                            onCancelClick: () {
                              Navigator.pop(context);
                            },
                          ).show<void>(context);
                        },
                        fillColor: KColors.of(context).accentColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: FittedBox(child: Text(Tr.get.generate_code, style: KTextStyle.of(context).editBTN)),
                      ),
                    )
                  else if (shippingData.state == KSlugModel.completedCode)
                    IconButton(
                      onPressed: () {
                        Get.dialog(
                          QRCodeView(qrCode: shippingData.qrClient ?? ''),
                          barrierDismissible: true,
                          transitionDuration: const Duration(seconds: 1),
                          // barrierColor: KColors.of(context).background
                        );
                      },
                      icon: const Icon(Icons.qr_code, size: 50),
                    )
                  else
                    SizedBox(
                        height: 20,
                        child: Text(
                          shippingData.state?.toString() ?? '',
                          style: KTextStyle.of(context).accent_txt.S(1.2),
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

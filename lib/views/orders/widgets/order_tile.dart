import 'package:flutter/material.dart';
import 'package:forall_client/packages/extensions.dart';

import '../../../data/models/orders/orders_model.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../logic/orders/get_orders/get_orders_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/slugs_drop_down.dart';
import '../order_details.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({Key? key, required this.orderData}) : super(key: key);
  final OrderData orderData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (orderData.state != KSlugModel.inPayment) {
          GetOrderBloc.of(context).setSelectedOrderData(orderData);
          Nav.to(const OrderDetails());
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: KHelper.of(context).elevatedBox.copyWith(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${Tr.get.order_iD} : ', style: KTextStyle.of(context).accent_txt.S(1.4)),
                      Text(
                        orderData.id.toString(),
                        style: KTextStyle.of(context).black_txt.S(1.4),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text('${Tr.get.total} ', style: KTextStyle.of(context).accent_txt.S(1.4)),
                      Text(
                        '${orderData.totalPrice?.toString() ?? ''} ${orderData.currency?.toString() ?? ''}',
                        style: KTextStyle.of(context).body3.S(1.4),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(orderData.state == KSlugModel.completed ? (orderData.updated_at?.toString()) ?? '' : (orderData.createdAt?.substring(0, 10) ?? ''),
                    style: KTextStyle.of(context).accent_txt.S(1.2)),
                const SizedBox(height: 9),
                Text(orderData.state ?? '', style: KTextStyle.of(context).black_txt.S(1.2)),
                const SizedBox(height: 9),
                // if (orderData.state != KSlugModel.inPayment)
                //   SizedBox(
                //     width: 70,
                //     height: 20,
                //     child: RawMaterialButton(
                //       onPressed: () {
                //         GetOrderBloc.of(context).setSelectedOrderData(orderData);
                //         Nav.to(const OrderDetails());
                //       },
                //       fillColor: KColors.of(context).trackColor,
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                //       child: Text(
                //         orderData.state != KSlugModel.inPayment ? Tr.get.view : Tr.get.pay,
                //         style: KTextStyle.of(context).editBTN.copyWith(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

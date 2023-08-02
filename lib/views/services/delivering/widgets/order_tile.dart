import 'package:flutter/material.dart';

import '../../../../data/models/orders/get_delivering_order_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../orders/widgets/delivering_state_cases.dart';
import 'delivery_reguest_tile.dart';

class DeliveringOrderTile extends StatelessWidget {
  const DeliveringOrderTile({Key? key, required this.orderData}) : super(key: key);
  final DeliveringOrderData orderData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        KHelper.showCustomBottomSheet(DeliveryTile(
          data: orderData,
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: KHelper.of(context).elevatedBox,
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
                      Text('${Tr.get.order_iD} : ', style: KTextStyle.of(context).title4),
                      Text(
                        orderData.id.toString(),
                        style: const TextStyle(fontSize: 9),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text('${Tr.get.total} : '),
                      Text(
                        '${orderData.totalPrice?.toString() ?? ''}  ${orderData.currency?.toString() ?? ''}',
                        style: const TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  orderData.createdAt?.substring(0, 10) ?? '',
                  style: const TextStyle(fontSize: 9),
                ),
                const SizedBox(height: 9),
                Text(
                  orderData.state ?? '',
                  style: const TextStyle(fontSize: 9),
                ),
                const SizedBox(height: 9),
                DeliveringStatesCases(
                  data: orderData,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

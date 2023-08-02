import 'package:flutter/material.dart';
import 'package:forall_client/packages/extensions.dart';

import '../../../data/models/orders/orders_model.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final OrderData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: KHelper.of(context).bsBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryText(
                  context,
                  Text(
                    Tr.get.subtotal,
                    style: KTextStyle.of(context).black_grey.S(1.4).B,
                  ),
                  '${data.supTotalPrice} ${data.currency}'),
              const SizedBox(
                height: 5,
              ),
              _buildSummaryText(
                  context,
                  Row(
                    children: [
                      Text(Tr.get.shipping, style: KTextStyle.of(context).black_grey.S(1.4).B),
                      // KIconButton(
                      //   onPressed: () {
                      //     Get.bottomSheet(ShippingBottomSheet(
                      //       shipping: CartBloc.of(context).cartModel?.general?.shipping ?? [],
                      //     ));
                      //   }, child: const Icon(Icons.question_mark_rounded,size: 15),
                      //
                      // ),
                    ],
                  ),
                  '${data.shippingPrice} ${data.currency}'),
              const SizedBox(
                height: 5,
              ),
              _buildSummaryText(context, Text(Tr.get.discount, style: KTextStyle.of(context).black_grey.S(1.4).B), ''),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Tr.get.total,
                    style: KTextStyle.of(context).body.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${(data.supTotalPrice ?? 0) + (data.shippingPrice ?? 0)} ${data.currency}',
                    style: KTextStyle.of(context).body.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildSummaryText(context, Widget child, amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [child, Text(amount)],
  );
}

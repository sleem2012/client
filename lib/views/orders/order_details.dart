import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/orders/get_orders/get_orders_bloc.dart';
import '../../logic/orders/get_orders/get_orders_state.dart';
import '../../shared/localization/trans.dart';
import '../widgets/appbar.dart';
import '../widgets/new_bg_img.dart';
import 'widgets/order_card.dart';
import 'widgets/order_summary_card.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: Tr.get.order_details),
      body: BgImg(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BlocBuilder<GetOrderBloc, GetOrdersState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, i) => OrderProductCard(shippingData: GetOrderBloc.of(context).selectedOrderData!.shipping![i]),
                      separatorBuilder: (context, i) => const SizedBox(height: 8),
                      itemCount: GetOrderBloc.of(context).selectedOrderData?.shipping?.length ?? 0,
                    ),
                  ),
                  OrderSummaryCard(data: GetOrderBloc.of(context).selectedOrderData!)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

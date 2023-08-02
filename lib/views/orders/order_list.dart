import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../logic/orders/get_orders/get_orders_bloc.dart';
import 'widgets/order_tile.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key, required this.stateSlug}) : super(key: key);

  final String stateSlug;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: RefreshIndicator(
        onRefresh: () async {
          await GetOrderBloc.of(context).getOrder();
        },
        child: GetOrderBloc.of(context).filterOrders(stateSlug).isEmpty
            ? Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SvgPicture.asset('assets/images/no orders.svg'),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, i) => OrderTile(
                    orderData:
                        GetOrderBloc.of(context).filterOrders(stateSlug)[i]),
                separatorBuilder: (context, i) => const SizedBox(height: 10),
                itemCount:
                    GetOrderBloc.of(context).filterOrders(stateSlug).length,
              ),
      ),
    );
  }
}

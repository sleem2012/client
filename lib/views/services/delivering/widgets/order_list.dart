import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../data/models/orders/get_delivering_order_model.dart';
import '../../../../logic/delivering/get_delivering_order/get_delivering_order_bloc.dart';
import 'order_tile.dart';

class DeliveringOrderList extends StatelessWidget {
  const DeliveringOrderList({Key? key, required this.data}) : super(key: key);
  final List<DeliveringOrderData> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: RefreshIndicator(
        onRefresh: () async {
          await GetDeliveringOrderBloc.of(context).getDeliveringOrders();
        },
        child: data.isEmpty
            ? Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SvgPicture.asset('assets/images/no orders.svg'),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, i) => DeliveringOrderTile(orderData: data[i]),
                separatorBuilder: (context, i) => const SizedBox(height: 10),
                itemCount: data.length,
              ),
      ),
    );
  }
}

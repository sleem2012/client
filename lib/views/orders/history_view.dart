import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:forall_client/shared/localization/trans.dart';
import 'package:forall_client/shared/theme/helper.dart';
import 'package:forall_client/shared/theme/text_theme.dart';
import 'package:forall_client/views/reports/reports_list_view.dart';
import 'package:forall_client/views/widgets/appbar.dart';
import 'package:forall_client/views/widgets/new_bg_img.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../services/booking_car/Trips_history/trips_history_screen.dart';
import '../services/delivering/delivering_order/delivering_order_screen.dart';
import 'order_screen.dart';
import 'request_quote/request_quote_list.dart';



class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: Tr.get.order_history),
      body: BgImg(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              OrderTypeTile(
                onTap: () {
                  Nav.to(const OrderScreen());
                },
                icon: FontAwesomeIcons.clockRotateLeft,
                text: Tr.get.orders,
              ),
              10.h,
              OrderTypeTile(
                onTap: () {
                  Nav.to(const DeliveringOrderScreen());
                },
                icon: FontAwesomeIcons.truckFast,
                text: Tr.get.delivering_orders,
              ),
              10.h,
              OrderTypeTile(
                onTap: () {
                  Nav.to(const TripsHistoryScreen());
                },
                icon: FontAwesomeIcons.car,
                text: Tr.get.trips_history,
              ),
              10.h,
              OrderTypeTile(
                onTap: () {
                  Nav.to(const RequestsLanding());
                },
                icon: Icons.email,
                text: Tr.get.request_for_quote,
              ),
              10.h,
              OrderTypeTile(
                onTap: () {
                  Nav.to(const ReportLandingView());
                },
                icon: Icons.send,
                text: Tr.get.report,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderTypeTile extends StatelessWidget {
  const OrderTypeTile({Key? key, required this.icon, required this.text, required, required this.onTap}) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: KHelper.of(context).elevatedBox.copyWith(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 20),
                20.w,
                Text(
                  text,
                  style: KTextStyle.of(context).body1,
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }
}

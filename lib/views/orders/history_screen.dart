import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:forall_client/views/orders/widgets/order_tile.dart';

import '../../di.dart';
import '../../logic/orders/get_orders/get_orders_bloc.dart';
import '../../logic/orders/order_status/order_status_bloc.dart';
import '../../logic/orders/order_status/order_status_state.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';
import '../widgets/appbar.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import 'order_review.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.orderStatusBloc..get(GetOrderBloc.of(context).selectedOrderData!.id!),
      child: Scaffold(
        appBar: KAppBar(title: Tr.get.status),
        body: BgImg(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<OrderStatusBloc, OrderStatusState>(
              builder: (context, state) {
                final status = OrderStatusBloc.of(context);
                return state.when(
                  loading: () => const KLoadingOverlay(isLoading: true),
                  success: (model) {
                    return Column(
                      children: [
                        OrderTile(orderData: GetOrderBloc.of(context).getSelected),
                        Expanded(
                          flex: 3,
                          child: AnotherStepper(
                            scrollPhysics: NeverScrollableScrollPhysics(),
                            gap: 20,
                            titleTextStyle: KTextStyle.of(context).title2,
                            stepperList: status.getStepperData(),
                            stepperDirection: Axis.vertical,
                            horizontalStepperHeight: 70,
                            dotWidget: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(color: KColors.of(context).accentColor, borderRadius: const BorderRadius.all(Radius.circular(30))),
                              child: Icon(FontAwesomeIcons.check, color: KColors.of(context).sBackground),
                            ),
                            activeBarColor: KColors.of(context).accentColor,
                            inActiveBarColor: Colors.black,
                            activeIndex: status.getStepperData().length - 1,
                          ),
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Your order has been refunded successfully!',
                                style: KTextStyle.of(context).black_txt.S(1.5).B,
                              ),
                              12.h,
                              Text(
                                'Please check your wallet/Bank account',
                                style: KTextStyle.of(context).black_txt.S(1.4),
                              ),
                              12.h,
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderReview()));
                                },
                                child: Text(Tr.get.rate_order, style: KTextStyle.of(context).names),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error) => KErrorWidget(
                    error: error,
                    onTryAgain: () {
                      final id = GetOrderBloc.of(context).selectedOrderData!.id!;
                      OrderStatusBloc.of(context).get(id);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

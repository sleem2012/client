import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:forall_client/shared/theme/text_theme.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../logic/orders/get_orders/get_orders_bloc.dart';
import '../../logic/orders/get_orders/get_orders_state.dart';
import '../../shared/localization/trans.dart';
import '../widgets/appbar.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/slugs_drop_down.dart';
import 'order_list.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);
  late KSlugModel? selectedTab = KSlugModel.OrderState.firstOrNull;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: Tr.get.orders),
      body: BlocBuilder<GetOrderBloc, GetOrdersState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const KLoadingOverlay(isLoading: true),
            loading: () => const KLoadingOverlay(isLoading: true),
            error: (error) => KErrorWidget(error: error, onTryAgain: GetOrderBloc.of(context).getOrder),
            orElse: () => const SizedBox(),
            success: (model) => BgImg(
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.transparent,
                    onTap: (i) {
                      setState(() {
                        selectedTab = KSlugModel.OrderState[i];
                        debugPrint(selectedTab?.translated.toString());
                      });
                    },
                    padding: EdgeInsets.symmetric(horizontal: Get.height / 50, vertical: 15),
                    controller: tabController,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    // indicatorSize: TabBarIndicatorSize.label,
                    tabs: KSlugModel.OrderState.map(
                      (e) => Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              e.translated,
                              style: e != selectedTab ? KTextStyle.of(context).accent_txt_B.S(1.2) : KTextStyle.of(context).black_txt.S(1.4).B,
                            ),
                          ),
                          if (e.slug != 'refund')
                            Container(
                              width: 2,
                              height: 20,
                              color: Colors.black,
                            )
                        ],
                      ),
                    ).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ...KSlugModel.OrderState.map(
                          (e) => OrderList(stateSlug: e.slug),
                        ).toList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:get/get.dart';

import '../../../../logic/delivering/get_delivering_order/get_delivering_order_bloc.dart';
import '../../../../logic/delivering/get_delivering_order/get_delivering_order_state.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/loading/loading_overlay.dart';
import '../../../widgets/new_bg_img.dart';
import '../../../widgets/slugs_drop_down.dart';
import '../widgets/order_list.dart';

class DeliveringOrderScreen extends StatefulWidget {
  const DeliveringOrderScreen({Key? key}) : super(key: key);

  @override
  State<DeliveringOrderScreen> createState() => _DeliveringOrderScreenState();
}

class _DeliveringOrderScreenState extends State<DeliveringOrderScreen> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  KSlugModel? selectedTab = KSlugModel.DeliveringOrderState.firstOrNull;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KAppBar(title: Tr.get.delivering_orders),
        body: BlocBuilder<GetDeliveringOrderBloc, GetDeliveringOrderState>(builder: (context, state) {
          final delivering = GetDeliveringOrderBloc.of(context);
          return KLoadingOverlay(
            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
            child: BgImg(
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.transparent,
                    onTap: (i) {
                      setState(() {
                        selectedTab = KSlugModel.DeliveringOrderState[i];
                      });
                    },
                    padding: EdgeInsets.symmetric(horizontal: Get.height / 50, vertical: 15),
                    controller: tabController,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    tabs: KSlugModel.DeliveringOrderState.map(
                      (e) => Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              e.translated,
                              style: e != selectedTab ? KTextStyle.of(context).accent_txt_B.S(1.2) : KTextStyle.of(context).black_txt.S(1.4).B,
                            ),
                          ),
                          if (e.slug != 'completed')
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
                        DeliveringOrderList(data: delivering.statusOrder() ?? []),
                        DeliveringOrderList(data: delivering.historyOrder() ?? []),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}

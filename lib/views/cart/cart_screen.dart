// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../di.dart';
import '../../packages/extensions.dart';
import '../../logic/cart/cart_bloc.dart';
import '../../logic/cart/cart_state.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';
import 'widgets/cart_widget.dart';
import '../services/checkout/new_cehck_out.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/not_loggedin.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, this.showAppBar = true}) : super(key: key);

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? KAppBar(title: Tr.get.cart) : null,
      body: KNotLoggedInView(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            final branches = CartBloc.of(context).cartModel?.data?.branches ?? [];
            return KLoadingOverlay(
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              child: BgImg(
                child: RefreshIndicator(
                  onRefresh: () async {
                    CartBloc.of(context).get_cart(isLoading: true);
                  },
                  child: branches.isNotEmpty
                      ? Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, i) {
                                  return const Divider(thickness: 1);
                                },
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                                itemCount: branches.length,
                                itemBuilder: (context, i) => ShipmentItemsList(cartBranch: branches[i]),
                              ),
                            ),
                            KButton(
                              width: Get.width * .92,
                              title: '${Tr.get.checkout} ${CartBloc.of(context).cartModel?.data?.total ?? '0'}',
                              onPressed: () async {
                                final cb = CartBloc.of(context);
                                await Get.to(() => BlocProvider(
                                      create: (context) => Di.checkout..get_checkout(),
                                      child: const NewCheckOut(),
                                    ));

                                cb.get_cart();
                              },
                            ),
                            const SizedBox(height: 85)
                          ],
                        )
                      : ListView(
                          children: [
                            SizedBox(
                              height: Get.height * .8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset('assets/images/Empty Cart.svg',color: KColors.accentColorD,height:120 ),
                                  30.h,
                                  Text(
                                    '${Tr.get.your_cart_is_empty} \n ${Tr.get.shop_now}',
                                    style: KTextStyle.of(context).headers,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/widgets/web_view.dart';
import 'package:get/get.dart';

import '../../../data/models/cart/cart_model.dart';
import '../../../di.dart';
import '../../../packages/extensions.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../logic/checkout/checkout_bloc.dart';
import '../../../logic/checkout/checkout_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../logic/orders/create_order/create_orders_bloc.dart';
import '../../../logic/orders/create_order/create_orders_state.dart';
import '../../../logic/orders/get_orders/get_orders_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../orders/order_screen.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/on_error_view.dart';
import '../../widgets/on_success_view.dart';
import '../../widgets/shimmer_box.dart';
import 'widgets/address_card.dart';
import 'widgets/checkout_payment.dart';
import 'widgets/summary_card.dart';

class NewCheckOut extends StatelessWidget {
  const NewCheckOut({super.key});

  onOrderSuccess(BuildContext context, String url) {
    if (url.isNotEmpty) {
      debugPrint("url=>>>$url");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: const KAppBar(),
            body: Center(
                child: KWebView(
              url: url,
              onSuccess: () {
                debugPrint("url$url");
                final orderId = url.split('=').last;
                debugPrint("url id=>${url.split('=').last}");
                CreateOrdersBloc.of(context).send_order(orderId: int.tryParse(orderId) ?? -1);
                // CheckoutBloc.of(context).get_cart();
                Nav.back();
                Nav.replace(OnSuccessView(msg: Tr.get.order_success, doubleBack: true, destination: const OrderScreen()));
                GetOrderBloc.of(context).getOrder();
              },
              onFail: () {
                debugPrint(url.toString());
                Nav.replace(OnErrorView(msg: Tr.get.error_card, doubleBack: true));
              },
            )),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.createOrder),
      ],
      child: Scaffold(
        appBar: const KAppBar(showCart: false),
        body: BgImg(
          child: BlocConsumer<CreateOrdersBloc, CreateOrdersState>(
            listener: (context, state) {
              state.whenOrNull(success: (url) => onOrderSuccess(context, url), error: (error) => CartBloc.of(context).get_cart());
            },
            builder: (context, state) {
              return KLoadingOverlay(
                isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: KHelper.hPadding),
                        child: BlocBuilder<CheckoutBloc, CheckOutState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AddressCard(),
                                Divider(color: KColors.of(context).accentColor, height: 15),
                                Text(Tr.get.items, style: KTextStyle.of(context).boldTitle1),
                                KRequestOverlay(
                                  loadingWidget: const ShimmerBox(
                                    height: 50,
                                  ),
                                  isLoading: state is CheckOutStateLoading,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: CheckoutBloc.of(context).branches.length,
                                    physics: const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return Divider(color: KColors.of(context).accentColor, height: 1);
                                    },
                                    itemBuilder: (context, index) {
                                      final ship = CheckoutBloc.of(context).branches[index];
                                      return Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(ship.vendorName.toString().capitalized, style: KTextStyle.of(context).boldTitle2),
                                            const SizedBox(height: 5),
                                            ...(ship.items ?? []).map((e) => CheckoutItemTile(item: e)).toList(),
                                            if ((ship.shippers?.offers ?? []).isNotEmpty) ...[
                                              Wrap(
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: [
                                                  Text(Tr.get.choose_delivery_option, style: KTextStyle.of(context).boldTitle2.copyWith(fontSize: 9)),
                                                  ...(ship.shippers!.offers ?? [])
                                                      .map(
                                                        (e) => ProviderOfferTile(
                                                          offer: e,
                                                          isSelected: CheckoutBloc.of(context).selectedOffers[ship.id] == e,
                                                          onSelect: (offer) {
                                                            return CheckoutBloc.of(context).selectOffer({ship.id: offer});
                                                          },
                                                        ),
                                                      )
                                                      .toList()
                                                ],
                                              )
                                            ],
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 5),
                                CustomRowWithDivider(
                                  leading: CircleAvatar(maxRadius: 17, backgroundColor: KColors.of(context).accentColor, child: const Icon(Icons.percent, color: Colors.white)),
                                  trailing: KButton(
                                    title: Tr.get.apply,
                                    width: Get.width * .2,
                                    height: 30,
                                    onPressed: () {},
                                  ),
                                  title: Tr.get.add_promo_code,
                                ),
                                const SizedBox(height: 5),
                                Text(Tr.get.card_info, style: KTextStyle.of(context).boldTitle2),
                                const SizedBox(height: 5),
                                const CheckoutPayment(),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SummaryCard(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomRowWithDivider extends StatelessWidget {
  const CustomRowWithDivider({Key? key, required this.leading, required this.trailing, required this.title}) : super(key: key);
  final Widget leading;
  final Widget trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: KColors.of(context).accentColor,
          height: 5,
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          title: Text(
            title,
            style: KTextStyle.of(context).boldTitle2,
          ),
          leading: leading,
          trailing: trailing,
        ),
        Divider(
          color: KColors.of(context).accentColor,
          height: 5,
        ),
      ],
    );
  }
}

class CheckoutItemTile extends StatelessWidget {
  const CheckoutItemTile({super.key, required this.item});

  final CartItems item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Text.rich(TextSpan(children: [
        TextSpan(children: [
          TextSpan(
            text: ("${item.quantity ?? "0"}x  "),
            style: KTextStyle.of(context).body3,
          ),
          TextSpan(
            text: item.name.toString().capitalized,
            style: KTextStyle.of(context).blackbody3,
          ),
          TextSpan(
            text: " (${item.productColor?.name.toString().capitalized ?? ''}" "/${item.productSize?.name.toString().capitalized ?? ''})",
            style: KTextStyle.of(context).blackbody3,
          ),
        ]),
      ])),
    );
  }
}

class ProviderOfferTile extends StatelessWidget {
  const ProviderOfferTile({Key? key, required this.offer, required this.onSelect, required this.isSelected}) : super(key: key);

  final ProviderOfferModel offer;
  final bool isSelected;
  final Function(ProviderOfferModel offer) onSelect;

  @override
  Widget build(BuildContext context) {
    TextStyle style = KTextStyle.of(context).btntitle.copyWith(fontWeight: FontWeight.bold, color: isSelected ? Colors.white : KColors.of(context).accentColor);
    return InkWell(
      onTap: () => onSelect.call(offer),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: isSelected ? KHelper.of(context).selectedBox : KHelper.of(context).outSelectedBox,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PriceWidget(price: offer.price.toString(), currency: CartBloc.of(context).currency,color: Colors.black,style: KTextStyle.of(context).title3,dotStyle:KTextStyle.of(context).title5 ),

              Text(
                "${offer.name.toString().capitalized} (${offer.price})",
                style: style.copyWith(fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

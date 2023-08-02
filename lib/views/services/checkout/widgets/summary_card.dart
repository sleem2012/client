import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../packages/extensions.dart';
import '../../../../logic/checkout/checkout_bloc.dart';
import '../../../../logic/checkout/checkout_state.dart';
import '../../../../logic/orders/create_order/create_orders_bloc.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../widgets/custom_button.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: KHelper
          .of(context)
          .bsBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(Tr.get.payment_information, style: KTextStyle.of(context).title4),
          // const SizedBox(height: 10),
          BlocBuilder<CheckoutBloc, CheckOutState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// _buildSummaryText(
                  ///     context,
                  ///     Row(
                  ///       children: [
                  ///         Text(
                  ///           'Shipping',
                  ///           style: KTextStyle.of(context).body.copyWith(fontSize: 12, color: KColors.of(context).text),
                  ///         ),
                  ///         KIconButton(
                  ///           onPressed: () {
                  ///             Get.bottomSheet(ShippingBottomSheet(
                  ///               shipping: CheckoutBloc.of(context).cartModel?.data?.branches ?? [],
                  ///             ));
                  ///           },
                  ///           child: const Icon(Icons.question_mark_rounded, size: 15),
                  ///         ),
                  ///       ],
                  ///     ),
                  ///     CheckoutBloc.of(context).cartModel?.data?.total ?? '0'),

                  for (var x in CheckoutBloc
                      .of(context)
                      .paymentDetails)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _buildSummaryText(
                        context,
                        Text(x.name
                            .toString()
                            .capitalized, style: KTextStyle
                            .of(context)
                            .boldTitle2),
                        x.price.toString(),
                      ),
                    ),
                  const SizedBox(height: 5),
                  Divider(color: KColors
                      .of(context)
                      .accentColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Tr.get.total, style: KTextStyle
                          .of(context)
                          .body
                          .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                      Text(
                        CheckoutBloc
                            .of(context)
                            .totalPrice,
                        style: KTextStyle
                            .of(context)
                            .body
                            .copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  BlocBuilder<CheckoutBloc, CheckOutState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 25),
                        child: KButton(
                          title: '${Tr.get.confirm} ${CheckoutBloc
                              .of(context)
                              .totalPrice}',
                          onPressed: () {
                            CreateOrdersBloc.of(context).createOrder(
                                CheckoutBloc
                                    .of(context)
                                    .selectedOffers);
                            // if (CheckoutBloc
                            //     .of(context)
                            //     .selectedOffers
                            //     .isNotEmpty&&) {
                            //
                            // }
                            // else {
                            //   CheckoutBloc.of(context).selectDefaultOffer();
                            //   KHelper.showSnackBar(
                            //       Tr.get.youDontChooseDeliveryOption);
                            // }
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildSummaryText(context, Widget child, amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [child, Text(amount, style: KTextStyle
        .of(context)
        .blackbody3,)
    ],
  );
}

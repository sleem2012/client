import 'package:flutter/material.dart';
import '../../../data/models/cart/cart_model.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/text_theme.dart';

import 'cart_card.dart';

class ShipmentItemsList extends StatelessWidget {
  const ShipmentItemsList({Key? key, required this.cartBranch}) : super(key: key);
  final CartBranch cartBranch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: cartBranch.features!.maybeWhen(
                  shopping: () => Tr.get.shoppingFeature,
                  ticketing: () => Tr.get.ticketingFeature,
                  service: () => Tr.get.serviceFeature,
                  carrying: () => Tr.get.carringFeature,
                  orElse: () => Tr.get.shoppingFeature,
                ),
              ),
              TextSpan(text: ' ( ${cartBranch.items?.length ?? 0} )', style: KTextStyle.of(context).boldTitle2,)
            ],
            style: KTextStyle.of(context).boldTitle2,
          ),
        ),
        const SizedBox(height: 15),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, i) => const SizedBox(height: 5),
          itemBuilder: (context, i) => CartCard(
            item: cartBranch.items![i],
            features: cartBranch.features,
            onDelete: () {
              CartBloc.of(context).remove(cartBranch, i);
            },
          ),
          itemCount: cartBranch.items?.length ?? 0,
        ),
      ],
    );
  }
}

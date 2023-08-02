import 'package:flutter/material.dart';
import '../../../data/models/services/feature_type.dart';
import '../../widgets/amount_changer.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../widgets/price_widget.dart';
import 'package:get/get.dart';

import '../../../data/models/cart/cart_model.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'extra_dialog.dart';
import '../../widgets/action_dialog.dart';
import '../../widgets/hero_dialog/btn_to_dialog.dart';

String getDateTitle(FeatureType? features, bool isFrom) {
  return features!.maybeWhen(
    shopping: () => Tr.get.delivered_at,
    ticketing: () => isFrom ? Tr.get.from : Tr.get.to,
    service: () => isFrom ? Tr.get.start : Tr.get.end,
    carrying: () => isFrom ? Tr.get.pickup_date : Tr.get.dropDown,
    orElse: () => Tr.get.delivered_at,
  );
}

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.item, required this.onDelete, this.features}) : super(key: key);
  final CartItems item;
  final Function onDelete;
  final FeatureType? features;

  @override
  Widget build(BuildContext context) {
    String? formatFrom;
    String? formatTo;
    if (item.timePikerFrom != null) {
      final date = DateTime.parse(item.timePikerFrom!);
      formatFrom = KHelper.apiDateFormatter(date);
    }
    if (item.timePikerTo != null) {
      final date = DateTime.parse(item.timePikerTo!);
      formatTo = KHelper.apiDateFormatter(date);
    }
    final width = MediaQuery.of(context).size.width;

    return Dismissible(
      confirmDismiss: (direction) async {
        return await showModalBottomSheet(
          context: context,
          backgroundColor: KColors.of(context).background,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          builder: (BuildContext context) {
            return ActionDialog(
              title: Tr.get.remove_product,
              approveAction: Tr.get.yes_message,
              cancelAction: Tr.get.no_message,
              onApproveClick: () {
                Navigator.pop(context, true);
              },
              onCancelClick: () {
                Navigator.pop(context, false);
              },
            );
          },
        );
      },
      onDismissed: (direction) {
        onDelete();
      },
      background: Container(color: Colors.red),
      key: Key(item.id.toString()),
      child: SizedBox(
        child: SizedBox(
          height: width * .3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: AmountChanger(id: item.id ?? -1, isVertical: true),
              ),
              const SizedBox(
                width: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  width: width * .23,
                  height: width * .3,
                  child: KImageWidget(imageUrl: item.images?.firstOrNull?.s128px ?? dummyNetLogo, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name ?? '', style: KTextStyle.of(context).title1),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            if (item.productColor?.name != null) Text(item.productColor?.name ?? '', style: KTextStyle.of(context).body1),
                            if (item.productSize?.symbol != null) Text(" / ", style: KTextStyle.of(context).body1),
                            if (item.productSize?.symbol != null)
                              Expanded(
                                child: Text(
                                  "${item.productSize?.symbol?.capitalize}",
                                  style: KTextStyle.of(context).body1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            PriceWidget(
                                price: item.price.toString(),
                                currency: CartBloc.of(context).currency,
                                color: Colors.black,
                                style: KTextStyle.of(context).title3,
                                dotStyle: KTextStyle.of(context).title5),
                            const SizedBox(width: 10),
                            if (item.isOffer!) Text('${item.discount}', style: KTextStyle.of(context).lineThrough),
                            if (item.isOffer!) Text("  ${CartBloc.of(context).currency}", style: KTextStyle.of(context).body2),
                          ],
                        ),
                        if (item.timePikerFrom != null)
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '${getDateTitle(features, true)} : ', style: KTextStyle.of(context).names),
                                TextSpan(
                                  text: formatFrom ?? "",
                                  style: KTextStyle.of(context).blackbody3,
                                ),
                              ],
                            ),
                          ),
                        if (item.timePikerTo != null)
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '${getDateTitle(features, false)} : ', style: KTextStyle.of(context).names),
                                TextSpan(
                                  text: formatTo ?? "this is a note",
                                  style: KTextStyle.of(context).blackbody3,
                                ),
                              ],
                            ),
                          ),
                        if (item.note != null)
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '${Tr.get.note} : ', style: KTextStyle.of(context).names),
                                TextSpan(
                                  text: item.note ?? "this is a note",
                                  style: KTextStyle.of(context).blackbody3,
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // ItemDeleteButton(onDelete: onDelete),
                  if ((item.extras ?? []).isNotEmpty) ItemExtraButton(item: item),
                ],
              ),
              const SizedBox(width: 2)
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDeleteButton extends StatelessWidget {
  const ItemDeleteButton({Key? key, required this.onDelete}) : super(key: key);

  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ActionDialog(
          title: Tr.get.remove_product,
          approveAction: Tr.get.yes_message,
          cancelAction: Tr.get.no_message,
          onApproveClick: () {
            Navigator.pop(context);
            onDelete();
          },
          onCancelClick: () {
            Navigator.pop(context);
          },
        ).show<void>(context);
      },
      child: const Icon(Icons.close_rounded, size: 18, color: Colors.red),
    );
  }
}

class ItemExtraButton extends StatelessWidget {
  const ItemExtraButton({Key? key, required this.item}) : super(key: key);

  final CartItems item;

  @override
  Widget build(BuildContext context) {
    return KButtonToDialog(
      tag: item.hashCode.toString(),
      dialog: ExtraDialog(item: item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: KHelper.of(context).freeShipping,
        child: Text(Tr.get.extra, style: KTextStyle.of(context).body2.copyWith(color: Colors.white)),
      ),
    );
  }
}

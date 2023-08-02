import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/products/products_model.dart';
import '../../../logic/hotels/hotel_extra_bloc.dart';
import '../../../logic/hotels/hotel_extra_state.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/widgets/image_widget.dart';
import 'package:get/get.dart';

class ExtraCard extends StatefulWidget {
  const ExtraCard({Key? key, required this.extras}) : super(key: key);
  final Extras extras;

  @override
  State<ExtraCard> createState() => _ExtraCardState();
}

class _ExtraCardState extends State<ExtraCard> {
  bool selected = false;
  int amount = 1;

  @override
  void initState() {
    // ProductDetailsBloc.of(context).setAmountMap();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 3,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: selected ? KColors.of(context).accentColor : Colors.transparent),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {
              setState(() {
                if (selected == false) {
                  // debugPrint(ProductDetailsBloc.of(context).extraAmountMap.toString());
                  HotelExtraBloc.of(context).extraAmountList.add( HotelExtraBloc.of(context).extraAmountMap[widget.extras.id] ?? 0);
                  HotelExtraBloc.of(context).extraIds.add(widget.extras.id ?? 0);
                  selected = true;
                } else {
                  // debugPrint( HotelExtraBloc.of(context).extraAmountMap.toString());

                  HotelExtraBloc.of(context).extraAmountList.remove(HotelExtraBloc.of(context).extraAmountMap[widget.extras.id] ?? 0);

                  HotelExtraBloc.of(context).extraIds.remove(widget.extras.id ?? 0);

                  selected = false;
                }
                debugPrint( HotelExtraBloc.of(context).extraIds.toString());
              });
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: Get.width * .7,
                  height: 150,
                  color: KColors.of(context).background,
                  child: KImageWidget(
                    imageUrl: widget.extras.imageValues?[0].s128px ?? '',
                    fit: BoxFit.cover,

                  ),
                ),
                Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: KHelper.of(context).elevatedBox.copyWith(borderRadius: BorderRadius.circular(0)),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.extras.product?.name?.value ?? '',
                                    style: KTextStyle.of(context).title4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    widget.extras.price ?? '',
                                    style: KTextStyle.of(context).tilePropsValues,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    widget.extras.product?.category?.name ?? '',
                                    style: KTextStyle.of(context).tilePropsValues,
                                  ),
                                ),
                                if (selected)
                                  BlocBuilder<HotelExtraBloc, HotelExtraState>(
                                    builder: (context, state) {
                                      final product = HotelExtraBloc.of(context);

                                      return Row(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(7),
                                              decoration: BoxDecoration(color: KColors.of(context).freeShiping, borderRadius: BorderRadius.circular(8)),
                                              child: const Icon(Icons.remove, color: Colors.white, size: 10),
                                            ),
                                            onTap: () {
                                              product.decreaseExtraAmount(widget.extras.id);
                                            },
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            product.extraAmountMap[widget.extras.id].toString(),
                                            style: KTextStyle.of(context).body.copyWith(color: KColors.of(context).text, fontSize: 15),
                                          ),
                                          const SizedBox(width: 8),
                                          InkWell(
                                            onTap: () {
                                              product.increaseExtraAmount(widget.extras.id);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(7),
                                              decoration: BoxDecoration(color: KColors.of(context).freeShiping, borderRadius: BorderRadius.circular(8)),
                                              child: const Icon(Icons.add, color: Colors.white, size: 10),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

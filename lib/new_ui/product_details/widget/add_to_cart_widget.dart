import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/products/products_model.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../logic/cart/cart_state.dart';
import '../../../logic/hotels/hotel_extra_bloc.dart';
import '../../../logic/products/product_details/product_details_bloc_cubit.dart';
import '../../../logic/products/product_details/product_details_bloc_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/services/widgets/schedule_picker.dart';
import '../../../views/widgets/text_field.dart';
import 'package:get/get.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({Key? key, required this.productsData})
      : super(key: key);
  final ProductsSystemData productsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                final cartBloc = CartBloc.of(context);
                return KTextFormField(
                    controller: cartBloc.noteController,
                    hintText: Tr.get.write_your_note,
                    suffixIcon: InkWell(
                      onTap: () async {
                        final proBloc = HotelExtraBloc.of(context);

                        final details = ProductDetailsBloc.of(context);
                        debugPrint(proBloc.productMenu?.amount.toString());

                        if (productsData.hasTimePicker == true) {
                          final dateFrom = productsData.isOneTime!
                              ? await Get.bottomSheet<DateTime>(
                                  SchedulePicker(
                                      pro_menu_id: proBloc.productMenu?.id,
                                      duration:
                                          proBloc.productMenu?.duration ?? 0),
                                )
                              : await Get.bottomSheet<DateTime>(
                                  ScheduleRangePicker(
                                      duration:
                                          proBloc.productMenu?.duration ?? 0,
                                      pro_menu_id: proBloc.productMenu?.id),
                                );
                          if (dateFrom == null) return;
                          final dateTo = productsData.isOneTime!
                              ? await Get.bottomSheet<DateTime>(
                                  ScheduleRangePicker(
                                    duration:
                                        proBloc.productMenu?.duration ?? 0,
                                    pro_menu_id: proBloc.productMenu?.id,
                                    firstDate: dateFrom
                                      ..add(const Duration(days: 1)),
                                  ),
                                )
                              : null;
                          if (dateTo == null && productsData.isOneTime!) {
                            return;
                          }

                          String formattedDate =
                              KHelper.apiDateFormatter(dateFrom);
                          String? formattedDateTo = dateTo != null
                              ? KHelper.apiDateFormatter(dateTo)
                              : null;
                          cartBloc.addToCart(
                            proBloc.productMenu?.id ?? -1,
                            details.productAmount,
                            extraIds: proBloc.extraIds.toSet().toList(),
                            extraAmount: proBloc.extraAmountList,
                            date: formattedDate,
                            dateTo: formattedDateTo,
                          );
                        } else {
                          cartBloc.addToCart(
                            proBloc.productMenu?.id ?? -1,
                            details.productAmount,
                            extraIds: proBloc.extraIds.toSet().toList(),
                            extraAmount: proBloc.extraAmountList,
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: KColors.of(context).accentColor),
                        child: state.maybeWhen(
                            orElse: () => Center(
                                  child: (Text(Tr.get.add_to_Cart,
                                      style: KTextStyle.of(context)
                                          .title4
                                          .copyWith(
                                              fontWeight: FontWeight.bold))),
                                ),
                            loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                )),
                      ),
                    ));
              },
            ),
          ),
          Transform.translate(
            offset: const Offset(6, 0),
            child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                final details = ProductDetailsBloc.of(context);
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: KColors.of(context).background),
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: KColors.of(context).freeShiping,
                              shape: BoxShape.circle),
                          child: const Icon(Icons.remove,
                              color: Colors.white, size: 16),
                        ),
                        onTap: () {
                          details.decreaseProductAmount();
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(details.productAmount.toString(),
                        style: KTextStyle.of(context).title4),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: KColors.of(context).background),
                      child: InkWell(
                        onTap: () {
                          details.increaseProductAmount();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: KColors.of(context).freeShiping,
                              shape: BoxShape.circle),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/extensions.dart';
import '../../../logic/products/product_menu/product_menu_state.dart';
import '../../product_details/logic/details_cubit.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/widgets/error/error_widget.dart';
import '../../../packages/widgets/image_widget.dart';

import '../../../data/models/products/products_model.dart';
import '../../../di.dart';
import '../../../logic/products/product_menu/product_menu_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../views/widgets/price_widget.dart';
import '../../../views/widgets/text_field.dart';
import '../../product_details/product_details_entity.dart';
import '../../product_details/widget/main_selection_list.dart';
import 'add_to_cart_button.dart';

class productDetailsBottomSheet extends StatefulWidget {
  const productDetailsBottomSheet({Key? key, required this.data, this.productMenu, this.main, this.sub}) : super(key: key);

  final ProductsSystemData data;
  final ProductMenu? productMenu;
  final ProductSelectable? main;
  final ProductSelectable? sub;

  @override
  State<productDetailsBottomSheet> createState() => _productDetailsBottomSheetState();
}

class _productDetailsBottomSheetState extends State<productDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // final section = SectionTabsCubit.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.productMenuBloc..get(widget.data)),
        BlocProvider(create: (context) => DetailsCubit()),
      ],
      child: BlocConsumer<ProductMenuBloc, ProductMenuState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (data) => DetailsCubit.of(context)
              ..setProductSystem(
                selectedProductMenu: widget.productMenu,
                model: (widget.data).copyWith(products: data),
              )
              ..setMainAndSub(sub: widget.sub, main: widget.main),
          );
        },
        builder: (context, state) {
          final details = DetailsCubit.of(context);
          return state.when(
            initial: () => Center(child: Padding(padding: const EdgeInsets.all(20.0), child: CircularProgressIndicator())),
            loading: () => Center(child: Padding(padding: const EdgeInsets.all(20.0), child: CircularProgressIndicator())),
            success: (model) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38, right: 38, left: 38),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocSelector<DetailsCubit, DetailsState, String>(
                        selector: (state) => details.img,
                        builder: (context, img) {
                          return KImageWidget(imageUrl: img, width: 72.44, height: 61);
                        },
                      ),
                      20.w,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocSelector<DetailsCubit, DetailsState, String>(
                            selector: (state) => details.name,
                            builder: (context, name) {
                              return Text(name.capitalized, style: KTextStyle.of(context).boldTitle1.copyWith(fontSize: 14));
                            },
                          ),
                          8.h,
                          BlocSelector<DetailsCubit, DetailsState, String>(
                            selector: (state) => details.price,
                            builder: (context, price) {
                              return PriceWidget(price: details.price, currency: details.currency);
                            },
                          ),
                          20.h,
                          Row(
                            children: [
                              InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(color: KColors.of(context).accentColor, shape: BoxShape.circle),
                                  child: const Icon(Icons.remove, color: Colors.white, size: 16),
                                ),
                                onTap: () {
                                  details.decreaseProductAmount();
                                },
                              ),
                              const SizedBox(width: 35),
                              BlocSelector<DetailsCubit, DetailsState, String>(
                                selector: (state) => details.productAmount.toString(),
                                builder: (context, amount) {
                                  return Text(amount, style: KTextStyle.of(context).boldTitle1);
                                },
                              ),
                              const SizedBox(width: 35),
                              InkWell(
                                onTap: () {
                                  details.increaseProductAmount();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(color: KColors.of(context).accentColor, shape: BoxShape.circle),
                                  child: const Icon(Icons.add, color: Colors.white, size: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (details.hasMain) ...[
                        Text(Tr.get.colors_available, style: KTextStyle.of(context).boldTitle1),
                        const SizedBox(height: 10),
                        BlocSelector<DetailsCubit, DetailsState, ProductSelectable?>(
                          selector: (state) => DetailsCubit.of(context).selectedMain,
                          builder: (context, state) {
                            return SelectionWrap(
                              data: details.getMainSelection,
                              onSelect: details.onMainSelect,
                              selectedItem: details.selectedMain,
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                      Text(
                        details.hasSub ? Tr.get.sizes_available : Tr.get.select_type,
                        style: KTextStyle.of(context).boldTitle1.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      BlocSelector<DetailsCubit, DetailsState, ProductSelectable?>(
                        selector: (state) => DetailsCubit.of(context).selectedSub,
                        builder: (context, state) {
                          return SelectionWrap(
                            data: details.getSubSelection,
                            onSelect: details.onSubSelect,
                            selectedItem: details.selectedSub,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                23.h,
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Tr.get.add_note_if_you_have, style: KTextStyle.of(context).boldTitle1),
                      10.h,
                      KTextFormField(
                        maxLines: 5,
                        maxLength: 500,
                        hintText: Tr.get.note,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Tr.get.field_required;
                          }
                          return null;
                        },
                      ),
                      30.h,
                      Center(
                        child: AddToCartButton(),
                      ),
                    ],
                  ),
                ),
                30.h,
              ],
            ),
            error: (error) => KErrorWidget(error: KFailure.toError(error), onTryAgain: () => ProductMenuBloc.of(context).get(widget.data)),
          );
        },
      ),
    );
  }
}

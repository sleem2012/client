import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/views/widgets/not_loggedin.dart';
import 'package:get/get.dart';

import '../../data/models/products/products_model.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../../views/widgets/custom_button.dart';
import '../../views/widgets/new_bg_img.dart';
import '../services/company_details.dart';
import '../services/widget/product_card_bottom_sheet.dart';
import 'logic/details_cubit.dart';
import 'product_details_entity.dart';
import 'widget/company_info.dart';
import 'widget/main_selection_list.dart';
import 'widget/new_product_info.dart';
import 'widget/similar_view.dart';
import 'widget/sliver_app_bar.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key, required this.proSys, required this.similar}) : super(key: key);
  final ProductsSystemData proSys;
  final List<ProductsSystemData> similar;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

int? index;
int? secondIndex;

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool get isAr => Directionality.of(context) == TextDirection.rtl;

  cartBottomSheet({ProductMenu? productMenu, ProductSelectable? main, ProductSelectable? sub}) {
    showModalBottomSheet(
      backgroundColor: KColors.of(context).bsBackground,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: true,
      context: context,
      builder: (_) => Wrap(
        children: [
          Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: productDetailsBottomSheet(data: widget.proSys, productMenu: productMenu, sub: sub, main: main),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DetailsCubit()..setProductSystem(model: widget.proSys, similar: widget.similar),
        child: Scaffold(
          body: BlocConsumer<DetailsCubit, DetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              final details = DetailsCubit.of(context);
              return BgImg(
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          KSLiverAppbar(img: DetailsCubit.of(context).img),
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                const SizedBox(height: 20),
                                const NewProductInfo(),
                                const SizedBox(height: 15),
                                const Divider(),
                                InkWell(
                                  onTap: () {
                                    Nav.to(CompanyDetailsView(company: details.company));
                                  },
                                  child: CompanyInfoWidget(company: details.company),
                                ),
                                const Divider(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
                                  margin: const EdgeInsets.symmetric(vertical: 3),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (details.hasMain) ...[
                                        Text(Tr.get.colors_available, style: KTextStyle.of(context).boldTitle1),
                                        const SizedBox(height: 13),
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
                                      ],
                                      const SizedBox(height: 24),
                                      Text(Tr.get.sizes_available, style: KTextStyle.of(context).boldTitle1.copyWith(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 13),
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
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 10),
                                  width: Get.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(Tr.get.description, style: KTextStyle.of(context).boldTitle1),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: null,
                                        child: Text(
                                          details.description,
                                          style: KTextStyle.of(context).title3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
                                  child: Text(Tr.get.similar_product, style: KTextStyle.of(context).boldTitle1),
                                ),
                                const SimilarView()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    KNotLoggedInWidget(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
                        child: CustomBtn(
                          onChange: () {
                            debugPrint(details.id.toString());
                            cartBottomSheet(productMenu: details.selectedProductMenu, main: details.selectedMain, sub: details.selectedSub);
                          },
                          text: Tr.get.add_to_Cart,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:forall_client/views/widgets/not_loggedin.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../data/models/products/products_model.dart';
import '../../../packages/extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/widgets/empty_widget.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../product_details/product_details_view.dart';
import '../logic/vendor_details_cubit.dart';
import 'product_card_bottom_sheet.dart';
import 'section_list.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  late ItemScrollController itemScrollController = ItemScrollController();

  late ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  controlScroll(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {
      final index = itemPositionsListener.itemPositions.value.map((e) => e.index).toList();
      SectionTabsCubit.of(context).changeIndex(index.firstOrNull ?? 0);
    });
  }

  cartBottomSheet() {
    showModalBottomSheet(
      backgroundColor: KColors.of(context).bsBackground,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: true,
      context: context,
      builder: (_) => Wrap(
        children: [
          Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: productDetailsBottomSheet(data: SectionTabsCubit.of(context).proSys ?? ProductsSystemData()),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = SectionTabsCubit.of(context);
    final tags = [ProductTags(id: 1, name: Tr.get.all, subProducts: [])];
    return EmptyWidget(
      list: list.menuProducts,
      title: Tr.get.no_products,
      child: Column(
        children: [
          SectionList(products: tags, onTap: controlScroll),
          15.h,
          Expanded(
            child: ScrollablePositionedList.builder(
              shrinkWrap: true,
              itemPositionsListener: itemPositionsListener,
              itemScrollController: itemScrollController,
              itemCount: tags.length,
              itemBuilder: (context, ind) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(tags[ind].name, style: KTextStyle.of(context).boldTitle1),
                  ),
                  12.h,
                  ListView.builder(
                    itemCount: list.menuProducts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) => ListTile(
                      onTap: () {
                        if ((list.proSystemList[i].products ?? []).isEmpty) {
                          KHelper.showSnackBar(Tr.get.no_products);
                        } else {
                          list.setSingleProSys(i);
                          Get.to(() => ProductDetailsView(proSys: list.proSys ?? ProductsSystemData(), similar: list.proSystemList));
                        }
                      },
                      contentPadding: const EdgeInsets.only(bottom: 10, right: 6, left: 6),
                      leading: KImageWidget(imageUrl: list.menuProducts[i].img, fit: BoxFit.cover, width: 72.44, height: 61),
                      title: Text(list.menuProducts[i].name, style: KTextStyle.of(context).tilePropsValues1),
                      trailing: KNotLoggedInWidget(
                        child: InkWell(
                          onTap: () {
                            if ((list.proSystemList[i].products ?? []).isEmpty) {
                              KHelper.showSnackBar(Tr.get.no_products);
                            } else {
                              list.setSingleProSys(i);
                              cartBottomSheet();
                            }
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: KColors.of(context).accentColor, shape: BoxShape.circle),
                            child: const Icon(Icons.add, color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        list.menuProducts[i].price,
                        style: KTextStyle.of(context).tilePropsValues1.copyWith(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductTags {
  final String name;
  final int id;
  List<MenuTileModel> subProducts;

  ProductTags({required this.name, required this.id, required this.subProducts});
}

class MenuTileModel {
  final String img;
  final String name;
  final String price;
  final String id;

  MenuTileModel({required this.img, required this.name, required this.price, required this.id});
}

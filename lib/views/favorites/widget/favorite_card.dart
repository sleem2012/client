import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../data/models/favourite/favourite_model.dart';
import '../../../data/models/products/products_model.dart';
import '../../../logic/favourite/favorite_bloc.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../packages/widgets/image_widget.dart';
import 'package:get/get.dart';

import '../../../logic/products/pro_helper.dart';
import '../../../new_ui/product_details/product_details_view.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';

class FavoriteCard extends StatelessWidget {
  final FavouriteDataModel model;
  final List<ProductsSystemData> similer;

  const FavoriteCard({Key? key, required this.model, required this.similer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? img = (model.productId?.products?.map((e) => e.imageValues?.first.s128px).toList() ?? []).isNotEmpty
        ? model.productId?.products?.map((e) => e.imageValues?.first.s128px).toList().first
        : null;
    return InkWell(
      onTap: () {
        if ((model.productId?.products ?? []).isNotEmpty) {
          ProductDetailsView(proSys: model.productId!, similar: similer);
        } else {
          KHelper.showSnackBar(Tr.get.no_products);
        }
      },
      child: Container(
        decoration: KHelper.of(context).elevatedBox,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: KImageWidget(
                imageUrl: img ?? dummyNetLogo,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              )
                  // KImageWidget(
                  //   imageUrl: img ?? dummyNetLogo,
                  //   fit: BoxFit.cover,
                  //   width: 120,
                  //   height: 120,
                  // ),
                  ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.productId?.name?.value ?? "",
                      style: KTextStyle.of(context).body2,
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: ProductHelper.reviewAvg(model.productId?.products ?? []),
                      allowHalfRating: true,
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                      onRatingUpdate: (rating) {},
                      itemSize: 9,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      model.productId?.category?.name ?? '',
                      style: KTextStyle.of(context).body2,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${model.productId?.products?.isNotEmpty ?? false ? model.productId?.products?.first.price : 0}',
                      style: KTextStyle.of(context).body,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                    width: 60,
                    child: RawMaterialButton(
                      onPressed: () {
                        if ((model.productId?.products ?? []).isNotEmpty) {
                          Get.to(() => ProductDetailsView(
                                proSys: model.productId!,
                                similar: similer,
                              ));
                        } else {
                          KHelper.showSnackBar(Tr.get.no_products);
                        }
                      },
                      fillColor: KColors.of(context).accentColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Text(Tr.get.view, style: KTextStyle.of(context).editBTN),
                    ),
                  ),
                  const SizedBox(height: 35),
                  KIconButton(
                    onPressed: () {
                      FavoriteBloc.of(context).del(model.id, model.productId);
                    },
                    child: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}

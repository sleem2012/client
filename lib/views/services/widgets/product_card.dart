import 'package:flutter/material.dart';
import '../../../data/models/card_info_model.dart';
import '../../../packages/extensions.dart';
import '../../../logic/favourite/favorite_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/amount_changer.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../widgets/not_loggedin.dart';
import '../../widgets/price_widget.dart';

import '../../../data/models/products/products_model.dart';
import '../../../new_ui/services/widget/product_card_bottom_sheet.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.data, required this.onTap, this.width, this.height}) : super(key: key);
  final Function() onTap;
  final CardDataModel data;
  final double? width;
  final double? height;

  cartBottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: KColors.of(context).bsBackground,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: true,
      context: context,
      builder: (context) => Wrap(
        children: [
          Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: productDetailsBottomSheet(data: data.productsData ?? ProductsSystemData()),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isAr = Directionality.of(context) == TextDirection.rtl;
    return LayoutBuilder(
      builder: (context, si) {
        return SizedBox(
          height: height ?? si.maxHeight,
          width: width ?? si.maxWidth,
          child: DecoratedBox(
            decoration: KHelper.of(context).productElevatedBox,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GestureDetector(
                onTap: onTap,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: si.maxHeight * .06),
                        Center(
                          child: SizedBox(
                            width: si.maxWidth * .7,
                            height: si.maxHeight * .65,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: KImageWidget(
                                imageUrl: data.logo ?? dummyNetLogo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: si.maxHeight * .25,
                          width: si.maxWidth,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    data.name.capitalized,
                                    style: KTextStyle.of(context).boldTitle1..copyWith(fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    8.w,
                                    Expanded(
                                      child: PriceWidget(price: data.price ?? '', currency: data.currency ?? ''),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 3, left: 5, right: 5),
                                            child: KNotLoggedInWidget(
                                              child: AmountBtn(
                                                iconData: Icons.add,
                                                onTap: () {
                                                  if ((data.productsData?.products ?? []).isEmpty) {
                                                    KHelper.showSnackBar(Tr.get.no_products);
                                                  } else {
                                                    cartBottomSheet(context);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: -2,
                      right: isAr ? null : 0,
                      left: isAr ? 0 : null,
                      child: KNotLoggedInWidget(
                        child: KIconButton(
                          onPressed: () {
                            FavoriteBloc.of(context).add(data.id, data.productsData);
                          },
                          child: Icon(
                            FavoriteBloc.of(context).isFav(data.id) ? Icons.favorite : Icons.favorite_border,
                            color: KColors.of(context).accentColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
// Positioned(
// bottom: si.maxHeight * .40 + 5,
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 5),
// child: RatingBar.builder(
// initialRating: data.rate,
// allowHalfRating: true,
// itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
// onRatingUpdate: (rating) {},
// ignoreGestures: true,
// itemSize: 9,
// ),
// ),
// ),

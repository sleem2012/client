import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../data/models/products/products_model.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../logic/products/product_details/product_details_bloc_cubit.dart';
import '../../../logic/products/product_details/product_details_bloc_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/services/products/review_screen.dart';

import '../../../logic/products/pro_helper.dart';
import '../../../shared/theme/helper.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key, required this.data}) : super(key: key);
  // final bool isVisibleCart;
  final ProductsSystemData data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        final details = ProductDetailsBloc.of(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(details.proName ?? '', style: KTextStyle.of(context).title1)),
                  Row(
                    children: [
                      IgnorePointer(
                        child: RatingBar.builder(
                          initialRating: ProductHelper.reviewAvg([details.selectedProductMenu]),
                          allowHalfRating: true,
                          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                          onRatingUpdate: (rating) {},
                          itemSize: 9,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text((details.productsSys.products?.first.review?.length).toString(), style: KTextStyle.of(context).hint),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          Nav.to(ReviewsScreen(id: details.proMenuId));
                        },
                        child: Text(Tr.get.write_a_review, style: KTextStyle.of(context).hintWithUnderLine),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(details.selectedProductMenu?.price ?? '', style: KTextStyle.of(context).title3),
                  const SizedBox(width: 10),
                  if (details.selectedProductMenu?.has_offer ?? false)
                    Text(details.selectedProductMenu?.discount ?? '',
                        style: KTextStyle.of(context).lineThrough.copyWith(decoration: TextDecoration.lineThrough)),
                  const SizedBox(width: 10),
                  const Spacer(),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

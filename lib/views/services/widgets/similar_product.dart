import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/card_info_model.dart';
import '../../../data/models/products/products_model.dart';
import '../../../logic/favourite/favorite_bloc.dart';
import '../../../logic/favourite/favourite_state.dart';
import '../../../logic/products/product_details/product_details_bloc_cubit.dart';
import '../../../logic/products/product_details/product_details_bloc_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'product_card.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SimilarProduct extends StatelessWidget {
  final List<ProductsSystemData> similar;

  const SimilarProduct({Key? key, required this.similar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Tr.get.similar_product, style: KTextStyle.of(context).title3),
              const SizedBox(height: 10),
              BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                builder: (context, state) {
                  return SizedBox(
                    height: Get.height/4,
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, i) => const SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: (similar.length),
                      itemBuilder: (c, i) {
                        return ProductCard(
                          width: 200,
                          data: CardDataModel.fromProData(similar[i]),
                          onTap: () {
                            if ((similar[i].products ?? []).isNotEmpty) {
                              ProductDetailsBloc.of(context).setProduct(similar[i]);
                            } else {
                              KHelper.showSnackBar(Tr.get.no_products);
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

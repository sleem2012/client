import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/card_info_model.dart';
import '../../../data/models/products/products_model.dart';
import '../../../logic/favourite/favorite_bloc.dart';
import '../widgets/no_products.dart';
import '../widgets/product_card.dart';
import '../widgets/shimmer_grid.dart';
import '../../widgets/error/error_view.dart';
import '../../widgets/load_more_wrapper.dart';
import 'package:get/get.dart';

import '../../../logic/favourite/favourite_state.dart';
import '../../../logic/products/product_system_bloc/products_bloc.dart';
import '../../../logic/products/product_system_bloc/products_state.dart';
import '../../../new_ui/product_details/product_details_view.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        return state.when(
          loading: () => const ShimmerGrid(shrinkWrap: true),
          loadMore: (model) =>
              ProductsSysGridView(items: model.data ?? [], loadingMore: true),
          success: (model) =>
              ProductsSysGridView(items: model.data ?? [], loadingMore: false),
          error: (error) => KErrorView(error: error),
        );
      },
    );
  }
}

class ProductsSysGridView extends StatelessWidget {
  const ProductsSysGridView(
      {super.key, required this.items, required this.loadingMore});

  final List<ProductsSystemData> items;
  final bool loadingMore;

  @override
  Widget build(BuildContext context) {
    final bloc = GetProductsBloc.of(context);

    if (items.isEmpty) return const KNoProductsView();

    return BlocConsumer<FavoriteBloc, FavoriteState>(
      listener: (context, favState) {
        favState.whenOrNull(
            toggleSuccess: () => FavoriteBloc.of(context).get(false));
      },
      builder: (context, favState) {
        return LoadMoreWrapper(
          crossAxisSpacing: 15,
          childAspectRatio: .9,
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          isLoadingMore: loadingMore,
          itemCount: items.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (c, i) {
            return ProductCard(
              data: CardDataModel.fromProData(items[i]),
              onTap: () {
                debugPrint('================= ${items.length} : ');
                if ((items[i].products ?? []).isNotEmpty) {
                  Get.to(() => ProductDetailsView(
                        proSys: items[i],
                        similar: items,
                      ));
                } else {
                  KHelper.showSnackBar(Tr.get.no_products);
                }
              },
            );
          },
          onLoadMore: () async {
            bloc.add(
                GetProductsEvents.get(isMore: true, sub: bloc.selectedCat));
          },
          onRefresh: () async {
            bloc.add(GetProductsEvents.get(
                isMore: false, sub: bloc.selectedCat, isRefresh: true));
          },
        );
      },
    );
  }
}

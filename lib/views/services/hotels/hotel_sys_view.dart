import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di.dart';
import '../../../logic/products/hotels_system/hotels_bloc.dart';
import '../../../logic/products/hotels_system/hotels_state.dart';
import 'widget/hotel_tile.dart';
import '../widgets/no_products.dart';
import '../../widgets/appbar.dart';
import '../../widgets/load_more_wrapper.dart';
import '../../widgets/pro_shimmer_tile.dart';

class HotelsSearchView extends StatelessWidget {
  const HotelsSearchView({Key? key, required this.comId}) : super(key: key);
  final int comId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.hotelsBloc,
      child: Scaffold(
        appBar: const KAppBar(),
        body: BlocBuilder<HotelsBloc, HotelsState>(
          builder: (context, state) {
            final pro = HotelsBloc.of(context);
            if (state.maybeWhen(orElse: () => false, loading: () => true)) {
              return ListView.builder(
                itemBuilder: (context, index) => const ProductLoadingPH(),
                itemCount: 10,
              );
            } else {
              if ((HotelsBloc.of(context).productsModel?.products ?? []).isEmpty) {
                return const KNoProductsView();
              } else {
                return LoadMoreWrapper(
                  padding: EdgeInsets.zero,
                  onLoadMore: () async {
                    HotelsBloc.of(context).getHotelsProducts(null, true, companyId: comId, mainAttr: {});
                  },
                  itemCount: (HotelsBloc.of(context).productsModel?.products.length ?? 0),
                  itemBuilder: (context, index) {
                    return HotelTile(data: (pro.productsModel?.products ?? [])[index]);
                  },
                  isLoadingMore: state.maybeWhen(orElse: () => false, loadMore: () => true),
                  crossAxisCount: 1,
                );
              }
            }
          },
        ),
      ),
    );
  }
}

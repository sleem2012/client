import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/services/services_model.dart';
import '../../../di.dart';
import '../../../packages/extensions.dart';
import '../../../logic/products/get_pro_attrs_fields/get_pro_attrs_fields_bloc.dart';
import '../../../logic/products/hotels_system/hotels_bloc.dart';
import '../../../logic/products/hotels_system/hotels_state.dart';
import 'widget/hotel_filter.dart';
import '../widgets/no_products.dart';
import '../../widgets/appbar.dart';
import '../../widgets/load_more_wrapper.dart';
import '../../widgets/pro_shimmer_tile.dart';
import 'package:get/get.dart';

import 'widget/hotel_tile.dart';

class HotelsView extends StatefulWidget {
  const HotelsView({Key? key, required this.servicesData}) : super(key: key);
  final ServicesData servicesData;

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

bool? isCollapsing = false;
CrossFadeState changeCrossFade() {
  return isCollapsing == false ? CrossFadeState.showFirst : CrossFadeState.showSecond;
}

class _HotelsViewState extends State<HotelsView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.setCategories..getCats(widget.servicesData.id)),
        BlocProvider(create: (context) => Di.hotelsBloc),
      ],
      child: Scaffold(
        appBar: KAppBar(title: (widget.servicesData.name ?? '').capitalized),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HotelFilter(),

              /// AnimatedCrossFade(
              ///   duration: const Duration(milliseconds: 300),
              ///   sizeCurve: Curves.decelerate,
              ///   firstChild: Row(
              ///     children: [
              ///       Expanded(
              ///         child: InkWell(
              ///           onTap: () {
              ///             Nav.to(Search(id: widget.servicesData.id ?? -1));
              ///           },
              ///           child: const KSearchBar(enabled: false),
              ///         ),
              ///       ),
              ///       IconButton(
              ///         icon: const Icon(Icons.filter_alt),
              ///         onPressed: () {
              ///           setState(() {
              ///             isCollapsing = !isCollapsing!;
              ///           });
              ///         },
              ///       ),
              ///     ],
              ///   ),
              ///   secondChild: Column(
              ///     mainAxisAlignment: MainAxisAlignment.end,
              ///     crossAxisAlignment: CrossAxisAlignment.end,
              ///     children: [
              ///       IconButton(
              ///         onPressed: () {
              ///           setState(() {
              ///             isCollapsing = !isCollapsing!;
              ///           });
              ///         },
              ///         icon: const Icon(Icons.clear),
              ///       ),
              ///       SizedBox(
              ///         width: Get.width,
              ///         child: const HotelFilter(),
              ///       ),
              ///     ],
              ///   ),
              ///   crossFadeState: changeCrossFade(),
              /// ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => BlocBuilder<HotelsBloc, HotelsState>(
                  buildWhen: (previous, current) {
                    return current.maybeWhen(orElse: () => false, success: (model) => true, loading: () => true);
                  },
                  builder: (context, state) {
                    final pro = HotelsBloc.of(context);
                    if (state.maybeWhen(orElse: () => false, loading: () => true)) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => const ProductLoadingPH(),
                        itemCount: 10,
                      );
                    } else {
                      if ((HotelsBloc.of(context).productsModel?.products ?? []).isEmpty) {
                        return const KNoProductsView();
                      } else {
                        return SizedBox(
                          height: Get.height,
                          child: LoadMoreWrapper(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            onLoadMore: () async {
                              HotelsBloc.of(context).getHotelsProducts(pro.catId ?? 0, true, mainAttr: GetProAttrsFieldsBloc.of(context).attrValues);
                            },
                            itemCount: (HotelsBloc.of(context).productsModel?.products.length ?? 0),
                            itemBuilder: (context, index) {
                              return HotelTile(data: (pro.productsModel?.products ?? [])[index]);
                            },
                            isLoadingMore: state.maybeWhen(orElse: () => false, loadMore: () => true),
                            crossAxisCount: 1,
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




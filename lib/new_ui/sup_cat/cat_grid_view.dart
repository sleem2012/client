import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/services/category_model.dart';
import '../../data/models/services/service_type.dart';
import '../../di.dart';
import '../../logic/categories/get_category/get_categories_cubit.dart';
import '../../logic/categories/get_category/get_categories_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/search/search_manager.dart';
import '../../logic/services/services_cubit.dart';
import '../../packages/extensions.dart';
import '../../packages/widgets/image_widget.dart';
import '../../shared/theme/text_theme.dart';
import '../../views/services/widgets/no_products.dart';
import '../../views/services/widgets/shimmer_grid.dart';
import '../../views/widgets/appbar.dart';
import '../../views/widgets/error/error_widget.dart';
import '../../views/widgets/new_bg_img.dart';

class MainCategoriesView extends StatelessWidget {
  final String title;
  final int? type_id;

  const MainCategoriesView({super.key, required this.title, required this.type_id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: title),
      resizeToAvoidBottomInset: false,
      body: BgImg(
        child: BlocProvider(
          create: (context) => Di.setCategories..getCats(type_id),
          child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
            builder: (context, state) {
              return state.when(
                loading: () => const ShimmerGrid(shrinkWrap: true, child: SubCatShimmer()),
                error: (error) => KErrorWidget(
                  error: error,
                  isError: true,
                  onTryAgain: () {
                    GetCategoriesBloc.of(context).getCats(type_id);
                  },
                ),
                success: (supCats) => supCats.data?.isNotEmpty ?? false
                    ? SearchableView<CategoryModel>(
                        initialList: supCats.data!,
                        where: (item) => item.name,
                        builder: (list) {
                          return Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.3,
                              ),
                              itemCount: list.length,
                              itemBuilder: (c, i) {
                                final category = list[i];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: CategoryNameIcon(
                                    icon: category.icons,
                                    name: category.name,
                                    onTap: () {
                                      final route = ServicesCubit.of(context).getServiceRoute(from: RouteingFrom.main_cat(category), category: category);
                                      Nav.to(route);

                                      /// if (servicesData.id == 26) {
                                      ///   Nav.to(BanksDetails(id: category.id!));
                                      /// } else if (servicesData.id == 29) {
                                      ///   Nav.to(ServiceGateView(cat_id: category.id!, title: servicesData.name ?? ''));
                                      /// } else {
                                      ///   Nav.to(SubCategoriesView(category: category));
                                      /// }
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )
                    : const KNoProductsView(isCategory: true),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryNameIcon extends StatelessWidget {
  const CategoryNameIcon({super.key, this.icon, this.name, this.onTap});

  final void Function()? onTap;
  final String? icon, name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, si) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              if (icon != null)
                Expanded(
                  flex: 3,
                  child: SizedBox(width: 50, height: 50, child: KImageWidget(imageUrl: icon!, width: 45, height: 45)),
                ),
              const SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: Text(
                  (name?.capitalized ?? 'Sup Cat'),
                  style: KTextStyle.of(context).body4.B.S(1.2),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/card_info_model.dart';
import '../../../data/models/services/category_model.dart';
import '../../../data/models/services/service_type.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../di.dart';
import '../../../logic/company/company_bloc.dart';
import '../../../logic/company/company_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../logic/service_gate/service_gate_bloc.dart';
import '../../../logic/service_gate/service_gate_state.dart';
import '../../../logic/services/services_cubit.dart';
import '../../../new_ui/services/company_details.dart';
import '../../../shared/localization/trans.dart';
import '../../widgets/appbar.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/load_more_wrapper.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../widgets/no_products.dart';
import '../widgets/search_field.dart';
import '../widgets/shimmer_grid.dart';
import 'widgets/company_card.dart';

class CompanyListView extends StatelessWidget {
  final CategoryModel? category;
  final int? com_type_id;
  final String title;

  const CompanyListView({Key? key, required this.category, required this.title, required this.com_type_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? type_id = category?.id;
    return Scaffold(
      appBar: KAppBar(title: title),
      body: BgImg(
        child: BlocProvider(
          create: (context) => Di.compBloc..getCompanies(false, cat_id: type_id, com_type_id: com_type_id),
          child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              final comp = CompanyBloc.of(context);

              return KLoadingOverlay(
                isLoading: state is CompanyStateLoading,
                child: EmptyWidget(
                  list: comp.compModel?.data ?? [],
                  imagePath: 'assets/images/no_companies.svg',
                  title: Tr.get.no_companies,
                  child: CompaniesGridView(
                    data: comp.compModel?.data ?? [],
                    loading: state is CompanyStateLoading,
                    loadingMore: state is CompanyStateLoadmore,
                    onLoadMore: () => comp.getCompanies(true, cat_id: type_id, com_type_id: com_type_id),
                    onCardTaped: (i) {
                      final company = comp.compModel!.data![i];

                      final route = ServicesCubit.of(context).getServiceRoute(from: RouteingFrom.vendor_list(company), category: category);
                      Nav.to(route);
                    },
                    onRefresh: () async => await CompanyBloc.of(context).getCompanies(false, cat_id: type_id, com_type_id: com_type_id),
                    onSearch: (p0) => comp.search(v: p0),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ServiceGateView extends StatelessWidget {
  final int? cat_id;
  final String title;

  const ServiceGateView({Key? key, this.cat_id, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: title),
      body: BgImg(
        child: BlocProvider(
          create: (context) => Di.serviceGateBloc..get_service_gate(catId: cat_id),
          child: BlocBuilder<ServiceGateBloc, ServiceGateState>(
            builder: (context, state) {
              final ser_bloc = ServiceGateBloc.of(context);
              return CompaniesGridView(
                data: ser_bloc.serviceGatesModel?.data ?? [],
                loading: state is ServiceGateStateLoading,
                loadingMore: state is ServiceGateStateLoadMore,
                onLoadMore: () => ser_bloc.get_service_gate(loadMore: true, catId: cat_id),
                onCardTaped: (i) {
                  Nav.to(CompanyDetailsView(company: ser_bloc.serviceGatesModel!.data![i]));

                  // Get.to(() => CompanyDetailsView(data: ser_bloc.serviceGatesModel!.data![i]));
                },
                onRefresh: () async => await ser_bloc.get_service_gate(catId: cat_id),
                onSearch: (p0) => ser_bloc.search(v: p0),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CompaniesGridView extends StatelessWidget {
  const CompaniesGridView({
    super.key,
    required this.loadingMore,
    required this.loading,
    this.onSearch,
    required this.data,
    this.onCardTaped,
    this.onRefresh,
    required this.onLoadMore,
  });

  final bool loadingMore, loading;
  final Function(String)? onSearch;
  final Function(int)? onCardTaped;
  final List<UserCompany> data;
  final Future<void> Function()? onRefresh;
  final Function() onLoadMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KSearchBar(onSearch: onSearch),
        Expanded(
          child: Column(
            children: [
              if (loading)
                const Expanded(child: ShimmerGrid(shrinkWrap: true))
              else if (data.isEmpty)
                const Expanded(child: KNoProductsView())
              else
                Expanded(
                  child: LoadMoreWrapper(
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.1,
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    isLoadingMore: loadingMore,
                    itemCount: data.length,
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CompaniesCard(
                          data: CardDataModel.fromUserCompany(data[i]),
                          onCompanyViewTap: () {
                            Nav.to(CompanyDetailsView(company: data[i]));
                          },
                          onTap: () {
                            onCardTaped?.call(i);
                          },
                        ),
                      );
                    },
                    onLoadMore: onLoadMore,
                    onRefresh: onRefresh,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}

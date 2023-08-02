import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/logic/nav_enforcer/nav_enforcer_bloc.dart';

import '../../data/models/user_info/user_model.dart';
import '../../di.dart';
import '../../packages/extensions.dart';
import '../../logic/company/company_by_id/company_bloc_by_id.dart';
import '../../logic/company/company_by_id/company_state_by_id.dart';
import '../../logic/products/product_system_bloc/products_bloc.dart';
import '../../logic/products/product_system_bloc/products_state.dart';
import '../../logic/schedule/schedule_bloc.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/text_theme.dart';
import '../../views/widgets/appbar.dart';
import '../../views/widgets/loading/loading_overlay.dart';
import '../../views/widgets/new_bg_img.dart';
import '../sup_cat/cat_grid_view.dart';
import 'items_landing.dart';
import 'widget/company_info_widget.dart';
import 'widget/company_job_list.dart';
import 'widget/photp_widget.dart';
import 'widget/vendor_info.dart';

class CompanyDetailsView extends StatefulWidget {
  const CompanyDetailsView({Key? key, required this.company}) : super(key: key);
  final UserCompany company;

  @override
  State<CompanyDetailsView> createState() => _CompanyDetailsViewState();
}

class _CompanyDetailsViewState extends State<CompanyDetailsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedTab;
  final List<String> infoList = [Tr.get.items.capitalized, Tr.get.jobs.capitalized, Tr.get.info, Tr.get.photos];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Di.companyBlocById..getCompanyById(company: widget.company)),
          BlocProvider(create: (context) => Di.scheduleBloc),
          BlocProvider(create: (context) => Di.getProductsBloc),
          BlocProvider(create: (context) => Di.getJobsBloc),
        ],
        child: BgImg(
          child: BlocConsumer<CompanyBlocById, CompanyStateById>(
            listener: (context, state) {
              debugPrint('================= $state');
              state.whenOrNull(
                success: (model) {
                  ScheduleBloc.of(context)..getSchedule(companyId: model.id ?? -1);
                  if (CompanyBlocById.of(context).hasMultiCats) return;
                  GetProductsBloc.of(context).add(GetProductsEvents.get(isMore: false, companyId: model.id));
                },
              );
            },
            builder: (context, state) {
              final comp = CompanyBlocById.of(context);

              return KRequestOverlay(
                isLoading: state is CompanyStateByIdLoading,
                error: state.whenOrNull(error: (error) => error),
                onTryAgain: () => CompanyBlocById.of(context).getCompanyById(company: widget.company),
                child: Column(
                  children: [
                    VendorInfo(data: comp),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 25,
                      child: TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        labelStyle: KTextStyle.of(context).body.B,
                        unselectedLabelStyle: KTextStyle.of(context).hint.copyWith(fontSize: 14),
                        onTap: (i) {
                          selectedTab = infoList[i];
                        },
                        tabs: infoList.map(
                          (e) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(e.capitalized),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          if (comp.hasMultiCats)
                            GridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 0).copyWith(bottom: 110, top: 20),
                              shrinkWrap: true,
                              itemCount: comp.categories.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.2),
                              itemBuilder: (c, i) => CategoryNameIcon(
                                icon: comp.categories[i].icons,
                                name: comp.categories[i].name,
                                onTap: () {
                                  Nav.to(
                                    ItemsLanding(compId: comp.compId, type: comp.compType, hasMulti: comp.hasMultiCats, category: comp.categories[i]),
                                  );
                                },
                              ),
                            )
                          else
                            ItemsLanding(compId: comp.compId, type: comp.compType, hasMulti: false),
                          CompanyJobList(),
                          CompanyInfoWidget(),
                          PhotoWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

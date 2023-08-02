import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../di.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../logic/search_company/search_company_cubit.dart';
import '../../../logic/search_company/search_company_event.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'hotel_sys_view.dart';
import '../widgets/search_field.dart';
import '../../widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';

class SearchCompany extends StatelessWidget {
  const SearchCompany({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.searchCubit,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Nav.back();
                    },
                    icon: Icon(Icons.adaptive.arrow_back),
                  ),
                  Expanded(
                    child: Builder(builder: (context) {
                      return KSearchBar(onSearch: (v) {
                        SearchCompanyBloc.of(context).add(SearchEventSearch(qry: v, srvId: id));
                      });
                    }),
                  ),
                ],
              ),
              Expanded(child: BlocBuilder<SearchCompanyBloc, SearchState>(
                builder: (context, state) {
                  final data = state.maybeWhen(orElse: () => <UserCompany>[], success: (data) => data ?? []);
                  return KLoadingOverlay(
                    isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: KHelper.of(context).elevatedBox,
                        child: InkWell(
                          onTap: () {
                            Nav.to(HotelsSearchView(comId: data[index].id ?? -1));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(data[index].logo?.s128px ?? dummyNetLogo, width: 100, height: 100, fit: BoxFit.cover),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width / 3,
                                        child: Text(
                                          data[index].name?.value ?? ' ',
                                          style: KTextStyle.of(context).title2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      IgnorePointer(
                                        child: RatingBar.builder(
                                          initialRating: data[index].companyReview?.toDouble() ?? 0,
                                          allowHalfRating: true,
                                          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                                          onRatingUpdate: (rate) {},
                                          itemSize: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                      data[index].description?.value ?? '',
                                      style: KTextStyle.of(context).title1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // const SizedBox(height: 10),
                                  // Text(data[index].),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

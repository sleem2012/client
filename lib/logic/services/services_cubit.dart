import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/services/category_model.dart';
import '../../data/models/services/service_type.dart';
import '../../data/models/services/services_model.dart';
import '../../data/repository/services/services_repo.dart';
import '../../new_ui/product_details/product_details_view.dart';
import '../../new_ui/services/company_details.dart';
import '../../new_ui/sup_cat/cat_grid_view.dart';
import '../../new_ui/sup_cat/cat_tabs_view.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/logger.dart';
import '../../views/services/booking_car/booking_view/widgets/indriver_wrapper.dart';
import '../../views/services/company/company_screen_grid_view.dart';
import '../../views/services/delivering/delivering_screen.dart';
import '../../views/services/filtered/filtered_services_view.dart';
import '../../views/widgets/comming_soon_view.dart';
import 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit({required this.servicesRepoImpl}) : super(const ServicesState.loading());

  static ServicesCubit of(context) => BlocProvider.of(context);

  final ServicesRepoImpl servicesRepoImpl;
  ServicesModel? servicesModel;

  List<ServicesData> get servicesData {
    return servicesModel?.data ?? [];
  }

  ServicesData? _selectedService;

  ServicesData? get selectedService => _selectedService;

  getServices() async {
    emit(const ServicesState.loading());
    try {
      final result = await servicesRepoImpl.getServices();
      result.fold(
        (l) {
          debugPrint('================= Services Bloc $l : ');
          emit(ServicesState.error(error: KFailure.toError(l)));
        },
        (r) {
          servicesModel = r;
          emit(const ServicesState.success());
        },
      );
    } catch (e) {
      debugPrint('================= Services Bloc Ex : $e : ');
      emit(ServicesState.error(error: Tr.get.something_went_wrong));
    }
  }

  Widget getServiceRoute({ServicesData? servicesData, required RouteingFrom from, CategoryModel? category}) {
    if (servicesData != null) _selectedService = servicesData;

    final route = map_service_type(servicesData: _selectedService!, from: from, category: category);

    return route ?? ComingSoonView(title: _selectedService?.name ?? "");
  }
}

Widget? map_service_type({required ServicesData servicesData, required RouteingFrom from, CategoryModel? category}) {
  printMap(category?.toMap());
  debugPrint('${from} , ${servicesData.name ?? category?.name} ,  Ser_Type =  ${servicesData.type} ,,  Cat_Type ${category?.type}');

  final Map<String, Widget> especially = {
    'book_car': const BookACarWrapper(),
    'take_tour': const BookACarWrapper(),
    'delivery': DeliveringView(title: servicesData.name ?? ""),
    'main': MainCategoriesView(title: servicesData.name ?? '', type_id: servicesData.id),
  };

  return (category?.type ?? servicesData.type)?.when(
    Shopping: () => from.whenOrNull(
      service: (cat) => especially['main'],
      main_cat: (cat) => SubCategoriesView(category: category!),
      sub_cat: (pro, proList) => ProductDetailsView(proSys: pro, similar: proList),
    ),
    Company: () => from.whenOrNull(
      service: (cat) => especially['main'],
      main_cat: (cat) => CompanyListView(title: cat?.name ?? '', category: cat, com_type_id: null),
      vendor_list: (company) => CompanyDetailsView(company: company),
    ),
    Vendors: () => from.whenOrNull(
      service: (cat) => CompanyListView(title: cat?.name ?? '', category: cat, com_type_id: servicesData.id),
      main_cat: (cat) => CompanyListView(title: cat?.name ?? '', category: cat, com_type_id: null),
      vendor_list: (company) => SubCategoriesView(category: category!),
      sub_cat: (pro, proList) => ProductDetailsView(proSys: pro, similar: proList),
    ),
    MainCat: () => from.whenOrNull(
      service: (cat) => especially['main'],
      main_cat: (cat) {
        return cat?.typeStr != null
            ? map_service_type(servicesData: servicesData, from: RouteingFrom.main_cat(cat), category: cat)
            : SubCategoriesView(category: cat!);
      },
    ),
    Especially: () => especially[servicesData.key],
    Filters: () => FilteredServicesView(servicesData: servicesData),
  );
}

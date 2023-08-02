import '../products/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_info/user_model.dart';
import 'category_model.dart';

part 'service_type.freezed.dart';

@freezed
class ServiceType with _$ServiceType {
  const factory ServiceType.Shopping() = _ServiceTypeShopping;
  const factory ServiceType.Filters() = _ServiceTypeFilters;
  const factory ServiceType.Vendors() = _ServiceTypeVendors;
  const factory ServiceType.Company() = _ServiceTypeCompany;
  const factory ServiceType.MainCat() = _ServiceTypeMainCat;
  const factory ServiceType.Especially() = _ServiceTypeEspecially;

  static ServiceType fromStr(
    String str,
  ) {
    switch (str) {
      case 'shopping':
        return const ServiceType.Shopping();
      case 'filters':
        return const ServiceType.Filters();
      case 'vendors':
        return const ServiceType.Vendors();
      case 'company-view':
        return const ServiceType.Company();
      case 'especially':
        return const ServiceType.Especially();
      case 'main-categories':
        return const ServiceType.MainCat();
      default:
        return const ServiceType.MainCat();
    }
  }
}
// flutter pub run build_runner watch --delete-conflicting-outputs

@freezed
class RouteingFrom with _$RouteingFrom {
  const factory RouteingFrom.service(CategoryModel? cat) = _RouteFromService;
  const factory RouteingFrom.main_cat(CategoryModel? cat) = _RouteFromMainCat;
  const factory RouteingFrom.sub_cat(ProductsSystemData proSys, List<ProductsSystemData> similar) = _RouteFromSubCat;
  const factory RouteingFrom.vendor_list(UserCompany company) = _RouteFromVendor;
  const factory RouteingFrom.pro_view() = _RouteFromProView;
  const factory RouteingFrom.company_view() = _RouteFromCompanyView;
}
// flutter pub run build_runner watch --delete-conflicting-outputs

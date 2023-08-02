import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/ads/ads_model.dart' hide Logo;
import '../../../data/models/branch/branch_model.dart';
import '../../../data/models/services/category_model.dart';
import '../../../data/models/services/service_type.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../data/repository/ads/company_repo.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/logger.dart';
import 'company_state_by_id.dart';

class CompanyBlocById extends Cubit<CompanyStateById> {
  CompanyBlocById({required this.compRepoImpl}) : super(const CompanyStateById.loading());

  static CompanyBlocById of(BuildContext context) {
    return BlocProvider.of<CompanyBlocById>(context);
  }

  final CompanyRepoImpl compRepoImpl;

  getCompanyById({required UserCompany company}) async {
    if (company.owner == null || company.companyReview == null || company.socialLinks == null) {
      try {
        final result = await compRepoImpl.getCompanyById(id: company.id);
        result.fold(
          (l) {
            debugPrint('================= comp Bloc $l : ');
            emit(CompanyStateById.error(error: KFailure.toError(l)));
          },
          (r) {
            selectedCompany = r;

            emit(CompanyStateById.success(model: r));
          },
        );
      } catch (e) {
        debugPrint('================= comp Bloc Ex : $e : ');
        emit(CompanyStateById.error(error: Tr.get.something_went_wrong));
        rethrow;
      }
    } else {
      await Future.delayed(Duration(milliseconds: 20));
      selectedCompany = company;
      emit(CompanyStateById.success(model: selectedCompany!));
      printMap(selectedCompany?.toMap());
    }
  }

  BranchData? selectedBranch;

  onSelectBranch(BranchData? data) {
    selectedBranch = data;
    emit(CompanyStateById.select(data: data));
  }

  UserCompany? selectedCompany;

  String get compLogo => selectedCompany?.logo?.s256px ?? dummyNetLogo;

  int get compId => selectedCompany?.id ?? 0;

  String get compCover => selectedCompany?.coverPhotos?.firstOrNull?.s256px ?? dummyNetCover;

  String get compName => selectedCompany?.name?.value ?? '';

  num get compRate => selectedCompany?.companyReview ?? 0;

  String get compDesc => selectedCompany?.description?.value ?? '';

  String get compMail => selectedCompany?.owner?.email ?? '';

  String get compCategory => selectedCompany?.category?.firstOrNull?.name ?? '';

  AddressId get compLocation => selectedCompany?.owner?.addressId ?? AddressId();

  List<Logo> get compGallery => selectedCompany?.coverPhotos ?? [];

  SocialLinks get compSocial => selectedCompany?.socialLinks ?? SocialLinks();

  String get comPhone => selectedCompany?.owner?.mobile ?? "";

  ServiceType? get compType => selectedCompany?.packages?.companyType?.type;
  List<CategoryModel> get categories => selectedCompany?.category ?? [];
  bool get hasMultiCats => categories.length > 1;
}

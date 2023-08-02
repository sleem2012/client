import '../../../data/models/branch/branch_model.dart';

import '../../../data/models/user_info/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_state_by_id.freezed.dart';

@freezed
 class CompanyStateById with _$CompanyStateById {
  const factory CompanyStateById.loading() = CompanyStateByIdLoading;
  const factory CompanyStateById.select({required BranchData? data}) = CompanyStateByIdSelect;
  const factory CompanyStateById.success({required UserCompany model}) = CompanyStateByIdSuccess;
  const factory CompanyStateById.error({required String error}) = CompanyStateByIdError;
}


// flutter pub run build_runner watch --delete-conflicting-outputs
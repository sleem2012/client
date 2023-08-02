import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/ads/ads_model.dart';
import '../../models/user_info/user_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class _CompanyRepo {
  Future<Either<KFailure, CompanyModel>> getCompanies({required int page, required int page_count, int? cat_id, int? com_type_id});
  Future<Either<KFailure, UserCompany>> getCompanyById({int? id});
}

class CompanyRepoImpl implements _CompanyRepo {
  @override
  Future<Either<KFailure, CompanyModel>> getCompanies({required int page, required int page_count, int? cat_id, int? com_type_id}) async {
    Map<String, dynamic>? params = {'page_count': page_count, "page": page};

    params.addAll({
      if (cat_id != null) "category_id": cat_id,
      if (com_type_id != null) "company_type_id": com_type_id,
    });

    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_system, params: params);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(CompanyModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, UserCompany>> getCompanyById({int? id}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_system, params: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(UserCompany.fromJson(r['data'])));
  }
}

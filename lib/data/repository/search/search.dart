import '../../models/user_info/user_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class SearchRepoAbs {
  Future<Either<KFailure, List<UserCompany>>> search({required String type, required String text, required int companyTypeId});
}

class SearchRepoImpl implements SearchRepoAbs {
  @override
  Future<Either<KFailure, List<UserCompany>>> search({required String type, required String text, required int companyTypeId}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.search, data: {"type": type, "text": text, "company_type_id": companyTypeId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) {
      final data = <UserCompany>[];
      if (r['data'] != null) {
        r['data'].forEach((v) {
          data.add(UserCompany.fromJson(v));
        });
      }
      return right(data);
    });
  }
}

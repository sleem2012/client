import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/services/services_model.dart';
import '../../models/services/category_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class _ServicesRepo {
  Future<Either<KFailure, ServicesModel>> getServices();
  Future<Either<KFailure, SupCategoriesModel>> getCategory(int id);
}

class ServicesRepoImpl implements _ServicesRepo {
  @override
  Future<Either<KFailure, ServicesModel>> getServices() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_type);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(ServicesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, SupCategoriesModel>> getCategory(int? company_type_id) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.getCategories, params: {"company_type_id": company_type_id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(SupCategoriesModel.fromJson(r)),
    );
  }
}

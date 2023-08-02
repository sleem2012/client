import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../models/services/servise_gate_response.dart';
import '../../models/user_info/user_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class _BanksRepo {
  Future<Either<KFailure, UserCompany>> getBanks({required int id});
  Future<Either<KFailure, ServiceGatesResponse>> get_service_gate(int? catId);
}

class BanksRepoImpl implements _BanksRepo {
  @override
  Future<Either<KFailure, UserCompany>> getBanks({required int id}) async {
    Map<String, dynamic>? params = {'category_id': id, 'select_type': 'first'};

    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_by_category, params: params);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) {
      debugPrint(r['data'].runtimeType.toString());
      if (r['data'].runtimeType == List<dynamic>) {
        return right(UserCompany.fromJson({}));
      } else {
        return right(UserCompany.fromJson(r['data']));
      }
    });
  }

  @override
  Future<Either<KFailure, ServiceGatesResponse>> get_service_gate(int? catId) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.company_by_category, params: {"category_id": catId, "select_type": "list"});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(ServiceGatesResponse.fromJson(r)));
  }
}

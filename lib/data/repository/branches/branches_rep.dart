import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/branch/branch_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';

import '../../../packages/shared/error/failures.dart';

abstract class _BranchesRepoAbs {
  Future<Either<KFailure, BranchModel>> getBranches({required int company_id});
}

class BranchesRepoImpl implements _BranchesRepoAbs {
  static BranchesRepoImpl? _instance;

  BranchesRepoImpl._internal() {
    _instance = this;
  }

  static BranchesRepoImpl get i {
    return _instance ?? BranchesRepoImpl._internal();
  }

  @override
  Future<Either<KFailure, BranchModel>> getBranches({required int company_id}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.branch_read, params: {"company_id": company_id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(BranchModel.fromJson(r)));
  }
}

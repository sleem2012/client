import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/schedule/schedule_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class ScheduleRepo {
  Future<Either<KFailure, ScheduleModel>> get();
}

class ScheduleRepoImpl implements ScheduleRepo {
  @override
  Future<Either<KFailure, ScheduleModel>> get({int? pro_menu_id, int? companyId}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.schedule,
      params: {
        if (pro_menu_id != null) "product_menu_id": pro_menu_id,
        if (companyId != null) "company_id": companyId,
      },
    );
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(ScheduleModel.fromJson(r)),
    );
  }
}

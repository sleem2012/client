import '../../models/report/report_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';

abstract class ReportServiceRepoAbs {
  Future<Either<KFailure, List<ReportData>>> getReports();
}

class ReportServiceRepoImp implements ReportServiceRepoAbs {
  @override
  Future<Either<KFailure, List<ReportData>>> getReports() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.create_report_step1);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) {
        List<ReportData> l = [];
        if (r['data'] != null) {
          for (var element in (r['data'] as List)) {
            l.add(ReportData.fromJson(element));
          }
        }
        return right(l);
      },
    );
  }
}

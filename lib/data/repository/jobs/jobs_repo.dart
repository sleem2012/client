import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../../models/jobs/apply_to_job_model.dart';
import '../../models/jobs/jobs_model.dart';
import '../../models/jobs/my_cv_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class JobsRepoAbs {
  Future<Either<KFailure, JobModel>> getJobs();

  Future<Either<KFailure, MyCvsModel>> get_my_cvs();

  Future<Either<KFailure, Unit>> applyToJob({required ApplyToJobModel applyToJobModel});

  Future<Either<KFailure, Unit>> addCv(PlatformFile cv);

  Future<Either<KFailure, String>> deleteCv(int Id);
}

class JobsRepoImp implements JobsRepoAbs {
  @override
  Future<Either<KFailure, MyCvsModel>> get_my_cvs() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.myCv);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(MyCvsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> applyToJob({required ApplyToJobModel applyToJobModel}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.job_applier, data: applyToJobModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, Unit>> addCv(PlatformFile cv) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.myCv, data: {"cv": MultipartFile.fromFileSync(cv.path ?? '')});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, JobModel>> getJobs({int? company_id}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.get_jobs, params: {if (company_id != null) "company_id": company_id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(JobModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, String>> deleteCv(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.myCv, data: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(r['message']),
    );
  }
}

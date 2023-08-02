import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/jobs/apply_to_job_model.dart';
import '../../../data/repository/jobs/jobs_repo.dart';
import 'apply_to_job_state.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

class ApplyToJobCubit extends Cubit<ApplyToJobState> {
  ApplyToJobCubit({required this.jobsRepoImp}) : super(const ApplyToJobState.initial());

  static ApplyToJobCubit of(context) => BlocProvider.of(context);

  ApplyToJobModel? applyToJobModel = ApplyToJobModel();

  final JobsRepoImp jobsRepoImp;
  PlatformFile? selectedFile;

  applyToJob({required int cvId, required int jobId}) async {
    applyToJobModel = applyToJobModel?.copyWith(
      cvId: cvId,
      jobId: jobId,
      // getCv: ''
    );
    debugPrint(applyToJobModel?.toJson().toString());
    try {
      emit(const ApplyToJobState.loading());
      final result = await jobsRepoImp.applyToJob(applyToJobModel: applyToJobModel!);
      result.fold(
        (l) {
          debugPrint('================= applyToJob Bloc : ${KFailure.toError(l)}');
          emit(ApplyToJobState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= applyToJob Bloc : ${r.toString()}  ');
          emit(const ApplyToJobState.success());
        },
      );
    } catch (e) {
      debugPrint('================= applyToJob Bloc (Catch): ${e.toString()} ');
      emit(ApplyToJobState.error(error: Tr.get.something_went_wrong));
    }
  }
}

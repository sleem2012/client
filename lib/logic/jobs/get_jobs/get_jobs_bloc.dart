import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/jobs/jobs_model.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../data/repository/jobs/jobs_repo.dart';
import 'get_jobs_state.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

class GetJobsBloc extends Cubit<JobsState> {
  GetJobsBloc({required this.jobsRepoImp}) : super(const JobsState.initial());

  static GetJobsBloc of(context) => BlocProvider.of(context);

  final JobsRepoImp jobsRepoImp;
  JobModel? jobModel;
  List<JobData> nonFiltered = [];

  JobData? selectedJob;

  selectJob(JobData? selected) {
    selectedJob = selected;
  }

  getJobs({int? company_id}) async {
    try {
      emit(const JobsState.loading());

      final result = await jobsRepoImp.getJobs(company_id: company_id);
      result.fold(
        (l) {
          debugPrint('================= getJob Bloc : ${KFailure.toError(l)}');
          emit(JobsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= getJob Bloc : ${r.toString()}  ');
          jobModel = r;
          nonFiltered.addAll(jobModel?.data ?? []);
          emit(JobsState.success(jobModel: jobModel!));
        },
      );
    } catch (e) {
      debugPrint('================= getJobs Bloc (Catch): ${e.toString()} ');
      emit(JobsState.error(error: Tr.get.something_went_wrong));
    }
  }

  filterJobs({required JobModel model, required int cityId, bool? removeFilter = false}) {
    if (removeFilter == false) {
      final filteredJobs = model.data?.where((element) => element.addressId?.cityId?.id == cityId).toList();
      debugPrint('================= filterJobs : ${filteredJobs?.length.toString()}');
      emit(JobsState.success(jobModel: jobModel!.copyWith(data: filteredJobs)));
    } else {
      emit(JobsState.success(jobModel: jobModel!.copyWith(data: nonFiltered)));
    }
  }

  UserCompany? get company => selectedJob?.company ?? UserCompany();

  String get jobCover => selectedJob?.company?.coverPhotos?.firstOrNull?.s512px ?? dummyNetCover;
  String get jobLogo => selectedJob?.company?.logo?.s256px ?? dummyNetLogo;
  String get companyName => selectedJob?.company?.name?.value ?? "";
  String get jobTitle => selectedJob?.title ?? "";
  int get applicationsNumber => selectedJob?.counter?.applied ?? 0;
  int get positionNumber => selectedJob?.positions ?? 0;
  int get viewedNumber => selectedJob?.counter?.viewed ?? 0;
  int get acceptedNumber => selectedJob?.counter?.accepted ?? 0;
  String get experienceNeeded => selectedJob?.experienceYears ?? '0';
  String get experienceLevel => selectedJob?.experience ?? '0';
  String get salary => selectedJob?.salary ?? '0';
  String get jobCategory => selectedJob?.categories?.category?.name?.value ?? '0';
  String get jobDesc => selectedJob?.description?.value ?? '0';
  String get jobRequirements => selectedJob?.description?.value ?? '0';
  List<SkillsCollection> get skills => selectedJob?.categories?.skillsCollection ?? [];
}

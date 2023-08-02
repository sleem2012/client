import '../../../data/models/jobs/jobs_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_jobs_state.freezed.dart';

@freezed
 class JobsState with _$JobsState {
  const factory JobsState.initial() = JobsStateInitial;
  const factory JobsState.loading() = JobsStateLoading;
  const factory JobsState.success({required JobModel jobModel}) = JobsStateSuccess;
  const factory JobsState.error({required String error}) = JobsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
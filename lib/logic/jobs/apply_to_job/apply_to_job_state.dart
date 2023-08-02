import 'package:freezed_annotation/freezed_annotation.dart';
part 'apply_to_job_state.freezed.dart';

@freezed
 class ApplyToJobState with _$ApplyToJobState {
  const factory ApplyToJobState.initial() = ApplyToJobStateInitial;
  const factory ApplyToJobState.loading() = ApplyToJobStateLoading;
  const factory ApplyToJobState.success() = ApplyToJobStateSuccess;
  const factory ApplyToJobState.error({required String error}) =  ApplyToJobStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
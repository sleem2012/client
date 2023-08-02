import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_cv_state.freezed.dart';

@freezed
 class UploadCvState with _$UploadCvState {
  const factory UploadCvState.initial() = UploadCvStateInitial;
  const factory UploadCvState.loading() = UploadCvStateLoading;
  const factory UploadCvState.success() = UploadCvStateSuccess;
  const factory UploadCvState.error({required String error}) =UploadCvStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
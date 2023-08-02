import '../../../data/models/jobs/my_cv_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cv_state.freezed.dart';

@freezed
 class GetCvState with _$GetCvState {
  const factory GetCvState.loading() = CvStateLoading;
  const factory GetCvState.success({MyCvsModel? model}) = CvStateSuccess;
  const factory GetCvState.error({required String error}) = CvStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
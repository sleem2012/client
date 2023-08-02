import '../../data/models/report/report_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_reports_state.freezed.dart';

@freezed
 class GetReportsState with _$GetReportsState{
  const factory GetReportsState.loading() = GetReportsStateLoading;
  const factory GetReportsState.success(List<ReportData> reports) = GetReportsStateSuccess;
  const factory GetReportsState.error({required String error}) = GetReportsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
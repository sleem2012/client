import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/report/report_model.dart';
import '../../data/repository/reports/medical_service_repo.dart';
import '../../views/widgets/slugs_drop_down.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import 'get_reports_state.dart';

class GetReportsBloc extends Cubit<GetReportsState> {
  GetReportsBloc({required this.getReportsRepoImp}) : super(const GetReportsState.loading());

  static GetReportsBloc of(BuildContext context) => BlocProvider.of<GetReportsBloc>(context);

  final ReportServiceRepoImp getReportsRepoImp;
  List<ReportData> reports = [];

  List<ReportData> get openedReports => reports.where((element) => element.state == KSlugModel.opened).toList();
  List<ReportData> get canceledReports => reports.where((element) => element.state == KSlugModel.canceled).toList();

  get() async {
    try {
      emit(const GetReportsState.loading());
      final result = await getReportsRepoImp.getReports();
      result.fold(
        (l) {
          debugPrint('================= GetReports Bloc : ${KFailure.toError(l)}');
          emit(GetReportsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= GetReports Bloc : ${r.toString()}  ');
          reports = r;
          emit(GetReportsState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= GetReports Bloc (Catch): ${e.toString()} ');
      emit(GetReportsState.error(error: Tr.get.something_went_wrong));
    }
  }
}

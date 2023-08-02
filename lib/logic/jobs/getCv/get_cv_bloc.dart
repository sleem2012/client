import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/jobs/my_cv_model.dart';
import '../../../data/repository/jobs/jobs_repo.dart';

import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

import 'cv_state.dart';

class GetCvsBloc extends Cubit<GetCvState> {
  GetCvsBloc({required this.jobsRepoImp}) : super(const GetCvState.loading());

  static GetCvsBloc of(BuildContext context) {
    return BlocProvider.of<GetCvsBloc>(context);
  }

  final JobsRepoImp jobsRepoImp;
  MyCvsModel? myCvsModel;
  PlatformFile? selectedFile;

  CvData? selectedCV;

  onCVSelected(CvData? cv) {
    selectedCV = cv;
    _update;
  }

  get _update {
    emit(const GetCvState.loading());
    emit(GetCvState.success(model: myCvsModel!));
  }

  get() async {
    try {
      emit(const GetCvState.loading());
      final result = await jobsRepoImp.get_my_cvs();
      result.fold(
        (l) {
          debugPrint('================= Jobs cv Bloc : ${KFailure.toError(l)}');
          emit(GetCvState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= Jobs cv Bloc : ${r.toString()}  ');
          myCvsModel = r;
          emit(GetCvState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Jobs cv Bloc (Catch): ${e.toString()} ');
      emit(GetCvState.error(error: Tr.get.something_went_wrong));
    }
  }

  deleteCv(int id) async {
    try {
      emit(const GetCvState.loading());
      final result = await jobsRepoImp.deleteCv(id);
      result.fold(
        (l) {
          debugPrint('================= deleteCv Bloc : ${KFailure.toError(l)}');
          emit(GetCvState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= deleteCv Bloc : ${r.toString()}  ');
          KHelper.showSnackBar(r);
          emit(const GetCvState.success());
          get();
        },
      );
    } catch (e) {
      debugPrint('================= deleteCv Bloc (Catch): ${e.toString()} ');
      emit(GetCvState.error(error: Tr.get.something_went_wrong));
    }
  }
}

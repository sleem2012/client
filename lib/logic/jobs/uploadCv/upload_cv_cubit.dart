import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/jobs/jobs_repo.dart';
import 'upload_cv_state.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

class UploadCvCubit extends Cubit<UploadCvState> {
  UploadCvCubit({required this.jobsRepoImp}) : super(const UploadCvState.initial());

  static UploadCvCubit of(context) => BlocProvider.of(context);

  final JobsRepoImp jobsRepoImp;
  PlatformFile? selectedFile;

  addCv() async {
    try {
      emit(const UploadCvState.loading());

      final result = await jobsRepoImp.addCv(selectedFile!);
      result.fold(
        (l) {
          debugPrint('================= addCv Bloc : ${KFailure.toError(l)}');
          emit(UploadCvState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= addCv Bloc : ${r.toString()}  ');
          emit(const UploadCvState.success());
        },
      );
    } catch (e) {
      debugPrint('================= addCv Bloc (Catch): ${e.toString()} ');
      emit(UploadCvState.error(error: Tr.get.something_went_wrong));
    }
  }

  pick_file() async {
    try {
      emit(const UploadCvState.loading());
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['pdf', 'doc', 'png'],
      );
      if (result?.files.map((e) => e).toList() != null && (result?.files.map((e) => e).toList() ?? []).isNotEmpty) {
        selectedFile = result?.files.map((e) => e).toList().first;
        emit(const UploadCvState.success());
        addCv();
      }
    } catch (e) {
      emit(UploadCvState.error(error: Tr.get.something_went_wrong));
    }
  }
}

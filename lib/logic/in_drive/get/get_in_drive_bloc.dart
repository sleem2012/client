import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/in_drive/in_drive_repo.dart';
import '../../../views/widgets/slugs_drop_down.dart';
import '../../../data/models/in_drive/get_in_drive_model.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import 'get_in_drive_state.dart';

class GetInDriveBloc extends Cubit<GetInDriveState> {
  GetInDriveBloc({required this.inDriveRepoImp}) : super(const GetInDriveState.loading()) {
    get();
  }

  static GetInDriveBloc of(BuildContext context) => BlocProvider.of<GetInDriveBloc>(context);

  final InDriveRepoImp inDriveRepoImp;
  GetInDriveModel? getInDriveModel;

  Future<void> get() async {
    try {
      emit(const GetInDriveState.loading());
      final result = await inDriveRepoImp.get_in_drive();
      result.fold(
        (l) {
          debugPrint('================= GetInDrive Bloc : ${KFailure.toError(l)}');
          emit(GetInDriveState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= GetInDrive Bloc : ${r.toString()}  ');
          getInDriveModel = r;
          emit(const GetInDriveState.success());
        },
      );
    } catch (e) {
      debugPrint('================= GetInDrive Bloc (Catch): ${e.toString()} ');
      emit(GetInDriveState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  filterTrips() {
    return getInDriveModel?.data?.where((element) => element.state == KSlugModel.canceled || element.state == KSlugModel.completed).toList();
  }

  getCompletedTrips() {
    return getInDriveModel?.data?.where((element) => element.state == KSlugModel.completed).toList();
  }
}

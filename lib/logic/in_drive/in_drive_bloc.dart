import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../views/map/logic/model/destination_model.dart';
import '../../data/repository/in_drive/in_drive_repo.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/logger.dart';
import 'in_drive_state.dart';

class CalculateInDriveBloc extends Cubit<InDriveState> {
  CalculateInDriveBloc({required this.inDriveRepoImp}) : super(const InDriveState.initial());

  static CalculateInDriveBloc of(BuildContext context) => BlocProvider.of<CalculateInDriveBloc>(context);

  final InDriveRepoImp inDriveRepoImp;
  String? coast;

  calculate(List<DestinationModel> data) async {
    Map<String, dynamic> body = {};

    for (int i = 0; i < data.length; i++) {
      body.addAll({
        "name[$i]": data[i].address,
        "longitude[$i]": data[i].long,
        "latitude[$i]": data[i].lat,
        "fare": 0,
      });
    }
    printMap(body);

    try {
      emit(const InDriveState.loading());
      debugPrint('===================..........${body.length.toString()}');
      final result = await inDriveRepoImp.calculateFare(body);
      result.fold(
        (l) {
          debugPrint('================= InDrive Bloc : ${KFailure.toError(l)}');
          emit(InDriveState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= InDrive Bloc : ${r.toString()}');
          coast = r;
          emit(InDriveState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= InDrive Bloc (Catch): ${e.toString()} ');
      emit(InDriveState.error(error: Tr.get.something_went_wrong));
    }
  }

  reset() {
    emit(const InDriveState.initial());
  }
}

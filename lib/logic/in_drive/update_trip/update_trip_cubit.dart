import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/in_drive/trip_model.dart';
import '../../../data/models/in_drive/update_trip_model.dart';
import '../../../data/repository/in_drive/in_drive_repo.dart';
import '../../../di.dart';
import '../find_driver/find_driver_cubit.dart';
import 'update_trip_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

class UpdateTripCubit extends Cubit<UpdateTripState> {
  UpdateTripCubit({required this.inDriveRepoImp}) : super(const UpdateTripState.initial());

  static UpdateTripCubit of(context) => BlocProvider.of(context);

  final InDriveRepoImp inDriveRepoImp;

  UpdateTripModel? updateTripModel = UpdateTripModel();

  setId(value) {
    updateTripModel = updateTripModel?.copyWith(id: value);
  }

  setCost(value) {
    updateTripModel = updateTripModel?.copyWith(cost: value);
  }

  setDriverId(value) {
    updateTripModel = updateTripModel?.copyWith(driverId: value);
  }

  setState(value) {
    updateTripModel = updateTripModel?.copyWith(state: value);
  }

  TripModel? tripModel;

  updateTrip({int? id, String? State, int? driver, String? cost, required BuildContext context}) async {
    setId(id);
    setCost(cost);
    setDriverId(driver);
    setState(State);
    try {
      emit(const UpdateTripState.loading());
      final result = await inDriveRepoImp.updateTrip(updateTripModel!);
      result.fold(
        (l) {
          debugPrint('================= updateInDrive Bloc : ${KFailure.toError(l)}');
          emit(UpdateTripState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= updateInDrive Bloc : ${r.toString()}');
          emit(UpdateTripState.success(model: r.data!));
          FindDriverBloc.of(context).setSelectedOrderData(r.data!);
          socketEmit(order_id: r.data?.id ?? 0);
          clear();
        },
      );
    } catch (e) {
      debugPrint('================= updateInDrive Bloc (Catch): ${e.toString()} ');

      emit(UpdateTripState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  socketEmit({required int order_id}) {
    Di.socket.emit(
      'book_trip',
      {
        "id": order_id,
        "type": "client",
      },
    );
    debugPrint('================= socketEmit book_trip $order_id');
  }

  clear() {
    updateTripModel?.driverId = null;
    updateTripModel?.state = null;
    updateTripModel?.id = null;
    updateTripModel?.cost = null;
    updateTripModel?.fare = null;
    // _update;
  }
}

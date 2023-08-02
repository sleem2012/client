import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/in_drive/trip_model.dart';
import '../../../data/models/in_drive/socket_trip_model.dart';
import '../../../data/repository/in_drive/in_drive_repo.dart';
import '../../../di.dart';
import 'find_driver_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/logger.dart';
import '../../../views/map/logic/model/destination_model.dart';

class FindDriverBloc extends Cubit<FindDriverState> {
  FindDriverBloc({required this.inDriveRepoImp}) : super(const FindDriverState.initial());

  static FindDriverBloc of(context) => BlocProvider.of(context);

  final InDriveRepoImp inDriveRepoImp;
  TripModel? tripModel;

  findDriver({required List<DestinationModel> data, required double Fare}) async {
    Map<String, dynamic> body = {};
    for (int i = 0; i < data.length; i++) {
      body.addAll({
        "name[$i]": data[i].address,
        "longitude[$i]": data[i].long,
        "latitude[$i]": data[i].lat,
        "fare": Fare,
      });
    }
    printMap(body);

    try {
      emit(const FindDriverState.loading());
      debugPrint('===================..........${body.length.toString()}');
      final result = await inDriveRepoImp.createTrip(body);
      result.fold(
        (l) {
          debugPrint('================= InDrive Bloc : ${KFailure.toError(l)}');
          emit(FindDriverState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= InDrive Bloc : ${r.toString()}');
          tripModel = r;
          socketEmit(order_id: r.data?.id ?? 0);
          emit(FindDriverState.success(tripModel!));
        },
      );
    } catch (e) {
      debugPrint('================= InDrive Bloc (Catch): ${e.toString()} ');
      emit(FindDriverState.error(error: Tr.get.something_went_wrong));
    }
  }

  reset() {
    emit(const FindDriverState.initial());
  }

  //socket
  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  socketEmit({required int order_id}) {
    Di.socket.emit(
      'book_trip',
      {
        "id": order_id,
        "type": "client",
      },
    );
    debugPrint('================= socketEmit : $order_id');
  }

  init_socket() {
    debugPrint('================= init_socket for my-taxi-$my_id');
    Di.socket.on('my-taxi-$my_id', (data) {
      from_server(data);
    });
    debugPrint('=================> Server Connection State : ${Di.socket.connected} ');
  }

  List<SocketTripModel> socketTripList = [];

  TripModelData? _selectedTripData;

  setSelectedOrderData(TripModelData data) {
    _selectedTripData = data;
    emit(FindDriverState.socketValue(model: data));
  }

  TripModelData? get selectedTripData {
    return _selectedTripData;
  }

  from_server(json) {
    debugPrint('================= From Server : $json $my_id');
    if (json['value'] == null) {
      SocketTripModel newSocket = SocketTripModel.fromJson(json);
      socketTripList.add(newSocket);

      Future.delayed(const Duration(seconds: 10)).then((value) {
        remove(model: newSocket);
      });
      emit(FindDriverState.socketEmit(model: newSocket));
      debugPrint(
        '============length===========>>>>>>>>${socketTripList.length.toString()} ',
      );
    } else {
      TripModelData valueSocket = TripModelData.fromJson(json['value']);
      debugPrint(valueSocket.state);
      setSelectedOrderData(valueSocket);
    }
  }

  remove({required SocketTripModel model}) {
    emit(const FindDriverState.initial());

    return socketTripList.remove(model);
  }

  @override
  close() async {
    Di.socket.off('my-taxi-$my_id');
    super.close();
  }
}

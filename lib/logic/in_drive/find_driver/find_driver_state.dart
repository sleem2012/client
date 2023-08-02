import '../../../data/models/in_drive/trip_model.dart';
import '../../../data/models/in_drive/socket_trip_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'find_driver_state.freezed.dart';

@freezed
 class FindDriverState with _$FindDriverState{
  const factory FindDriverState.initial() = FindDriverStateInitial;
  const factory FindDriverState.socketEmit({ SocketTripModel? model}) = FindDriverStateSocketEmit;
  const factory FindDriverState.socketValue({ TripModelData? model}) = FindDriverStateSocketValue;
  const factory FindDriverState.loading() = FindDriverStateLoading;
  const factory FindDriverState.success(TripModel model) = FindDriverStateSuccess;
  const factory FindDriverState.error({required String error}) = FindDriverStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
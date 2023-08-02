import '../../../data/models/in_drive/trip_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_trip_state.freezed.dart';

@freezed
 class UpdateTripState with _$UpdateTripState{
  const factory UpdateTripState.initial() = UpdateTripStateInitial;
  const factory UpdateTripState.loading() = UpdateTripStateLoading;
  const factory UpdateTripState.success({required TripModelData model}) = UpdateTripStateSuccess;
  const factory UpdateTripState.error({required String error}) = UpdateTripStateError;
  const factory UpdateTripState.socketEmit({required TripModelData model}) = UpdateTripStateSocketEmit;

}
// flutter pub run build_runner watch --delete-conflicting-outputs
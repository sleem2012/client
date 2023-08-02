

import 'package:freezed_annotation/freezed_annotation.dart';
part 'hotel_extra_state.freezed.dart';
@freezed
class HotelExtraState with _$HotelExtraState{
  const factory HotelExtraState.initial() = HotelExtraStateInitial;
  const factory HotelExtraState.success({int? id, bool? selected}) = HotelExtraStateSuccess;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
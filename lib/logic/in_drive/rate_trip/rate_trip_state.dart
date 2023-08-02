import 'package:freezed_annotation/freezed_annotation.dart';
part 'rate_trip_state.freezed.dart';

@freezed
 class RateTripState with _$RateTripState{
  const factory RateTripState.initial() = RateTripStateInitial;
  const factory RateTripState.loading() =RateTripStateLoading;
  const factory RateTripState.success() =RateTripStateSuccess;
  const factory RateTripState.error({required String error}) =RateTripStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
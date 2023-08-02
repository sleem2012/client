import 'package:freezed_annotation/freezed_annotation.dart';
part 'delivering_map_state.freezed.dart';

@freezed
 class DeliveringMapState with _$DeliveringMapState{
  const factory DeliveringMapState.loading() = DeliveringMapStateLoading;
  const factory DeliveringMapState.initial() = DeliveringMapStateinitial;
  const factory DeliveringMapState.error({String? error}) = DeliveringMapStateError;
  const factory DeliveringMapState.success(String url) = DeliveringMapStateSuccess;
  const factory DeliveringMapState.onCameraMove({double? height}) = DeliveringMapStateOnCameraMove;


}
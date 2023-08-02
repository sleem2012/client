import 'package:freezed_annotation/freezed_annotation.dart';
part 'in_drive_state.freezed.dart';

@freezed
 class InDriveState with _$InDriveState{
  const factory InDriveState.initial() = InDriveStateInitial;
  const factory InDriveState.loading() = InDriveStateLoading;
  const factory InDriveState.success(String cost) = InDriveStateSuccess;
  const factory InDriveState.error({required String error}) = InDriveStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_in_drive_state.freezed.dart';

@freezed
 class GetInDriveState with _$GetInDriveState{
  const factory GetInDriveState.loading() = GetInDriveStateLoading;
  const factory GetInDriveState.initial() = GetInDriveStateInitial;
  const factory GetInDriveState.success() = GetInDriveStateSuccess;
  const factory GetInDriveState.error({required String error}) = GetInDriveStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
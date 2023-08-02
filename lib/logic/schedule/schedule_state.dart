import '../../data/models/schedule/schedule_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_state.freezed.dart';


@freezed
 class ScheduleState with _$ScheduleState {
  const factory ScheduleState.initial() = ScheduleStateInitial;
  const factory ScheduleState.loading() = ScheduleStateLoading;
  const factory ScheduleState.success({required ScheduleModel model}) = ScheduleStateSuccess;
  const factory ScheduleState.error({required String error}) = ScheduleStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
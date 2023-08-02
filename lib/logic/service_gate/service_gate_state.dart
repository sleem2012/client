import 'package:freezed_annotation/freezed_annotation.dart';
import '../../packages/shared/error/failures.dart';
part 'service_gate_state.freezed.dart';

@freezed
class ServiceGateState with _$ServiceGateState {
  const factory ServiceGateState.loading() = ServiceGateStateLoading;
  const factory ServiceGateState.loadMore() = ServiceGateStateLoadMore;
  const factory ServiceGateState.success({String? force}) = ServiceGateStateSuccess;
  const factory ServiceGateState.error({required KFailure error}) = ServiceGateStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
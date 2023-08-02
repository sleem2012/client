import '../../../data/models/orders/orders_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_orders_state.freezed.dart';

@freezed
 class GetOrdersState with _$GetOrdersState {
  const factory GetOrdersState.initial() = GetOrdersStateInitial;
  const factory GetOrdersState.loading() = GetOrdersStateLoading;
  const factory GetOrdersState.success({required OrderModel orderModel}) = GetOrdersStateSuccess;
  const factory GetOrdersState.updateSuccess() = GetOrdersStateUpdateSuccess;
  const factory GetOrdersState.updateError({required String error}) = GetOrdersStateUpdateError;
  const factory GetOrdersState.error({required String error}) = GetOrdersStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
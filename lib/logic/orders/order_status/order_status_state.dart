import '../../../data/models/orders/order_status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_status_state.freezed.dart';

@freezed
 class OrderStatusState with _$OrderStatusState{
  const factory OrderStatusState.loading() = OrderStatusStateLoading;
  const factory OrderStatusState.success({required OrderStatusModel orderStatusModel}) = OrderStatusStateSuccess;
  const factory OrderStatusState.error({required String error}) = OrderStatusStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_orders_state.freezed.dart';

@freezed
 class CreateOrdersState with _$CreateOrdersState{
  const factory CreateOrdersState.initial() = CreateOrdersStateInitial;

  const factory CreateOrdersState.loading() = CreateOrdersStateLoading;
  const factory CreateOrdersState.success({required String url}) = CreateOrdersStateSuccess;
  const factory CreateOrdersState.error({required String error}) = CreateOrdersStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
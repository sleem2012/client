import 'package:freezed_annotation/freezed_annotation.dart';
part 'delivering_payment_state.freezed.dart';

@freezed
 class DeliveringPaymentState with _$DeliveringPaymentState{
  const factory DeliveringPaymentState.loading() = DeliveringPaymentStateLoading;
  const factory DeliveringPaymentState.initial() =DeliveringPaymentStateInitial;
  const factory DeliveringPaymentState.error({String? error}) = DeliveringPaymentStateError;
  const factory DeliveringPaymentState.success({required String url}) = DeliveringPaymentStateSuccess;



}
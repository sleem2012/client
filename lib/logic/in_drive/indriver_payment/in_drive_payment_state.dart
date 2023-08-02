import 'package:freezed_annotation/freezed_annotation.dart';
part 'in_drive_payment_state.freezed.dart';

@freezed
 class InDrivePaymentState with _$InDrivePaymentState{
  const factory InDrivePaymentState.loading() = InDrivePaymentStateLoading;
  const factory InDrivePaymentState.initial() =InDrivePaymentStateInitial;
  const factory InDrivePaymentState.error({String? error}) = InDrivePaymentStateError;
  const factory InDrivePaymentState.success({required String url}) = InDrivePaymentStateSuccess;



}
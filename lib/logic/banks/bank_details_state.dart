import '../../data/models/user_info/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_details_state.freezed.dart';

@freezed
 class BankDetailsState with _$BankDetailsState {
  const factory BankDetailsState.loading() =BankDetailsStateLoading;
  const factory BankDetailsState.success({required UserCompany model}) =BankDetailsStateSuccess;
  const factory BankDetailsState.error({required String error}) =BankDetailsStateError;
}


// flutter pub run build_runner watch --delete-conflicting-outputs
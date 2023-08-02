import '../../../data/models/orders/request_quote_.dart';
import '../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_request_quoet_state.freezed.dart';

@freezed
class GetRequestQuoteState with _$GetRequestQuoteState {
  const factory GetRequestQuoteState.loading() = GetRequestQuoteStateLoading;
  const factory GetRequestQuoteState.success(RequestQuoteResponse quotes) = GetRequestQuoteStateSuccess;
  const factory GetRequestQuoteState.error({required KFailure error}) = GetRequestQuoteStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
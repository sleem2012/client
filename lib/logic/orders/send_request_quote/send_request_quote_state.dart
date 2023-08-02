import '../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'send_request_quote_state.freezed.dart';

@freezed
class SendRequestQuoteState with _$SendRequestQuoteState {
  const factory SendRequestQuoteState.initial() = SendRequestQuoteStateInitial;
  const factory SendRequestQuoteState.loading() = SendRequestQuoteStateLoading;
  const factory SendRequestQuoteState.success() = SendRequestQuoteStateSuccess;
  const factory SendRequestQuoteState.error({required KFailure error}) = SendRequestQuoteStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
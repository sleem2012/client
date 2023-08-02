import 'package:freezed_annotation/freezed_annotation.dart';
part 'review_order_state.freezed.dart';

@freezed
 class ReviewOrderState with _$ReviewOrderState{
  const factory ReviewOrderState.initial() = ReviewOrderStateInitial;
  const factory ReviewOrderState.loading() = ReviewOrderStateLoading;
  const factory ReviewOrderState.success() = ReviewOrderStateSuccess;
  const factory ReviewOrderState.error({required String error}) = ReviewOrderStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
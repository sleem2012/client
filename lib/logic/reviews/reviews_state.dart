import '../../data/models/reviews/reviews_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reviews_state.freezed.dart';

@freezed
 class ReviewsState with _$ReviewsState{
  const factory ReviewsState.loading() = ReviewsStateLoading;
  const factory ReviewsState.success({required ReviewModel reviewModel}) = ReviewsStateSuccess;
  const factory ReviewsState.error({required String error}) = ReviewsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/reviews/reviews_model.dart';
import '../../data/repository/reviews/reviews_repo.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import 'reviews_state.dart';

class ReviewsBloc extends Cubit<ReviewsState> {
  ReviewsBloc({required this.reviewsRepoImp}) : super(const ReviewsState.loading());

  static ReviewsBloc of(BuildContext context) {
    return BlocProvider.of<ReviewsBloc>(context);
  }

  final ReviewsRepoImp reviewsRepoImp;
  ReviewModel? reviewModel;

  double? rate;

  setRate(double selectedRate) {
    rate = selectedRate;
    debugPrint(rate.toString());
  }

  get(int id) async {
    try {
      emit(const ReviewsState.loading());
      final result = await reviewsRepoImp.get(id);
      result.fold(
        (l) {
          debugPrint('================= Reviews Bloc : ${KFailure.toError(l)}');
          emit(ReviewsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= Reviews Bloc : ${r.toString()}  ');
          reviewModel = r;
          emit(ReviewsState.success(reviewModel: reviewModel!));
        },
      );
    } catch (e) {
      debugPrint('================= Reviews Bloc (Catch): ${e.toString()} ');
      emit(ReviewsState.error(error: Tr.get.something_went_wrong));
    }
  }

  crate({required int id, required String comment}) async {
    try {
      emit(const ReviewsState.loading());
      final result = await reviewsRepoImp.create(id: id, rate: rate!, comment: comment);
      result.fold(
        (l) {
          debugPrint('================= Reviews Bloc : ${KFailure.toError(l)}');
          emit(ReviewsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= Reviews Bloc : ${r.toString()}  ');
          emit(ReviewsState.success(reviewModel: reviewModel!));
          get(id);
        },
      );
    } catch (e) {
      debugPrint('================= Reviews Bloc (Catch): ${e.toString()} ');
      emit(ReviewsState.error(error: Tr.get.something_went_wrong));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/orders/order_review_model.dart';
import '../../../shared/localization/trans.dart';
import '../../../views/widgets/slugs_drop_down.dart';
import '../../../data/repository/orders/orders_repo.dart';
import '../../../packages/shared/error/failures.dart';
import 'review_order_state.dart';

class ReviewOrderBloc extends Cubit<ReviewOrderState> {
  ReviewOrderBloc({required this.ordersRepoImp}) : super(const ReviewOrderState.initial());

  static ReviewOrderBloc of(BuildContext context) => BlocProvider.of<ReviewOrderBloc>(context);

  final OrdersRepoImp? ordersRepoImp;
  OrderReviewModel reviewOrderModel = OrderReviewModel();

  KSlugModel? reviewType;

  selectType(KSlugModel? selected) {
    reviewOrderModel = reviewOrderModel.copyWith(type: selected?.slug);
    reviewType = selected;
    _update;
  }

  rate(int rate) {
    reviewOrderModel = reviewOrderModel.copyWith(rate: rate.toString());
    _update;
  }

  TextEditingController noteCtrl = TextEditingController();

  addReview(int id) async {
    try {
      reviewOrderModel = reviewOrderModel.copyWith(note: noteCtrl.text, id: id);
      debugPrint(reviewOrderModel.toJson().toString());
      emit(const ReviewOrderState.loading());

      final result = await ordersRepoImp?.addReview(reviewOrderModel);
      result?.fold(
        (l) {
          debugPrint('================= ReviewOrder Bloc : ${KFailure.toError(l)}');
          emit(ReviewOrderState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= ReviewOrder Bloc : ${r.toString()}  ');
          emit(const ReviewOrderState.success());
        },
      );
    } catch (e) {
      debugPrint('================= ReviewOrder Bloc (Catch): ${e.toString()} ');
      emit(ReviewOrderState.error(error: Tr.get.something_went_wrong));
    }
  }

  get _update {
    emit(const ReviewOrderState.loading());
    emit(const ReviewOrderState.initial());
  }
}

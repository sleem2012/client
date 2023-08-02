import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/orders/order_review_model.dart';
import '../../../data/repository/in_drive/in_drive_repo.dart';
import 'rate_trip_state.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

class RateTripCubit extends Cubit<RateTripState> {
  RateTripCubit({required this.inDriveRepoImp}) : super(const RateTripState.initial());

  static RateTripCubit of(context) => BlocProvider.of(context);
  final InDriveRepoImp inDriveRepoImp;

  OrderReviewModel reviewOrderModel = OrderReviewModel();

  rate(int rate) {
    reviewOrderModel = reviewOrderModel.copyWith(rate: (rate).toString());
    _update;
  }

  TextEditingController noteCtrl = TextEditingController();

  addReview(int id) async {
    try {
      reviewOrderModel = reviewOrderModel.copyWith(note: noteCtrl.text, rateId: id);
      debugPrint(reviewOrderModel.toJson().toString());
      emit(const RateTripState.loading());
      final result = await inDriveRepoImp.rateTrip(reviewOrderModel);
      result.fold(
        (l) {
          debugPrint('================= ReviewOrder Bloc : ${KFailure.toError(l)}');
          emit(RateTripState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= ReviewOrder Bloc : ${r.toString()}  ');
          emit(const RateTripState.success());
        },
      );
    } catch (e) {
      debugPrint('================= ReviewOrder Bloc (Catch): ${e.toString()} ');
      emit(RateTripState.error(error: Tr.get.something_went_wrong));
    }
  }

  get _update {
    emit(const RateTripState.loading());
    emit(const RateTripState.initial());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/delivering/delivering_repo.dart';
import '../../../di.dart';
import 'delivering_payment_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

import '../../../packages/payment/data/payment/my_payment_model.dart';

class DeliveringPaymentCubit extends Cubit<DeliveringPaymentState> {
  DeliveringPaymentCubit({required this.deliveringRepoImp}) : super(const DeliveringPaymentState.initial());

  static DeliveringPaymentCubit of(context) => BlocProvider.of(context);

  final DeliveringRepoImp deliveringRepoImp;
  PaymentData? selectedPayment;

  Future<void> selectPaymentId(PaymentData paymentData) async {
    selectedPayment = paymentData;
    debugPrint('================= ${selectedPayment?.id} :paymentId ');
    _update;
  }

  handlePayment({required int id}) async {
    try {
      emit(const DeliveringPaymentState.loading());

      final result = await deliveringRepoImp.handlePayment(id, selectedPayment!.id!);
      result.fold(
        (l) {
          emit(DeliveringPaymentState.error(error: KFailure.toError(l)));
          KHelper.showSnackBar(KFailure.toError(l));
          debugPrint('================= createDeliveringOrder  : $l  ');
        },
        (r) {
          emit(DeliveringPaymentState.success(url: r));
          // update_order_socket(orderId: id);
        },
      );
    } catch (e) {
      debugPrint('================= createDeliveringOrder  Ex : $e : ');
      emit(DeliveringPaymentState.error(error: Tr.get.something_went_wrong));
    }
  }

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  Future update_order_socket({
    required int? orderId,
  }) async {
    if (orderId != null && my_id != null) {
      await Di.socket.emit('order_bill', {"id": orderId, "type": "client"});
      debugPrint('sent' '$my_id');
    }
  }

  get _update {
    emit(const DeliveringPaymentState.loading());
    emit(const DeliveringPaymentState.initial());
  }
}

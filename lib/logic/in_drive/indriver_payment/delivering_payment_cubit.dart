import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/in_drive/in_drive_repo.dart';
import '../../../di.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

import '../../../packages/payment/data/payment/my_payment_model.dart';
import 'in_drive_payment_state.dart';

class InDrivePaymentCubit extends Cubit<InDrivePaymentState> {
  InDrivePaymentCubit({required this.inDriveRepoImp}) : super(const InDrivePaymentState.initial());

  static InDrivePaymentCubit of(context) => BlocProvider.of(context);

  final InDriveRepoImp inDriveRepoImp;
  PaymentData? selectedPayment;

  Future<void> selectPaymentId(PaymentData paymentData) async {
    selectedPayment = paymentData;
    debugPrint('================= ${selectedPayment?.id} :paymentId ');
    _update;
  }

  handlePayment({required int id}) async {
    try {
      emit(const InDrivePaymentState.loading());

      final result = await inDriveRepoImp.handlePayment(id, selectedPayment!.id!);
      result.fold(
        (l) {
          emit(InDrivePaymentState.error(error: KFailure.toError(l)));
          KHelper.showSnackBar(KFailure.toError(l));
          debugPrint('================= createInDriveOrder  : $l  ');
        },
        (r) {
          emit(InDrivePaymentState.success(url: r));
        },
      );
    } catch (e) {
      debugPrint('================= createInDriveOrder  Ex : $e : ');
      emit(InDrivePaymentState.error(error: Tr.get.something_went_wrong));
    }
  }

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  socketEmit({required int order_id}) {
    Di.socket.emit(
      'book_trip',
      {
        "id": order_id,
        "type": "client",
      },
    );
    debugPrint('================= socketEmit book_trip $order_id');
  }

  get _update {
    emit(const InDrivePaymentState.loading());
    emit(const InDrivePaymentState.initial());
  }
}

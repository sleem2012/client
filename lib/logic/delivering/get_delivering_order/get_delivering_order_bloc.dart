import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/orders/get_delivering_order_model.dart';
import '../../../data/models/orders/update_delivering_order_model.dart';
import '../../../data/repository/delivering/delivering_repo.dart';
import '../../../di.dart';
import 'get_delivering_order_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../views/widgets/slugs_drop_down.dart';
import '../../../packages/extensions.dart';

class GetDeliveringOrderBloc extends Cubit<GetDeliveringOrderState> {
  GetDeliveringOrderBloc({
    required this.deliveringRepoImp,
  }) : super(const GetDeliveringOrderState.initial());

  static GetDeliveringOrderBloc of(BuildContext context) {
    return BlocProvider.of<GetDeliveringOrderBloc>(context);
  }

  GetDeliveringOrderModel? getDeliveringOrder;

  final DeliveringRepoImp deliveringRepoImp;
  UpdateDeliveringOrderModel? updateDeliveringOrderModel = UpdateDeliveringOrderModel();

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  getDeliveringOrders() async {
    try {
      emit(const GetDeliveringOrderState.loading());

      final result = await deliveringRepoImp.getDeliveringOrders();
      result.fold(
        (l) {
          emit(GetDeliveringOrderState.error(error: KFailure.toError(l)));
          KHelper.showSnackBar(KFailure.toError(l));
          debugPrint('================= createDeliveringOrder  : $l  ');
        },
        (r) {
          getDeliveringOrder = r;
          emit(GetDeliveringOrderState.success(getDeliveringOrderModel: getDeliveringOrder!));
        },
      );
    } catch (e) {
      debugPrint('================= createDeliveringOrder  Ex : $e : ');
      emit(GetDeliveringOrderState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  List<DeliveringOrderData>? statusOrder() {
    return getDeliveringOrder?.data
        ?.where((element) =>
            element.state == KSlugModel.inPayment ||
            element.state == KSlugModel.lookingForRider ||
            element.state == KSlugModel.pending ||
            element.state == KSlugModel.paymentNeeded ||
            element.state == KSlugModel.onDelivering ||
            element.state == KSlugModel.arrivedClient ||
            element.state == KSlugModel.completedCode ||
            element.state == 'after_pay')
        .toList();
  }

  List<DeliveringOrderData>? historyOrder() {
    return getDeliveringOrder?.data
        ?.where(
          (element) =>
              element.state == KSlugModel.completed ||
              element.state == KSlugModel.userNotFound ||
              element.state == KSlugModel.canceled ||
              element.state == KSlugModel.accident,
        )
        .toList();
  }

  updateOrder({required DeliveringOrderData data, required String orderState}) async {
    try {
      updateDeliveringOrderModel = updateDeliveringOrderModel?.copyWith(shippingId: data.id, state: orderState);
      updateLocalState(data: data, orderState: orderState);
      final result = await deliveringRepoImp.UpdateOrders(updateDeliveringOrderModel!);
      result.fold(
        (l) {
          debugPrint('=================update orders fails :$l ');
          getDeliveringOrder = getDeliveringOrder?.copyWith(data: getDeliveringOrder?.data?.replaceWhere((element) => element.id == data.id, data));
          emit(GetDeliveringOrderState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('=================update orders  Success :$r ');
          emit(GetDeliveringOrderState.success(getDeliveringOrderModel: getDeliveringOrder!));
          update_order_socket(orderId: data.id);
        },
      );
    } catch (e) {
      debugPrint('=================update Order  catch $e  ');
      emit(GetDeliveringOrderState.updateError(error: Tr.get.something_went_wrong));
    }
  }

  updateLocalState({required DeliveringOrderData data, required String orderState}) {
    getDeliveringOrder = getDeliveringOrder?.copyWith(
      data: getDeliveringOrder?.data
        ?..removeWhere((element) => element.id == data.id)
        ..insert(0, data.copyWith(state: orderState, hasPaySupTotal: data.hasPaySupTotal, PaymentValue: data.PaymentValue)),
    );
    _update;
  }

  Future update_order_socket({
    required int? orderId,
  }) async {
    if (orderId != null) {
      await Di.socket.emit('order_bill', {"id": orderId, "type": "client"});
      debugPrint('sent' '$orderId');
    }
  }

  init_delivering_socket() {
    debugPrint('================= init_socket for order-$my_id');
    Di.socket.on('my-orders_bill-$my_id', (data) {
      from_server(data);
    });
    debugPrint('=================> Server Connection State : ${Di.socket.connected} ');
  }

  from_server(json) {
    debugPrint('================= From Server : $json');
    DeliveringOrderData orderData = DeliveringOrderData.fromJson(json['value']);
    updateLocalState(data: orderData, orderState: orderData.state!);
    _update;
    debugPrint('============id===========>>>>>>>>${orderData.id.toString()} ');
  }

  @override
  close() async {
    Di.socket.off('my-orders_bill-$my_id');
    super.close();
  }

  get _update {
    emit(const GetDeliveringOrderState.loading());
    emit(GetDeliveringOrderState.success(getDeliveringOrderModel: getDeliveringOrder!));
  }
}

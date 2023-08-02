import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/shared/error/failures.dart';

import '../../../data/models/orders/orders_model.dart';
import '../../../data/repository/orders/orders_repo.dart';
import '../../../di.dart';
import '../../../packages/extensions.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/logger.dart';
import '../../../views/widgets/slugs_drop_down.dart';
import 'get_orders_state.dart';

class GetOrderBloc extends Cubit<GetOrdersState> {
  GetOrderBloc({required this.ordersRepoImp}) : super(const GetOrdersState.loading());

  static GetOrderBloc of(BuildContext context) {
    return BlocProvider.of<GetOrderBloc>(context);
  }

  final OrdersRepoImp ordersRepoImp;
  OrderModel? orderModel;
  Shipping? shippingData;

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  getOrder() async {
    try {
      emit(const GetOrdersState.loading());
      final result = await ordersRepoImp.getOrders();
      result.fold(
        (l) {
          debugPrint('=================My notifications fails :$l ');
          emit(GetOrdersState.error(error: KFailure.toError(l)));
        },
        (r) {
          orderModel = r;
          debugPrint('=================My notifications  Success :$r ');
          emit(GetOrdersState.success(orderModel: orderModel!));
        },
      );
    } catch (e) {
      debugPrint('=================My Order  catch $e  ');
      emit(GetOrdersState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  OrderData? _selectedOrderData;
  setSelectedOrderData(OrderData data) {
    _selectedOrderData = data;
  }

  OrderData get getSelected => _selectedOrderData ?? OrderData();

  OrderData? get selectedOrderData {
    return orderModel?.data?.where((element) => element.id == _selectedOrderData?.id).toList().first;
  }

  List<OrderData> filterOrders(String stateSlug) {
    return orderModel?.data?.where(
          (element) {
            if (element.state == stateSlug) {
              return true;
            } else if (stateSlug == KSlugModel.inPayment && element.state == KSlugModel.pending) {
              return true;
            } else {
              return false;
            }
          },
        ).toList() ??
        [];
  }

  updateOrder({required String state, required Shipping shipping}) async {
    try {
      updateLocalState(orderState: state, shipping: shipping);
      final result = await ordersRepoImp.updateOrder(shipping_id: shipping.id ?? 0, state: state);
      result.fold(
        (l) {
          debugPrint('=================update orders fails :$l ');
          emit(GetOrdersState.updateError(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('=================update orders  Success :$r ');
          emit(GetOrdersState.success(orderModel: orderModel!));
          update_order_socket(orderId: shipping.id);
        },
      );
    } catch (e) {
      debugPrint('=================update Order  catch $e  ');
      emit(GetOrdersState.updateError(error: Tr.get.something_went_wrong));
    }
  }

  Future update_order_socket({
    required int? orderId,
  }) async {
    if (orderId != null && my_id != null) {
      Di.socket.emit('order', {"shipping_order_id": orderId, "type": "client"});
      debugPrint('sent' '$orderId');
    }
  }

  init_socket() {
    debugPrint('================= init_socket for order-$my_id');
    Di.socket.on('my-orders-$my_id', (data) {
      from_server(data);
    });
    debugPrint('=================> Server Connection State : ${Di.socket.connected} ');
  }

  from_server(json) {
    OrderData orderData = OrderData.fromJson(json['value']);
    printMap(json['value']);

    orderModel = orderModel?.copyWith(
      data: orderModel?.data?.replaceWhere((element) => element.id == orderData.id, orderData),
    );

    _update;
    debugPrint('============id===========>>>>>>>>${orderData.id.toString()} ');
  }

  @override
  close() async {
    Di.socket.off('my-orders-$my_id');
    super.close();
  }

  updateLocalState({String? orderState, Shipping? shipping}) {
    _selectedOrderData = selectedOrderData!.copyWith(
      shipping: selectedOrderData?.shipping
        ?..replaceWhere(
          (element) => element.id == shipping.id,
          shipping!.copyWith(state: orderState, qrClient: shipping.qrClient),
        ),
    );
    orderModel = orderModel?.copyWith(
      data: orderModel?.data?.replaceWhere((element) => element.id == selectedOrderData?.id, selectedOrderData!),
    );
    _update;
  }

  get _update {
    emit(const GetOrdersState.loading());
    emit(GetOrdersState.success(orderModel: orderModel!));
  }
}

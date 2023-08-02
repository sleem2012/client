import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart/cart_model.dart';
import '../../../data/models/orders/create_order.dart';
import '../../../data/repository/orders/orders_repo.dart';
import '../../../di.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/logger.dart';
import 'package:geolocator/geolocator.dart';

import '../../../packages/payment/data/payment/my_payment_model.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../views/map/logic/location_helper.dart';
import 'create_orders_state.dart';

class CreateOrdersBloc extends Cubit<CreateOrdersState> {
  CreateOrdersBloc({required this.ordersRepoImp}) : super(const CreateOrdersState.initial());
  static CreateOrdersBloc of(BuildContext context) => BlocProvider.of<CreateOrdersBloc>(context);

  final OrdersRepoImp ordersRepoImp;
  CreateOrderModel? createOrderModel = CreateOrderModel();

  PaymentData? selectedPayment;
  Position? currentPosition;
  TextEditingController noteController = TextEditingController();
  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  createOrder(Map<int?, ProviderOfferModel> selectedOffers) async {
    try {
      if (selectedPayment != null) {
        final Map<String, dynamic> shippers = {};
        for (var s in selectedOffers.entries.toList()) {
          shippers.addAll({"shipper[${s.key}]": s.value.id});
        }
        printMap(shippers);

        emit(const CreateOrdersState.loading());
        currentPosition = await LocationHelper.determinePosition();

        createOrderModel = createOrderModel?.copyWith(
          paymentId: selectedPayment?.id ?? 0,
          userNote: noteController.text,
          lat: currentPosition?.latitude.toString(),
          lng: currentPosition?.longitude.toString(),
        );

        printMap(createOrderModel!.toJson()..addAll(shippers));

        final result = await ordersRepoImp.create_orders(createOrderModel: createOrderModel!.toJson()..addAll(shippers));
        result.fold(
          (l) {
            emit(CreateOrdersState.error(error: KFailure.toError(l)));
            KHelper.showSnackBar(KFailure.toError(l));
            debugPrint('================= CreateorderBloc  : $l  ');
          },
          (r) {
            emit(CreateOrdersState.success(url: r));
          },
        );
      } else {
        KHelper.showSnackBar(Tr.get.select_payment_card);
        return;
      }
    } catch (e) {
      debugPrint('================= CreateorderBloc  Ex : $e : ');
      emit(CreateOrdersState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  Future send_order({required int? orderId}) async {
    if (orderId != null && my_id != null) {
      await Di.socket.emit('order', {"order_id": orderId, "auth": my_id, "type": "client"});
      debugPrint('sent');
    }
  }

  Future<void> selectPaymentId(PaymentData paymentData) async {
    selectedPayment = paymentData;
    _update;
  }

  get _update {
    emit(const CreateOrdersState.loading());
    emit(const CreateOrdersState.initial());
  }

  @override
  close() async {
    Di.socket.off('my-orders-$my_id');
    super.close();
  }
}

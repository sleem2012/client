import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/shared/error/failures.dart';

import '../../../data/models/orders/order_status_model.dart';
import '../../../data/repository/orders/orders_repo.dart';
import '../../../shared/localization/trans.dart';
import 'order_status_state.dart';

class OrderStatusBloc extends Cubit<OrderStatusState> {
  OrderStatusBloc({required this.ordersRepoImp}) : super(const OrderStatusState.loading());

  static OrderStatusBloc of(BuildContext context) => BlocProvider.of<OrderStatusBloc>(context);

  final OrdersRepoImp? ordersRepoImp;
  OrderStatusModel? orderStatusModel;

  get(int OrderId) async {
    try {
      emit(const OrderStatusState.loading());
      final result = await ordersRepoImp?.getStatus(OrderId);
      result?.fold(
        (l) {
          debugPrint('================= OrderStatus Bloc : ${KFailure.toError(l)}');
          emit(OrderStatusState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= OrderStatus Bloc : ${r.toString()}  ');
          orderStatusModel = r;
          emit(OrderStatusState.success(orderStatusModel: orderStatusModel!));
        },
      );
    } catch (e) {
      debugPrint('================= OrderStatus Bloc (Catch): ${e.toString()} ');
      emit(OrderStatusState.error(error: Tr.get.something_went_wrong));
    }
  }

  List<StepperData> getStepperData() {
    final List<StepperData> statusList = [];
    for (var item in orderStatusModel?.data ?? <StatusData>[]) {
      statusList.add(StepperData(title: item.state, subtitle: item.id.toString()));
    }
    return [
      StepperData(title: 'sadasdasd', subtitle: 'sadasdasd'),
      StepperData(title: 'sadasdasd', subtitle: 'sadasdasd'),
      StepperData(title: 'sadasdasd', subtitle: 'sadasdasd'),
      StepperData(title: 'sadasdasd', subtitle: 'sadasdasd'),
      StepperData(title: 'sadasdasd', subtitle: 'sadasdasd'),
      StepperData(title: 'sadasdasd', subtitle: 'sadasdasd'),
      StepperData(title: 'sadasdasd', subtitle: 'sadasdasd'),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../logic/orders/create_order/create_orders_bloc.dart';
import '../../../../logic/orders/create_order/create_orders_state.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/drop_down.dart';
import 'package:get/get.dart';

import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../packages/payment/data/payment/my_payment_model.dart';
import '../../../../packages/payment/logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import '../../../../packages/payment/logic/get_my_payment_bloc/get_my_payment_state.dart';
import '../../../../packages/payment/view/add_card_payment.dart';
import '../../../widgets/on_success_view.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
      builder: (context, state) {
        return BlocBuilder<MyPaymentsBloc, MyPaymentsState>(
          builder: (context, state) {
            final paymentList = state.maybeWhen(
              orElse: () => <PaymentData>[],
              success: (model) => model.data!.where((element) => element.state == "valid"),
            );
            if (paymentList.isNotEmpty) {
              return KDropdownBtn<PaymentData>(
                onChanged: (value) async {
                  CreateOrdersBloc.of(context).selectPaymentId(value!);
                },
                value: CreateOrdersBloc.of(context).selectedPayment,
                items: (paymentList)
                    .map(
                      (e) => KHelper.of(context).itemView<PaymentData>(
                        itemText: "${e.values?.firstWhereOrNull((element) => element.key == "number")?.value}",
                        value: e,
                      ),
                    )
                    .toList(),
                title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_payment_card,
              );
            } else {
              return KButton(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                onPressed: () {
                  Get.to(() =>  AddCardPaymentView(
                        onSuccess: () {
                          Nav.replace(OnSuccessView(msg: Tr.get.payment_added_successfully, doubleBack: true));
                        },
                      ));
                },
                title: Tr.get.no_card,
              );
            }
          },
        );
      },
    );
  }
}

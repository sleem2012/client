import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/widgets/web_view.dart';
import 'package:get/get.dart';

import '../../../../logic/delivering/delivering_payment/delivering_payment_cubit.dart';
import '../../../../logic/delivering/delivering_payment/delivering_payment_state.dart';
import '../../../../logic/delivering/get_delivering_order/get_delivering_order_bloc.dart';
import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../packages/payment/data/payment/my_payment_model.dart';
import '../../../../packages/payment/logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import '../../../../packages/payment/logic/get_my_payment_bloc/get_my_payment_state.dart';
import '../../../../packages/payment/view/add_card_payment.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/drop_down.dart';
import '../../../widgets/loading/loading_overlay.dart';
import '../../../widgets/on_error_view.dart';
import '../../../widgets/on_success_view.dart';
import '../delivering_order/delivering_order_screen.dart';

class DeliveringPayment extends StatelessWidget {
  const DeliveringPayment({
    Key? key,
    this.Id,
  }) : super(key: key);
  final int? Id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocListener<DeliveringPaymentCubit, DeliveringPaymentState>(
          listener: (context1, state) {
            state.whenOrNull(
              success: (url) {
                Navigator.pop(context);
                if (url.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => KWebView(
                        url: url,
                        onSuccess: () {
                          debugPrint("url$url");
                          final orderId = url.split('=').lastOrNull ?? '-1';
                          debugPrint("url id=>${url.split('=').lastOrNull}");
                          DeliveringPaymentCubit.of(_).update_order_socket(orderId: int.parse(orderId));
                          GetDeliveringOrderBloc.of(_).getDeliveringOrders();
                          Nav.replace(
                            OnSuccessView(
                              msg: Tr.get.order_success,
                              doubleBack: true,
                              destination: const DeliveringOrderScreen(),
                            ),
                          );
                          // GetOrderBloc.of(context).getOrder();
                        },
                        onFail: () {
                          debugPrint(url.toString());

                          Nav.replace(
                            OnErrorView(
                              msg: Tr.get.error_card,
                              doubleBack: true,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            );
          },
          child: BlocBuilder<DeliveringPaymentCubit, DeliveringPaymentState>(
            builder: (context, state) {
              final paymentDelivering = DeliveringPaymentCubit.of(context);
              return KLoadingOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                child: BlocBuilder<MyPaymentsBloc, MyPaymentsState>(
                  builder: (context, state) {
                    final paymentList = state.maybeWhen(
                      orElse: () => <PaymentData>[],
                      success: (model) => model.data!.where((element) => element.state == "valid"),
                    );
                    if (paymentList.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: KDropdownBtn<PaymentData>(
                                onChanged: (value) async {
                                  paymentDelivering.selectPaymentId(value!);
                                },
                                value: paymentDelivering.selectedPayment,
                                items: (paymentList)
                                    .map(
                                        (e) => KHelper.of(context).itemView<PaymentData>(itemText: "${e.values?.firstWhere((element) => element.key == "number").value}", value: e))
                                    .toList(),
                                title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_payment_card,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: KButton(
                                  title: Tr.get.submit,
                                  onPressed: () {
                                    DeliveringPaymentCubit.of(context).handlePayment(id: Id!);
                                  }),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return KButton(
                        isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                        onPressed: () {
                          Get.to(() => AddCardPaymentView(
                                onSuccess: () {
                                  Nav.replace(OnSuccessView(msg: Tr.get.payment_added_successfully, doubleBack: true));
                                },
                              ));
                        },
                        title: Tr.get.no_card,
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

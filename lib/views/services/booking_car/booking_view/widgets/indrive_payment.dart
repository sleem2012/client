import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/widgets/web_view.dart';
import '../../../../../data/models/in_drive/trip_model.dart';
import '../../../../../logic/in_drive/indriver_payment/delivering_payment_cubit.dart';
import '../../../../../logic/in_drive/indriver_payment/in_drive_payment_state.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../shared/localization/trans.dart';
import '../../../../../shared/theme/helper.dart';
import '../../../../main_screen/main_screen.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/drop_down.dart';
import '../../../../widgets/loading/loading_overlay.dart';
import '../../../../widgets/on_error_view.dart';
import '../../../../widgets/on_success_view.dart';
import 'package:get/get.dart';

import '../../../../../packages/payment/data/payment/my_payment_model.dart';
import '../../../../../packages/payment/logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import '../../../../../packages/payment/logic/get_my_payment_bloc/get_my_payment_state.dart';
import '../../../../../packages/payment/view/add_card_payment.dart';

class InDrivePayment extends StatelessWidget {
  const InDrivePayment({
    Key? key,
    required this.data,
  }) : super(key: key);
  final TripModelData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocListener<InDrivePaymentCubit, InDrivePaymentState>(
          listener: (_, state) {
            state.whenOrNull(success: (url) {
              debugPrint(url);
              Navigator.pop(context);
              if (url.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          KWebView(url: url, onSuccess: () {
                            InDrivePaymentCubit.of(_).socketEmit(order_id: data.id ?? 0);

                            Get.offAll(
                              OnSuccessView(
                                msg: Tr.get.enjoy,
                                destination: const MainNavigationView(),
                              ),
                            );
                          }, onFail: () {
                            debugPrint(url.toString());

                            Nav.replace(OnErrorView(msg: Tr.get.error_card, doubleBack: true));

                          },)


                    ));
              }
            });
          },
          child: BlocBuilder<InDrivePaymentCubit, InDrivePaymentState>(
            builder: (context, state) {
              final paymentInDrive = InDrivePaymentCubit.of(context);
              return KLoadingOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                child: BlocBuilder<MyPaymentsBloc, MyPaymentsState>(
                  builder: (context, state) {
                    final paymentList = state.maybeWhen(
                      orElse: () => <PaymentData>[],
                      success: (model) => model.data!.where((element) => element.state == "valid"),
                    );
                    if (paymentList.isNotEmpty) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: KDropdownBtn<PaymentData>(
                              onChanged: (value) async {
                                paymentInDrive.selectPaymentId(value!);
                              },
                              value: paymentInDrive.selectedPayment,
                              items: (paymentList)
                                  .map((e) => KHelper.of(context)
                                      .itemView<PaymentData>(itemText: "${e.values?.firstWhere((element) => element.key == "number").value}", value: e))
                                  .toList(),
                              title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_payment_card,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            child: KButton(
                                title: Tr.get.submit,
                                onPressed: () {
                                  InDrivePaymentCubit.of(context).handlePayment(id: data.id!);
                                }),
                          ),
                        ],
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

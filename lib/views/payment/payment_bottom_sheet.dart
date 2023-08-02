import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/delivering/delivering_map/delivering_map_bloc.dart';
import '../../logic/delivering/delivering_map/delivering_map_state.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import '../widgets/custom_button.dart';
import '../widgets/drop_down.dart';

import 'package:get/get.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/payment/data/payment/my_payment_model.dart';
import '../../packages/payment/logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import '../../packages/payment/logic/get_my_payment_bloc/get_my_payment_state.dart';
import '../../packages/payment/view/add_card_payment.dart';
import '../widgets/on_success_view.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveringMapBloc, DeliveringMapState>(
        listener: (context, state) {},
        builder: (context, state) {
          final delivering = DeliveringMapBloc.of(context);

          return FormField(
            validator: (value) {
              if (delivering.selectedPayment == null) {
                return Tr.get.field_required;
              } else {
                return null;
              }
            },
            builder: (FormFieldState<dynamic> field) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<MyPaymentsBloc, MyPaymentsState>(
                    builder: (context, state) {
                      final paymentList = state.maybeWhen(
                        orElse: () => <PaymentData>[],
                        success: (model) {
                          debugPrint('--------------------------${model.data?.length.toString() ?? ''}');

                          return model.data!
                              .where((element) =>
                                  element.state == "valid" && (element.values?.where((element) => element.key == "number").toList() ?? []).isNotEmpty)
                              .toList();
                        },
                      );
                      if (paymentList.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: KDropdownBtn<PaymentData>(
                            // color: field.hasError ? Colors.red : KColors.of(context).accentColor,
                            onChanged: (value) async {
                              delivering.selectPaymentId(value!);
                            },
                            value: delivering.selectedPayment,
                            items: (paymentList)
                                .map((e) => KHelper.of(context)
                                    .itemView<PaymentData>(itemText: "${e.values?.firstWhere((element) => element.key == "number").value}", value: e))
                                .toList(),
                            title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_payment_card,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: KButton(
                            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                            onPressed: () {
                              Get.to(() => AddCardPaymentView(

                                    onSuccess: () {
                                      Nav.replace(OnSuccessView(msg: Tr.get.payment_added_successfully, doubleBack: true));
                                    },
                                  ));
                            },
                            title: Tr.get.no_card,
                          ),
                        );
                      }
                    },
                  ),
                  if (field.hasError) ...[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            field.errorText?.capitalize ?? '',
                            style: const TextStyle(color: Colors.red),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              );
            },
          );
        });
  }
}

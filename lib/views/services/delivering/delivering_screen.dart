import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/widgets/web_view.dart';
import 'package:get/get.dart';

import '../../../di.dart';
import '../../../logic/delivering/delivering_map/delivering_map_bloc.dart';
import '../../../logic/delivering/delivering_map/delivering_map_state.dart';
import '../../../logic/delivering/get_delivering_order/get_delivering_order_bloc.dart';
import '../../../logic/global/addresses/addresses_bloc.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../locations/locations_screen.dart';
import '../../payment/payment_bottom_sheet.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/not_loggedin.dart';
import '../../widgets/on_error_view.dart';
import '../../widgets/on_success_view.dart';
import '../../widgets/text_field.dart';
import 'delivering_order/delivering_order_screen.dart';

class DeliveringView extends StatelessWidget {
  final String title;

  static final _formKey = GlobalKey<FormState>();

  const DeliveringView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.deliveringMapBloc,
      child: Scaffold(
        appBar: KAppBar(title: title),
        body: BgImg(
          child: KNotLoggedInView(
            child: BlocConsumer<DeliveringMapBloc, DeliveringMapState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (url) {
                    if (url.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => KWebView(
                                    url: url,
                                    onSuccess: () {
                                      debugPrint("url$url");
                                      final orderId = url.split('=').last;
                                      DeliveringMapBloc.of(context).update_order_socket(orderId: int.parse(orderId));
                                      debugPrint("url id=>${url.split('=').last}");
                                      GetDeliveringOrderBloc.of(context).getDeliveringOrders();
                                      Nav.replace(OnSuccessView(msg: Tr.get.order_success, doubleBack: true, destination: const DeliveringOrderScreen()));
                                    },
                                    onFail: () {
                                      debugPrint(url.toString());

                                      Nav.replace(OnErrorView(msg: Tr.get.error_card, doubleBack: true));
                                    },
                                  )));
                    }
                  },
                );
              },
              builder: (context, state) {
                final delivering = DeliveringMapBloc.of(context);
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: KHelper.of(context).elevatedBox.copyWith(
                                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.my_location),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: FormField<String>(
                                      validator: (String? value) {
                                        if (delivering.location == null) {
                                          return Tr.get.field_required;
                                        } else {
                                          return null;
                                        }
                                      },
                                      builder: (FormFieldState<String> state) {
                                        return Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (_) => BlocProvider(
                                                    create: (context) => Di.updateUserBloc,
                                                    child: LocationsScreen(
                                                      onChanged: (value) {
                                                        delivering.setAddressData(value, true);
                                                        AddressesBloc.of(context).onAddressSelected(value);
                                                        Nav.back();
                                                      },
                                                    ),
                                                  ),
                                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(color: state.hasError ? Colors.red : KColors.of(context).activeIcons)),
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                height: 45,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        delivering.location ?? Tr.get.your_location,
                                                        style: delivering.location == null ? KTextStyle.of(context).hint : KTextStyle.of(context).title3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (state.hasError) ...[
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Text(
                                                      state.errorText?.capitalize ?? '',
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
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: FormField<String>(
                                      validator: (val) {
                                        if (delivering.destinationLocation == null) {
                                          return Tr.get.field_required;
                                        } else {
                                          return null;
                                        }
                                      },
                                      builder: (FormFieldState<String> state) {
                                        return Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (_) => BlocProvider(
                                                    create: (context) => Di.updateUserBloc,
                                                    child: LocationsScreen(
                                                      onChanged: (value) {
                                                        delivering.setAddressData(value, false);
                                                        AddressesBloc.of(context).onAddressSelected(value);
                                                        Nav.back();
                                                      },
                                                    ),
                                                  ),
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                                  ),
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(color: state.hasError ? Colors.red : KColors.of(context).activeIcons)),
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                height: 45,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        delivering.destinationLocation ?? Tr.get.order_location,
                                                        style: delivering.location == null ? KTextStyle.of(context).hint : KTextStyle.of(context).title3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (state.hasError) ...[
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Text(
                                                      state.errorText?.capitalize ?? '',
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
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Tr.get.note, style: KTextStyle.of(context).title2),
                              const SizedBox(height: 10),
                              KTextFormField(
                                controller: delivering.noteCtrl,
                                hintText: Tr.get.write_your_note,
                                maxLines: 5,
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return Tr.get.field_required;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              const PaymentBottomSheet(),
                              const SizedBox(height: 10),
                              delivering.selectedPayment != null
                                  ? KButton(
                                      title: Tr.get.submit,
                                      onPressed: () {
                                        if (!_formKey.currentState!.validate()) {
                                          return;
                                        } else {
                                          delivering.createDeliveringOrder();
                                        }
                                      },
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

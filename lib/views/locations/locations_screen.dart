import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/models/global/location/adresses/adress_model.dart';
import '../../logic/auth/update_user/update_user_bloc.dart';
import '../../logic/auth/update_user/update_user_state.dart';
import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/global/addresses/addresses_bloc.dart';
import '../../logic/global/addresses/addresses_state.dart';
import '../../shared/localization/trans.dart';
import '../widgets/custom_button.dart';
import '../../packages/widgets/icon_button.dart';
import '../widgets/loading/loading_overlay.dart';
import 'widgets/add_address_dialog.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key, required this.onChanged}) : super(key: key);
  final Function(AddressData?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddressesBloc, AddressState>(
        listener: (context, state) {},
        builder: (context, state) {
          final address = AddressesBloc.of(context);
          return KLoadingOverlay(
            isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
            child: BlocListener<UpdateUserBloc, UpdateUserState>(
              listener: (context, state) {
                state.whenOrNull(success: () {
                  UserInfoBloc.of(context).getUserInfo();
                  Navigator.of(context).pop();
                });
              },
              child: BlocBuilder<UpdateUserBloc, UpdateUserState>(
                builder: (context, state) {
                  return KLoadingOverlay(
                    isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: RefreshIndicator(
                            onRefresh: () async {
                              await AddressesBloc.of(context).getAddress();
                            },
                            child: ListView.separated(
                                itemCount: address.addressModel?.addressData?.length ?? 0,
                                separatorBuilder: (context, i) => const SizedBox(height: 8),
                                itemBuilder: (context, i) => InkWell(
                                      onTap: () {
                                        onChanged.call(address.addressModel?.addressData![i]);
                                      },
                                      child: IgnorePointer(
                                        child: RadioListTile<AddressData>(
                                          title: Text(address.addressModel?.addressData![i].detailedAddress ?? ''),
                                          value: address.addressModel!.addressData![i],
                                          groupValue: address.addressData,
                                          onChanged: onChanged,
                                          secondary: KIconButton(
                                              child: const Icon(Icons.delete, color: Colors.red),
                                              onPressed: () {
                                                address.delete(address.addressModel?.addressData![i].id);
                                              }),
                                        ),
                                      ),
                                    )),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: KButton(
                              title: Tr.get.add_new_location,
                              onPressed: () {
                                Get.dialog(const AddLocationDialog());
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

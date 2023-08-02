import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di.dart';
import '../../../logic/global/addresses/add_address_bloc/add_address_bloc.dart';
import '../../../logic/global/addresses/add_address_bloc/add_address_state.dart';
import '../../../logic/global/addresses/addresses_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../widgets/custom_button.dart';
import '../../../packages/shared/picker/logic/location_cubit/location_state.dart';
import '../../widgets/text_field.dart';

import 'package:get/get.dart';

import '../../../../shared/theme/helper.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../packages/shared/picker/logic/location_cubit/location_cubit.dart';

class AddLocationDialog extends StatefulWidget {
  const AddLocationDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddLocationDialog> createState() => _AddLocationDialogState();
}

class _AddLocationDialogState extends State<AddLocationDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.addAddressCubit,
      child: BlocConsumer<AddAddressCubit, AddAddressState>(
        listener: (context, state) {
          state.whenOrNull(success: (model) {
            AddressesBloc.of(context).addNewLocalAddress(model);
            Navigator.pop(context);
          });
        },
        builder: (context, state) {
          final addressBloc = AddAddressCubit.of(context);
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: MediaQuery.of(context).viewInsets,
                padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
                decoration: KHelper.of(context).productElevatedBox,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 4,
                          width: 60,
                          decoration: KHelper.of(context).freeShipping,
                        ),
                        SizedBox(height: Get.height * .01),
                        Text(Tr.get.add_location),
                        SizedBox(height: Get.height * .01),
                        BlocBuilder<GetLocationCubit, GetLocationState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => CustomBtn(
                                text: Tr.get.open_map,
                                onChange: () async {
                                  GetLocationCubit.of(context).initLocation().then(
                                    (value) {
                                      value.fold(
                                        (l) => KHelper.showSnackBar(KFailure.toError(l)),
                                        (r) async {
                                          try {
                                            await AddAddressCubit.of(context).selectAddress(context);
                                          } catch (e) {
                                            KHelper.showSnackBar(Tr.get.address_is_null);
                                          }
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              loading: () => const Center(child: CircularProgressIndicator()),
                            );
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          enabled: false,
                          controller: addressBloc.detailedAddressController,
                          hintText: Tr.get.address,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.address_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          enabled: false,
                          controller: addressBloc.countryController,
                          hintText: Tr.get.country,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.country_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          enabled: false,
                          controller: addressBloc.addressStateController,
                          hintText: Tr.get.state,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.state_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          enabled: false,
                          controller: addressBloc.streetController,
                          hintText: Tr.get.street,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.street_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          enabled: false,
                          controller: addressBloc.zipcodeController,
                          hintText: Tr.get.zipcode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.zipcode_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          controller: addressBloc.buildingController,
                          hintText: Tr.get.building,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.building_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          controller: addressBloc.intercomController,
                          hintText: Tr.get.intercom,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.intercom_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        KTextFormField(
                          controller: addressBloc.floorController,
                          hintText: Tr.get.floor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.floor_validation;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        CustomBtn(
                          text: Tr.get.done,
                          onChange: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            } else {
                              debugPrint(addressBloc.addressModel?.cityId.toString());
                              addressBloc.addAddress();
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

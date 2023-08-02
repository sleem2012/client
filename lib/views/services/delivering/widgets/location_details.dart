import 'package:flutter/material.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_field.dart';
import 'package:get/get.dart';

class AddLocationDetails extends StatefulWidget {
  const AddLocationDetails({
    Key? key,
    required this.openMap,
    required this.detailedAddressController,
    required this.stateController,
    required this.streetController,
    required this.buildingController,
    required this.intercomController,
    required this.floorController,
    required this.zipcodeController,
    this.cityId,
    required this.countryController,
  }) : super(key: key);
  final TextEditingController detailedAddressController;
  final TextEditingController stateController;
  final TextEditingController streetController;
  final TextEditingController buildingController;
  final TextEditingController intercomController;
  final TextEditingController floorController;
  final TextEditingController zipcodeController;
  final TextEditingController countryController;
  final String? cityId;
  final Function() openMap;

  @override
  State<AddLocationDetails> createState() => _AddLocationDetailsState();
}

class _AddLocationDetailsState extends State<AddLocationDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: MediaQuery.of(context).viewInsets,
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
          decoration: KHelper.of(context).elevatedBox,
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
                  CustomBtn(
                    text: Tr.get.open_map,
                    onChange: widget.openMap,
                  ),
                  // if (regBloc.detailedAddressController.text.isNotEmpty)
                  StatefulBuilder(
                    builder: (context, setState) => Column(
                      children: [
                        SizedBox(height: Get.height * .01),
                      ],
                    ),
                  ),
                  KTextFormField(
                    enabled: false,
                    controller: widget.detailedAddressController,
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
                    controller: widget.countryController,
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
                    controller: widget.stateController,
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
                    controller: widget.streetController,
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
                    controller: widget.zipcodeController,
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
                    controller: widget.buildingController,
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
                    controller: widget.intercomController,
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
                    controller: widget.floorController,
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
                        Get.back();
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
  }
}

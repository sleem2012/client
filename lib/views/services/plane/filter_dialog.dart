import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/global/location/countries/countries_model.dart';
import '../../../logic/global/location/location_bloc.dart';
import '../../../logic/global/location/location_state.dart';
import '../../../packages/multi_select_dialog/index.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../widgets/custom_button.dart';
import 'package:get/get.dart';

class PlaneFilterDialog extends StatelessWidget {
  const PlaneFilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: KHelper.of(context).elevatedBox,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Get.width * .05),
            child: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MultiSelector.single<CountriesDatum>(
                    //   popupDecoration: KHelper.of(context).elevatedBox,
                    //   btnDecoration: KHelper.of(context).underLineBox,
                    //   title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null)
                    //       ? Tr.get.loading
                    //       : Tr.get.from,
                    //   items: countryList
                    //       .map(
                    //         (e) => KHelper.of(context).itemView<CountriesDatum>(
                    //           itemText: e.name?.value ?? '',
                    //           value: e,
                    //           icon: KImageWidget(
                    //             imageUrl: e.flag?.s64px ?? '',
                    //             width: 20,
                    //           ),
                    //         ),
                    //       )
                    //       .toList(),
                    //   onChanged: (value) {
                    //     if (value != null) {
                    //       LocationBloc.of(context).getCities("${value.id}");
                    //     }
                    //   },
                    //   validator: (values) {
                    //     if (values == null) {
                    //       return Tr.get.field_required;
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.swap_vert,
                      ),
                    ),
                    // MultiSelector.single<CountriesDatum>(
                    //   popupDecoration: KHelper.of(context).elevatedBox,
                    //   btnDecoration: KHelper.of(context).underLineBox,
                    //   title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null)
                    //       ? Tr.get.loading
                    //       : Tr.get.to,
                    //   items: countryList
                    //       .map(
                    //         (e) => KHelper.of(context).itemView<CountriesDatum>(
                    //           itemText: e.name?.value ?? '',
                    //           value: e,
                    //           icon: KImageWidget(
                    //             imageUrl: e.flag?.s64px ?? '',
                    //             width: 20,
                    //           ),
                    //         ),
                    //       )
                    //       .toList(),
                    //   onChanged: (value) {
                    //     if (value != null) {
                    //       // LocationBloc.of(context).getCities("${value.id}");
                    //     }
                    //   },
                    //   validator: (values) {
                    //     if (values == null) {
                    //       return Tr.get.field_required;
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    SizedBox(
                      height: Get.height * .1,
                      width: Get.width * .9,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Radio(
                              value: index == 1 ? 1 : 0,
                              groupValue: 1,
                              onChanged: (value) {},
                            ),
                            index == 1 ? Text(Tr.get.round_trip) : Text(Tr.get.onway),
                          ],
                        ),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    MultiSelector.single<CountriesDatum>(
                      popupDecoration: KHelper.of(context).elevatedBox,
                      btnDecoration: KHelper.of(context).underLineBox,
                      title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null)
                          ? Tr.get.loading
                          : Tr.get.passenger,
                      items: [],
                      onChanged: (value) {
                        if (value != null) {}
                      },
                      validator: (values) {
                        if (values == null) {
                          return Tr.get.field_required;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: Get.height * .06,
                    ),
                    // GestureDetector(
                    //   onTap: () async {
                    //     final date = await SfDatePicker.showDateTimePickerHG(
                    //       context,
                    //       type: KDateTimePickerType.dateGregorian,
                    //       start: DateTime.now(),
                    //       initial: DateTime.now(), end: DateTime(2040),
                    //     );
                    //     if (date == null) return;
                    //     dateController.text = date;
                    //   },
                    //   child: KTextFormField(
                    //     hintText: Tr.get.state,
                    //     controller: dateController,
                    //     enabled: false,
                    //
                    //
                    //   ),
                    // ),
                    CustomBtn(
                      text: Tr.get.search,
                      onChange: () {},
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di.dart';
import '../../../../packages/extensions.dart';
import '../../../../logic/products/get_pro_attrs_fields/get_pro_attrs_fields_bloc.dart';
import '../../../../logic/products/hotels_system/hotels_bloc.dart';
import '../../../../logic/products/hotels_system/hotels_state.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../filter/widgets/filter_amount_changer.dart';
import '../../../filter/widgets/filter_check_box.dart';
import '../../../filter/widgets/filter_date_picker.dart';
import '../../../filter/widgets/filter_drop_down.dart';
import '../../../filter/widgets/filter_map_picker.dart';
import '../../../filter/widgets/filter_range_slider.dart';
import '../../../filter/widgets/filter_text_field.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/date_picker.dart';
import 'package:get/get.dart';

class HotelFilter extends StatefulWidget {
  const HotelFilter({Key? key, this.hint}) : super(key: key);
  final String? hint;

  @override
  State<HotelFilter> createState() => _HotelFilterState();
}

class _HotelFilterState extends State<HotelFilter> {
  final _Key = GlobalKey<FormState>();

  Future<String?> onTap() async {
    final date = await SfDatePicker.showDateTimePickerHG(
      context,
      type: KDateTimePickerType.dateGregorian,
      start: DateTime.now(),
      initial: DateTime.now(),
      end: DateTime(DateTime.now().year + 5),
    );
    if (date == null) return null;
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.getProAttrsFieldsBloc..get(2459),
      child: BlocBuilder<HotelsBloc, HotelsState>(
        builder: (context, state) {
          final hotelsBloc = HotelsBloc.of(context);
          return Form(
            key: _Key,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: SizedBox(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(Get.width * .05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FilterTextField(
                          onChanged: (p0) {},
                          hint: 'experience',
                          prefixIcon: Icons.edit,
                        ),
                        FilterMapPicker(),
                        FilterDropDown(
                          onChanged: (p0) {},
                          title: 'Dropdown',
                          items: [],
                        ),
                        FilterCheckBox(
                          onChanged: (p0) {},
                          title: 'CheckBox',
                          items: [],
                        ),
                        FilterDateTimePicker(
                          suffixIcon: Icons.date_range,
                          hint: 'hint',
                          onChanged: (p0) {},
                        ),
                        15.h,
                        Text("My budget (SAR)", style: KTextStyle.of(context).black_grey_bold.S(1.4)),
                        10.h,
                        FilterRangeSlider(
                          values: RangeValues(0, 1000),
                          onChange: (values) {},
                        ),
                        15.h,
                        FilterAmountChanger(
                          title: 'count',
                          count: 0,
                          onChanged: (p0) {},
                        ),
                        20.h,
                        CustomBtn(
                          text: Tr.get.search,
                          onChange: () {
                            if (_Key.currentState!.validate()) {
                              hotelsBloc.getHotelsProducts(hotelsBloc.catId ?? -1, false, mainAttr: GetProAttrsFieldsBloc.of(context).attrValues);
                            }
                          },
                        )
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

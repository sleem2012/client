import 'package:flutter/material.dart';
import '../../../packages/extensions.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';

import '../../../shared/localization/trans.dart';
import '../../../views/widgets/date_picker.dart';
import '../../../views/widgets/text_field.dart';

class FilterDateTimePicker extends StatefulWidget {
  const FilterDateTimePicker({
    Key? key,
    required this.onChanged,
    this.error,
    this.hint,
    this.suffixIcon,
    this.type,
  }) : super(key: key);
  final Function(String?) onChanged;
  final String? error;
  final String? hint;
  final IconData? suffixIcon;
  final KDateTimePickerType? type;

  @override
  State<FilterDateTimePicker> createState() => _FilterDateTimePickerState();
}

class _FilterDateTimePickerState extends State<FilterDateTimePicker> {
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final date = await SfDatePicker.showDateTimePickerHG(
                context,
                type: widget.type ?? KDateTimePickerType.dateGregorian,
                start: DateTime.now().add(const Duration(hours: 6)),
                initial: DateTime.now().add(const Duration(hours: 6)),
                end: DateTime(2100, 1),
              );
              if (date == null) return;
              dateController.text = date;
              widget.onChanged(date);
            },
            child: KTextFormField(
              hintText: widget.hint,
              hintStyle: KTextStyle.of(context).black_grey.S(1.5),
              controller: dateController,
              enabled: false,
              errorText: widget.error,
              prefixIcon: Icon(widget.suffixIcon,color: KColors.of(context).accentColor,),
              suffixIcon: Icon(Icons.arrow_drop_down,color: KColors.of(context).accentColor,),
              boxDecoration: KHelper.of(context).underLineBox,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return Tr.get.field_required;
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}

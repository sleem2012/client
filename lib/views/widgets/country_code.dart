import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';

class CountryCodeWidget extends StatelessWidget {
  final void Function(CountryCode?)? onChanged, onInit;
  const CountryCodeWidget({Key? key, this.onChanged, this.onInit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      showFlag: false,
      barrierColor: Colors.black38,
      textStyle: KTextStyle.of(context).body2,
      dialogTextStyle: KTextStyle.of(context).body,
      initialSelection: 'SA',
      showFlagDialog: true,
      closeIcon: Icon(Icons.close, color: KColors.of(context).activeIcons),
      dialogBackgroundColor: KColors.of(context).background,
      comparator: (a, b) => b.name!.compareTo(a.name!),

      onInit: onInit,
    );
  }
}

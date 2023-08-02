import 'package:flutter/material.dart';
import '../../../packages/extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/text_field.dart';

class FilterTextField extends StatelessWidget {
  const FilterTextField({Key? key, required this.onChanged, this.error, this.hint, this.kController, this.prefixIcon}) : super(key: key);
  final Function(String?) onChanged;
  final String? error;
  final String? hint;
  final IconData? prefixIcon;
  final TextEditingController? kController;

  @override
  Widget build(BuildContext context) {
    return KTextFormField(
      hintText: hint,
      hintStyle: KTextStyle.of(context).black_grey.S(1.5),
      controller: kController,
      errorText: error,
      prefixIcon: Icon(
        prefixIcon,
        color: KColors.of(context).accentColor,
      ),
      onChanged: onChanged,
      boxDecoration: KHelper.of(context).underLineBox,
      validator: (p0) {
        if (p0!.isEmpty) {
          return Tr.get.field_required;
        }
        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../widgets/text_field.dart';

class KSearchBar extends StatelessWidget {
  const KSearchBar({Key? key, this.onSearch, this.kController, this.enabled = true, this.prefixIcon, this.readOnly, this.color, this.hintText, this.onFilter})
      : super(key: key);
  final void Function(String)? onSearch;
  final void Function()? onFilter;
  final bool enabled;
  final bool? readOnly;
  final Color? color;
  final String? hintText;
  final TextEditingController? kController;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: KTextFormField(
              // fillColor: KColors.of(context).searchFillColor,
              hintText: hintText ?? Tr.get.search,
              onChanged: onSearch,
              controller: kController,
              textInputAction: TextInputAction.search,
              enabled: enabled,
              readOnly: readOnly,
              suffixIcon: prefixIcon,
              fillColor: color,
              prefixIcon: Icon(KHelper.search, color: KColors.of(context).accentColor),
            ),
          ),
          IconButton(
            onPressed: onFilter,
            icon: Icon(Icons.filter_alt),
          )
        ],
      ),
    );
  }
}

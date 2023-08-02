import 'package:flutter/material.dart';
import '../../../packages/extensions.dart';
import '../../../packages/multi_select_dialog/index.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

class FilterDropDown<T> extends StatelessWidget {
  const FilterDropDown({Key? key, required this.onChanged, required this.title, this.error, required this.items}) : super(key: key);
  final Function(T?) onChanged;
  final String title;
  final List<MultiSelectorItem<T>> items;

  final String? error;
  @override
  Widget build(BuildContext context) {


    return MultiSelector.single<T>(
      items: items,
      title: title,
      showArrow: true,

      onChanged: onChanged,
      type: SelectorViewType.sheet,
      popupDecoration: KHelper.of(context).elevatedBox,
      btnDecoration: KHelper.of(context).underLineBox,
            errorDecoration: KHelper.of(context).underLineBoxError,

      titleStyle: KTextStyle.of(context).black_grey.S(1.4),
      error: error,
      validator: (p0) {
        if (p0 == null ) {
          return Tr.get.field_required;
        } else {
          return null;
        }
      },
    );
  }
}

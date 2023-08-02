import 'package:flutter/material.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../packages/widgets/image_widget.dart';
import '../product_details_entity.dart';

// class MainSelectionList extends StatefulWidget {
//   const MainSelectionList({Key? key}) : super(key: key);
//
//   @override
//   State<MainSelectionList> createState() => _MainSelectionListState();
// }
//
// class _MainSelectionListState extends State<MainSelectionList> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocSelector<DetailsCubit, DetailsState, ProductSelectable?>(
//       selector: (state) => DetailsCubit.of(context).selectedMain,
//       builder: (context, state) {
//         final data = DetailsCubit.of(context);
//         return SelectionWrap(
//           data: data.getMainSelection,
//           onSelect: data.onMainSelect, selectedItem: data.selectedMain,
//         );
//       },
//     );
//   }
// }

class SelectionWrap extends StatelessWidget {
  const SelectionWrap({
    super.key,
    required this.data,
    required this.onSelect,
    required this.selectedItem,
  });

  final List<ProductSelectable> data;
  final Function(ProductSelectable) onSelect;
  final ProductSelectable? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children: data.map(
        (e) {
          final item = e;
          return InkWell(
            onTap: () {
              debugPrint('================= ${item.img} : ');

              onSelect.call(item);
            },
            child: e.img != null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(KHelper.btnRadius),
                      color: Colors.transparent,
                      border: Border.all(
                        color: selectedItem == item ? KColors.of(context).accentColor : Colors.transparent,
                        width:  3 ,
                      ),
                      boxShadow: [
                        BoxShadow(blurRadius: 5, spreadRadius: 1, color: Colors.black12, offset: Offset(0, 3)),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(KHelper.btnRadius - 3),
                      child: KImageWidget(
                        imageUrl: item.img!,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: selectedItem == item ? KColors.of(context).accentColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: KColors.of(context).accentColor, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                      child: Text(
                        (item.title ?? ''),
                        maxLines: 1,
                        style: KTextStyle.of(context).boldTitle1.copyWith(color: selectedItem == item ? Colors.white : KColors.of(context).accentColor),
                      ),
                    ),
                  ),
          );
        },
      ).toList(),
    );
  }
}

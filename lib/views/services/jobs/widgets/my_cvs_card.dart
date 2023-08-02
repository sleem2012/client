import 'package:flutter/material.dart';
import '../../../../data/models/jobs/my_cv_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../../packages/widgets/icon_button.dart';

class MyCvsCard extends StatefulWidget {
  const MyCvsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.onPressed,
    this.onDelete,
  }) : super(key: key);
  final String title;
  final CvData? value;
  final CvData? groupValue;
  final void Function(CvData?)? onChanged;
  final void Function()? onPressed;
  final void Function()? onDelete;

  @override
  State<MyCvsCard> createState() => _MyCvsCardState();
}

class _MyCvsCardState extends State<MyCvsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: KHelper.of(context).elevatedBox,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: StatefulBuilder(builder: (thisLowerContext, innerSetState) {
              return RadioListTile<CvData>(
                toggleable: true,
                value: widget.value!,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  widget.onChanged!(value);
                },
                title: Text(widget.title),
                activeColor: KColors.of(context).accentColor,
              );
            })),
            SizedBox(
              width: 70,
              height: 20,
              child: RawMaterialButton(
                onPressed: () {
                  widget.onPressed!();
                },
                fillColor: KColors.of(context).freeShiping,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text(
                  Tr.get.view,
                  style: KTextStyle.of(context).editBTN,
                ),
              ),
            ),
            KIconButton(
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                widget.onDelete!();
              },
            )
          ],
        ));
  }
}

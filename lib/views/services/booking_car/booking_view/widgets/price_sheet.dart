import 'package:flutter/material.dart';
import '../../../../../shared/localization/trans.dart';
import '../../../../../shared/theme/colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/text_field.dart';
import 'package:get/get.dart';

class PriceSheet extends StatefulWidget {
  const PriceSheet({Key? key, this.isPrice = false, required this.price}) : super(key: key);
  final bool isPrice;
  final String price;
  @override
  State<PriceSheet> createState() => _PriceSheetState();
}

class _PriceSheetState extends State<PriceSheet> {
  // late FocusNode focusNode;
  TextEditingController priceCtrl = TextEditingController();


  @override
  void initState() {
    priceCtrl.text = widget.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KTextFormField(
              controller: priceCtrl,
              // focusNode: focusNode,
              textAlign: widget.isPrice ? TextAlign.center : TextAlign.start ,
              hintText: '',
              maxLines: widget.isPrice ? 1 : 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: KColors.of(context).accentColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KButton(
                    title: Tr.get.close,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    width: Get.width / 4),
                KButton(
                    title: Tr.get.done,
                    onPressed: () {
                      Navigator.of(context).pop(priceCtrl.text);
                    },
                    width: Get.width / 4),
              ],
            )
          ],
        ),
      ),
    );
  }
}

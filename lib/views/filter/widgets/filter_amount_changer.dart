import 'package:flutter/material.dart';
import '../../../packages/extensions.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/amount_changer.dart';

class FilterAmountChanger extends StatefulWidget {
  FilterAmountChanger({Key? key, required this.title, required this.count, this.onChanged}) : super(key: key);
  final String title;
  final int count;
  final Function(int)? onChanged;
  @override
  State<FilterAmountChanger> createState() => _TextWithAmountState();
}

class _TextWithAmountState extends State<FilterAmountChanger> {
  int _count = 0;

  @override
  void initState() {
    _count = widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title.capitalized, style: KTextStyle.of(context).black_grey.S(1.4)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AmountBtn(
              iconData: Icons.remove,
              onTap: () {
                setState(() => _count--);
                widget.onChanged?.call(_count);
              },
            ),
            const SizedBox(width: 10),
            FittedBox(child: Text('${_count}')),
            const SizedBox(width: 10),
            AmountBtn(
              iconData: Icons.add,
              onTap: () {
                setState(() => _count++);
                widget.onChanged?.call(_count);
              },
            ),
          ],
        ),
      ],
    );
  }
}

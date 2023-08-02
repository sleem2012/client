import 'package:flutter/material.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';

class JobRequirement extends StatelessWidget {
  const JobRequirement({Key? key, required this.title, required this.content}) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
          child: Text(
            title,
            style: KTextStyle.of(context).title2.copyWith(fontSize: 11),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: KHelper.of(context).elevatedBox,
                padding: const EdgeInsets.all(15),
                child: Text(content),
              ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
          child: Text(
            Tr.get.job_description,
            style: KTextStyle.of(context).title2.copyWith(fontSize: 11),
          ),
        ),
        Container(
          decoration: KHelper.of(context).elevatedBox,
          padding: const EdgeInsets.all(15),
          child: const Expanded(
            child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
          ),
        )
      ],
    );
  }
}

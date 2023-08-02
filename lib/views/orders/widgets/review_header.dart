import 'package:flutter/material.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: KHelper.of(context).elevatedBox,
      child: Column(
        children: [
          Center(
            child: Text(
              Tr.get.how_would_you_rate_this_product,
              style: KTextStyle.of(context).names.copyWith(fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(dummyNetLogo, fit: BoxFit.cover, width: 150, height: 150),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Shiny PU Leather Small Handbag',
            style: TextStyle(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

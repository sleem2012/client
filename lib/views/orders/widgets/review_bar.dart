import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';

class ReviewBar extends StatelessWidget {
  const ReviewBar({Key? key, required this.onRatingUpdate}) : super(key: key);
  final void Function(double reting) onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: KHelper.of(context).elevatedBox,
      child: Column(children: [
        Column(
          children: [
            Center(
              child: Text(
                Tr.get.tap_the_star_for_rating,
                style: KTextStyle.of(context).names.copyWith(fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RatingBar.builder(
              initialRating: 0,
              allowHalfRating: true,
              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
              onRatingUpdate: onRatingUpdate,
              itemSize: 50,
            ),
          ],
        ),
      ]),
    );
  }
}

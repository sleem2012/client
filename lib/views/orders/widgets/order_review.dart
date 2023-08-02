import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'review_header.dart';
import '../../widgets/appbar.dart';

class OrderReview extends StatelessWidget {
  const OrderReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  KAppBar(title: Tr.get.rate_review),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ReviewHeader(),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: KHelper.of(context).elevatedBox,
              child: Column(children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        Tr.get.how_would_you_rate_this_product,
                        style: KTextStyle.of(context).names.copyWith(fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      allowHalfRating: true,
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                      onRatingUpdate: (rating) {},
                      itemSize: 50,
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

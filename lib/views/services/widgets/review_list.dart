import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../data/models/reviews/reviews_model.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key, required this.data}) : super(key: key);
  final List<ReviewData> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 1.7,
      child: ListView.separated(
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) => Container(
                padding: const EdgeInsets.all(20),
                decoration: KHelper.of(context).elevatedBox,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              backgroundImage: CachedNetworkImageProvider(data[i].user?.image?.s128px ?? '', maxHeight: Get.height.toInt()),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[i].user?.name ?? '',
                                  style: KTextStyle.of(context).title2.copyWith(fontSize: 11),
                                ),
                                RatingBar.builder(
                                  initialRating: data[i].rate?.toDouble() ?? 0,
                                  allowHalfRating: true,
                                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                                  onRatingUpdate: (rating) {},
                                  ignoreGestures: true,
                                  itemSize: 15,
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          data[i].createdAt ?? '',
                          style: KTextStyle.of(context).title2.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[i].comment ?? '',
                          style: const TextStyle(fontSize: 10),
                        ),
                        // Text(
                        //   'prefect Quality',
                        //   style: TextStyle(fontSize: 10),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
          separatorBuilder: (context, i) => const SizedBox(
                height: 10,
              ),
          itemCount: data.length),
    );
  }
}

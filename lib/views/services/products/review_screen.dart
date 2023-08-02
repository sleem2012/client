import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../di.dart';
import '../../../logic/reviews/reviews_bloc.dart';
import '../../../logic/reviews/reviews_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../widgets/raview_header.dart';
import '../widgets/review_list.dart';
import '../widgets/review_text_field.dart';
import '../../widgets/appbar.dart';
import '../../widgets/error/error_widget.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/not_loggedin.dart';

class ReviewsScreen extends StatelessWidget {
  final int id;

  const ReviewsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.reviewsBloc..get(id),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: KAppBar(
          title: Tr.get.reviews,
        ),
        body: BlocConsumer<ReviewsBloc, ReviewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.when(
              loading: () => const KLoadingOverlay(isLoading: true),
              success: (model) => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if ((model.data ?? []).isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(KHelper.hPadding),
                        child: Row(
                          children: [
                            Container(
                              height: 93,
                              width: 93,
                              decoration: BoxDecoration(
                                color: KColors.of(context).activeIcons,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${model.average?.avg}',
                                    style: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.black),
                                  ),
                                  RatingBar.builder(
                                    initialRating: model.average?.avg ?? 0,
                                    allowHalfRating: true,
                                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                                    onRatingUpdate: (rating) {},
                                    ignoreGestures: true,
                                    itemSize: 15,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  ReviewBar(value: ((model.average?.i5 ?? 0) / (model.pagination?.meta?.total ?? 1)), rate: '5'),
                                  const SizedBox(height: 10),
                                  ReviewBar(value: (model.average?.i4 ?? 1) / (model.pagination?.meta?.total ?? 1).toDouble(), rate: '4'),
                                  const SizedBox(height: 10),
                                  ReviewBar(value: (model.average?.i3 ?? 1) / (model.pagination?.meta?.total ?? 1).toDouble(), rate: '3'),
                                  const SizedBox(height: 10),
                                  ReviewBar(value: (model.average?.i2 ?? 1) / (model.pagination?.meta?.total ?? 1).toDouble(), rate: '2'),
                                  const SizedBox(height: 10),
                                  ReviewBar(value: (model.average?.i1 ?? 1) / (model.pagination?.meta?.total ?? 1).toDouble(), rate: '1'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Center(child: Text(Tr.get.no_reviews_yet)),
                    ReviewList(data: model.data ?? []),
                    KNotLoggedInWidget(
                        child: ReviewWidget(
                      id: id,
                    )),
                  ],
                ),
              ),
              error: (error) => KErrorWidget(
                error: state.whenOrNull(error: (error) => error),
                isError: true,
                onTryAgain: () {
                  ReviewsBloc.of(context).get(id);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

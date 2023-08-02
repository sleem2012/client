import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/orders/get_orders/get_orders_bloc.dart';
import '../../logic/orders/review_order/review_order_bloc.dart';
import '../../logic/orders/review_order/review_order_state.dart';
import '../../shared/localization/trans.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/on_success_view.dart';
import '../widgets/slugs_drop_down.dart';
import 'widgets/review_bar.dart';
import 'widgets/review_comment.dart';

class OrderReview extends StatelessWidget {
  const OrderReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.reviewOrderBloc,
      child: Scaffold(
        appBar: KAppBar(title: Tr.get.rate_review),
        body: BgImg(
          child: BlocConsumer<ReviewOrderBloc, ReviewOrderState>(
            listener: (context, state) {
              state.whenOrNull(
                  success: () => Nav
                    .to(OnSuccessView(
                      msg: Tr.get.rate_success,
                      doubleBack: true
                    )));
            },
            builder: (context, state) {
              final review = ReviewOrderBloc.of(context);
              return KLoadingOverlay(
                isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KSlugDropdown(
                              hint: Tr.get.review_type,
                              items: KSlugModel.reviewType,
                              value: review.reviewType?.slug,
                              onChanged: review.selectType,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        ReviewBar(
                          onRatingUpdate: (rate) {
                            ReviewOrderBloc.of(context).rate(rate.toInt());
                          },
                        ),
                        const SizedBox(height: 10),
                        const ReviewComment(),
                        const SizedBox(
                          height: 20,
                        ),
                        KButton(
                            title: Tr.get.submit_review,
                            onPressed: () {
                              review.addReview(GetOrderBloc.of(context).selectedOrderData!.id!);
                            })
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

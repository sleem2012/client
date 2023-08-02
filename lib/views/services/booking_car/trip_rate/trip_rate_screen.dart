import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di.dart';
import '../../../../logic/in_drive/rate_trip/rate_trip_cubit.dart';
import '../../../../logic/in_drive/rate_trip/rate_trip_state.dart';
import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../orders/widgets/review_bar.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/loading/loading_overlay.dart';
import '../../../widgets/on_success_view.dart';
import '../../../widgets/text_field.dart';

class TripRateScreen extends StatelessWidget {
  const TripRateScreen({Key? key, required this.orderId}) : super(key: key);
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.rateTripCubit,
      child: Scaffold(
        appBar: KAppBar(title: Tr.get.rate_trip),
        body: BlocConsumer<RateTripCubit, RateTripState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () => Nav.to(
                OnSuccessView(msg: Tr.get.rate_success, doubleBack: true),
              ),
            );
          },
          builder: (context, state) {
            final rate = RateTripCubit.of(context);
            return KLoadingOverlay(
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ReviewBar(
                      onRatingUpdate: (double ratting) {
                        rate.rate(ratting.toInt());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(Tr.get.what_did_you_like_the_most_about_it, style: KTextStyle.of(context).names.copyWith(fontSize: 13)),
                    const SizedBox(
                      height: 40,
                    ),
                    KTextFormField(
                      controller: rate.noteCtrl,
                      maxLines: 6,
                      hintText: Tr.get.write_a_review,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: KButton(
                          title: Tr.get.submit_review,
                          onPressed: () {
                            rate.addReview(orderId);
                          }),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

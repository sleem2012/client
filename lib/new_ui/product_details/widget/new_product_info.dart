import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../packages/extensions.dart';
import '../../../logic/favourite/favorite_bloc.dart';
import '../../../logic/favourite/favourite_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/services/products/review_screen.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../views/widgets/not_loggedin.dart';
import '../logic/details_cubit.dart';

class NewProductInfo extends StatelessWidget {
  const NewProductInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = DetailsCubit.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(details.name.capitalized, style: KTextStyle.of(context).boldTitle1),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Nav.to(ReviewsScreen(id: details.id));
                },
                child: BlocSelector<DetailsCubit, DetailsState, double>(
                  selector: (state) {
                    return details.rate;
                  },
                  builder: (context, state) {
                    return IgnorePointer(
                      child: RatingBar.builder(
                        unratedColor: KColors.of(context).accentColor.withOpacity(.5),
                        initialRating: (state).toDouble(),
                        allowHalfRating: true,
                        itemBuilder: (context, _) => Icon(Icons.star, color: KColors.of(context).trackColor),
                        onRatingUpdate: (rating) {},
                        itemSize: 15,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Text('(${details.reviews})', style: KTextStyle.of(context).hint),
              const Spacer(),
              Row(
                children: [
                  // CircleAvatar(
                  //     radius: 15,
                  //     backgroundColor: KColors.of(context).activeIcons,
                  //     child: KIconButton(
                  //       onPressed: () {},
                  //       child: const Icon(
                  //         Icons.ios_share,
                  //         color: Colors.white,
                  //         size: 20,
                  //       ),
                  //     )),
                  const SizedBox(
                    width: 10,
                  ),
                  KNotLoggedInWidget(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: KColors.of(context).activeIcons,
                      child: BlocBuilder<FavoriteBloc, FavoriteState>(
                        builder: (context, state) {
                          return KIconButton(
                            onPressed: () {
                              FavoriteBloc.of(context).add(details.proSystem?.id, details.proSystem);
                            },
                            child: Icon(FavoriteBloc.of(context).isFav(details.proSystem?.id ?? -1) ? Icons.favorite : Icons.favorite_border, color: Colors.white, size: 20),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),

          /// Row(
          ///   children: [
          ///     BlocSelector<DetailsCubit, DetailsState, String>(
          ///       selector: (state) => details.price,
          ///       builder: (context, state) {
          ///         return PriceWidget(price: details.price, currency: details.currency);
          ///       },
          ///     ),
          ///     // Text(details.price ?? '',
          ///     //     style: KTextStyle.of(context).title3),
          ///     const SizedBox(width: 10),
          ///     // if (details.selectedProductMenu?.has_offer ?? false)
          ///     BlocSelector<DetailsCubit, DetailsState, String>(
          ///       selector: (state) => details.discount,
          ///       builder: (context, state) {
          ///         return Text(details.discount, style: KTextStyle.of(context).lineThrough.copyWith(decoration: TextDecoration.lineThrough));
          ///       },
          ///     ),
          ///     const SizedBox(width: 10),
          ///     // Text(details.sale ?? '',
          ///     //     style: const TextStyle(color: Colors.red)),
          ///   ],
          /// )
        ],
      ),
    );
  }
}

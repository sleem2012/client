import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../di.dart';
import '../../../../../shared/theme/colors.dart';
import '../../../../../shared/theme/text_theme.dart';
import '../../../../map/logic/map_search_bloc/map_search_bloc.dart';
import '../../../../map/logic/model/search_results_model.dart';
import '../../../../map/logic/place_details_bloc/place_details_bloc.dart';
import '../../../../map/logic/place_details_bloc/place_details_state.dart';

class PlaceTile extends StatelessWidget {
  final Predictions data;
  final Function goTonPlace;
  final Function setSelectedPosition;
  final Function getDetailedAddress;
  const PlaceTile({Key? key, required this.data, required this.goTonPlace, required this.setSelectedPosition, required this.getDetailedAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = data.description?.replaceAll(data.description!.split(',')[0], '');
    return BlocProvider(
      create: (context) => Di.placeDetailsBloc,
      child: BlocConsumer<PlaceDetailsBloc, PlaceDetailsState>(
        listener: (context, state) {
          state.whenOrNull(success: (model) {
            goTonPlace(model);
            setSelectedPosition(model);
            getDetailedAddress(model);

            MapSearchBloc.of(context).controller.close();
            Navigator.of(context).pop(MapSearchBloc.of(context).controller.query);
          });
        },
        builder: (context, state) {
          PlaceDetailsBloc details = PlaceDetailsBloc.of(context);
          return InkWell(
            onTap: () async {
              await details.getPlaceDetails(data.placeId!);
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsetsDirectional.all(8),
              padding: const EdgeInsetsDirectional.all(4),
              decoration: BoxDecoration(color: KColors.of(context).elevatedBox, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue),
                      child: const Icon(
                        Icons.place,
                        color: Colors.blue,
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${data.description?.split(',')[0]}\n',
                            style: KTextStyle.of(context).title2,
                          ),
                          TextSpan(
                            text: subTitle,
                            style: KTextStyle.of(context).title3,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

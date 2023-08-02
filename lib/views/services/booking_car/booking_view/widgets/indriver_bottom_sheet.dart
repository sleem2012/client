import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../di.dart';
import '../../../../../logic/in_drive/find_driver/find_driver_cubit.dart';
import '../../../../../logic/in_drive/find_driver/find_driver_state.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../shared/localization/trans.dart';
import '../../../../../shared/theme/colors.dart';
import '../../../../../shared/theme/helper.dart';
import '../../../../map/logic/map_cubit/map_bloc.dart';
import 'in_driver_bottom_tile.dart';
import 'destinations_list.dart';
import 'price_sheet.dart';
import '../../location_search/location_search_screen.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../logic/in_drive/in_drive_bloc.dart';
import '../../../../../logic/in_drive/in_drive_state.dart';

class InDriverBottomSheet extends StatelessWidget {
  const InDriverBottomSheet({Key? key, required this.height, required this.onTap}) : super(key: key);
  final double height;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.inDriveBloc),
      ],
      child: BlocBuilder<FindDriverBloc, FindDriverState>(
        builder: (context, state) {
          final findDriver = FindDriverBloc.of(context);
          return KLoadingOverlay(
            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
            child: BlocBuilder<CalculateInDriveBloc, InDriveState>(
              builder: (context, state) {
                final calculate = CalculateInDriveBloc.of(context);
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                      color: KColors.of(context).elevatedBox,
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet<String>(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (_) => LocationSearchScreen(
                                        onStop: MapBloc.of(context).controlWhenStop,
                                        onMove: MapBloc.of(context).controlWhenMove,
                                        address: MapBloc.of(context).detailedAddress,
                                        goTonPlace: (model) {
                                          MapBloc.of(context).goToSelectedPlace(
                                            model?.result?.geometry?.location?.lat ?? 0,
                                            model?.result?.geometry?.location?.lng ?? 0,
                                          );
                                          MapBloc.of(context).erase();
                                        },
                                        setSelectedPosition: (model) {
                                          MapBloc.of(context).setSelectedPosition(
                                            LatLng(
                                              model?.result?.geometry?.location?.lat ?? 0,
                                              model?.result?.geometry?.location?.lng ?? 0,
                                            ),
                                          );
                                        },
                                        getDetailedAddress: (model) {
                                          MapBloc.of(context).getDetailedAddress(
                                            LatLng(
                                              model?.result?.geometry?.location?.lat ?? 0,
                                              model?.result?.geometry?.location?.lng ?? 0,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: InDriverBottomTile(
                                    location: MapBloc.of(context).detailedAddress,
                                    placeHolder: Tr.get.pickup_location,
                                    point: 'A',
                                    color: Colors.grey,
                                    isDestination: false,
                                    destinations: const [],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () async {
                                    if (MapBloc.of(context).destinations.isEmpty) {
                                      await showModalBottomSheet<String>(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (_) => LocationSearchScreen(
                                          address: MapBloc.of(context).destinationDetailedAddress,
                                          goTonPlace: (model) {},
                                          setSelectedPosition: (model) {
                                            MapBloc.of(context).setSelectedDestinationPosition(
                                              LatLng(model?.result?.geometry?.location?.lat ?? 0, model?.result?.geometry?.location?.lng ?? 0),
                                            );
                                          },
                                          getDetailedAddress: (model) {
                                            MapBloc.of(context).getDestinationDetailedAddress(
                                                LatLng(model?.result?.geometry?.location?.lat ?? 0, model?.result?.geometry?.location?.lng ?? 0));
                                          },
                                        ),
                                      );
                                    } else {
                                      showModalBottomSheet(
                                        backgroundColor: KColors.of(context).elevatedBox,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (_) => Container(
                                          decoration: KHelper.of(context).elevatedBox,
                                          height: Get.height / 3,
                                          child: BlocProvider.value(
                                            value: MapBloc.of(context),
                                            child: DestinationsList(reset: () {
                                              calculate.reset();
                                              Nav.back();
                                            }),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: InDriverBottomTile(
                                    location: MapBloc.of(context).destinationDetailedAddress,
                                    placeHolder: Tr.get.destination,
                                    point: 'B',
                                    destinations: MapBloc.of(context).destinations,
                                    color: Colors.green,
                                    isDestination: true,
                                    onPlusTapped: () async {
                                      await showModalBottomSheet<String>(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (_) => LocationSearchScreen(
                                          address: MapBloc.of(context).destinationDetailedAddress,
                                          goTonPlace: (model) {},
                                          setSelectedPosition: (model) {
                                            MapBloc.of(context).setSelectedDestinationPosition(
                                                LatLng(model?.result?.geometry?.location?.lat ?? 0, model?.result?.geometry?.location?.lng ?? 0));
                                          },
                                          getDetailedAddress: (model) {
                                            MapBloc.of(context).getDestinationDetailedAddress(
                                                LatLng(model?.result?.geometry?.location?.lat ?? 0, model?.result?.geometry?.location?.lng ?? 0));
                                            calculate.reset();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (state is! InDriveStateSuccess)
                                  SizedBox(
                                    child: KButton(
                                      title: Tr.get.get_fare,
                                      onPressed: () {
                                        debugPrint(MapBloc.of(context).destinations.length.toString());
                                        debugPrint(MapBloc.of(context).allLocations.length.toString());
                                        // return;
                                        calculate.calculate(MapBloc.of(context).allLocations);
                                      },
                                    ),
                                  ),
                                if (state is InDriveStateSuccess) ...[
                                  InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet<String>(
                                        backgroundColor: KColors.of(context).elevatedBox,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (_) =>
                                            SizedBox(child: PriceSheet(isPrice: true, price: MapBloc.of(context).price ?? state.cost.split(' ').first)),
                                      ).then(
                                        (value) {
                                          MapBloc.of(context).setPrice(value!);
                                          return null;
                                        },
                                      );
                                    },
                                    child: InDriverBottomTile(
                                        location: MapBloc.of(context).price ?? state.cost,
                                        placeHolder: Tr.get.offer_your_fare,
                                        point: 'SAR',
                                        color: KColors.of(context).accentColor,
                                        isDestination: false,
                                        destinations: const []),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet<String>(
                                        backgroundColor: KColors.of(context).elevatedBox,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => const SizedBox(child: PriceSheet(isPrice: false, price: '')),
                                      ).then(
                                        (value) {
                                          if (value != null) {
                                            MapBloc.of(context).setNote(value);
                                          }
                                          return null;
                                        },
                                      );
                                    },
                                    child: InDriverBottomTile(
                                        location: MapBloc.of(context).note,
                                        placeHolder: Tr.get.comment_and_wishes,
                                        point: 'C',
                                        color: KColors.of(context).accentColor,
                                        isDestination: false,
                                        destinations: const []),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    child: KButton(
                                      title: Tr.get.find_a_driver,
                                      onPressed: () {
                                        findDriver.findDriver(
                                            data: MapBloc.of(context).allLocations,
                                            Fare: double.tryParse(MapBloc.of(context).price ?? '') ?? double.tryParse(state.cost.split(' ').first) ?? 0);
                                      },
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

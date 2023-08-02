import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/in_drive/trip_model.dart';
import '../../../di.dart';
import '../../../logic/in_drive/find_driver/find_driver_cubit.dart';
import '../../../logic/in_drive/find_driver/find_driver_state.dart';
import '../../../logic/in_drive/update_trip/update_trip_cubit.dart';
import '../../../logic/in_drive/update_trip/update_trip_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../map/logic/map_cubit/map_bloc.dart';
import '../../map/logic/map_cubit/map_state.dart';
import 'booking_view/indriver_screen.dart';
import '../../widgets/action_dialog.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../widgets/slugs_drop_down.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';
import 'booking_view/widgets/indriver_cases.dart';

class RequestDetailsScreen extends StatefulWidget {
  const RequestDetailsScreen({Key? key, required this.model}) : super(key: key);
  final TripModelData model;

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Di.mapBloc
        ..getDirections(
          LatLng(double.parse(widget.model.tripRoads?.first.latitude ?? "0.0"), double.parse(widget.model.tripRoads?.first.longitude ?? "0.0")),
          LatLng(double.parse(widget.model.tripRoads?.last.latitude ?? "0.0"), double.parse(widget.model.tripRoads?.last.longitude ?? "0.0")),
        ),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          final driverInfo = widget.model.driverId;
          final plate = driverInfo?.rider?.commercial?.vehicle?.plate;
          final map = MapBloc.of(context);
          return Scaffold(
              body: Stack(
            alignment: Alignment.topCenter,
            children: [
              GoogleMap(
                polylines: map.polylinePoints,
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) async {
                  map.mapController.complete(controller);
                },
                initialCameraPosition: map.cameraPosition(),
                markers: map.markers.toSet(),
              ),
              BlocBuilder<FindDriverBloc, FindDriverState>(
                buildWhen: (previous, current) {
                  return current.maybeWhen(orElse: () => false, socketValue: (model) => true);
                },
                builder: (context, state) {
                  final model = FindDriverBloc.of(context);

                  return Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: KHelper.of(context).elevatedBox,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InDriverStateCases(data: model.selectedTripData ?? widget.model),
                                SizedBox(width: Get.width * .1),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: KColors.of(context).accentColor, width: 2), borderRadius: BorderRadius.circular(4)),
                                    child: Text('${plate?.right} ${plate?.middle} ${plate?.left} ${plate?.number}')),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: CachedNetworkImageProvider(
                                            widget.model.driverId?.image?.s64px ?? dummyNetLogo,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(driverInfo?.rider?.commercial?.vehicle?.model ?? '', style: KTextStyle.of(context).title2),
                                            const SizedBox(height: 8),
                                            Text(widget.model.driverId?.name ?? '', style: KTextStyle.of(context).title2),
                                            const SizedBox(height: 8),
                                            // Row(
                                            //   children: const [
                                            //     Icon(Icons.star_rate, color: Colors.yellowAccent),
                                            //     Text('4.5', style: TextStyle(color: Colors.grey)),
                                            //     Text('(1881)', style: TextStyle(color: Colors.grey)),
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        KChatIconButton(roomType: ChatRoomType.bookTrip, order_chat_type: 'driver', room_type_id: widget.model.id),
                                        const SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () async {
                                            await launchUrlString('${Tr.get.tel}:${widget.model.driverId?.mobile}');
                                          },
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: KColors.of(context).activeIcons,
                                            child: const Icon(Icons.phone, color: Colors.white, size: 20),
                                          ),
                                        ),
                                        BlocListener<UpdateTripCubit, UpdateTripState>(
                                          listener: (context, state) {
                                            state.whenOrNull(
                                              success: (m) {
                                                if (m.state == KSlugModel.canceled) {
                                                  return Nav.replace(const BookACarView());
                                                }
                                              },
                                            );
                                          },
                                          child: KIconButton(
                                            child: const Icon(Icons.cancel, size: 25, color: Colors.red),
                                            onPressed: () {
                                              ActionDialog(
                                                title: Tr.get.cancel_request,
                                                approveAction: Tr.get.yes_message,
                                                cancelAction: Tr.get.no_message,
                                                onApproveClick: () {
                                                  Navigator.pop(context);
                                                  UpdateTripCubit.of(context).updateTrip(
                                                      id: widget.model.id,
                                                      State: KSlugModel.canceled,
                                                      // cost:double.tryParse(widget.model.fare?.split(' ').first??'').toString() ,
                                                      context: context);
                                                },
                                                onCancelClick: () {
                                                  Navigator.pop(context);
                                                },
                                              ).show<void>(context);
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ));
        },
      ),
    );
  }
}

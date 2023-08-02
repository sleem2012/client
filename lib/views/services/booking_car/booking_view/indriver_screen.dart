import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/in_drive/trip_model.dart';
import '../../../../di.dart';
import '../../../../logic/in_drive/find_driver/find_driver_cubit.dart';
import '../../../../logic/in_drive/find_driver/find_driver_state.dart';
import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../shared/theme/helper.dart';
import '../../../map/logic/map_cubit/map_bloc.dart';
import '../../../map/logic/map_cubit/map_state.dart';
import 'widgets/cap_request_list.dart';
import 'widgets/indriver_bottom_sheet.dart';

import '../../../map/map_view/map_screen.dart';

class BookACarView extends StatefulWidget {
  const BookACarView({Key? key}) : super(key: key);

  @override
  State<BookACarView> createState() => _BookACarViewState();
}

class _BookACarViewState extends State<BookACarView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Di.mapBloc
            ..getCurrentPosition()
            ..loadMapStyles(context),
        ),
      ],
      child: BlocListener<FindDriverBloc, FindDriverState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (model) {
              Nav.replace(CapRequestList(model: model.data ?? TripModelData()));
            },
          );
        },
        child: BlocBuilder<FindDriverBloc, FindDriverState>(
          builder: (context, driverState) {
            return BlocBuilder<MapBloc, MapState>(
              buildWhen: (previous, current) {
                return current.maybeWhen(
                  orElse: () => true,
                  onCameraMove: (_) => false,
                );
              },
              builder: (context, state) {
                final map = MapBloc.of(context);
                return Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            MapScreen(
                              onTapLocation: map.goToMyCurrentLocation,
                              onCameraMove: (camera) {
                                map.controlWhenMove(target: camera.target);
                              },
                              onCameraIdle: () {
                                map.controlWhenStop();
                              },
                              opacity: map.opacity!,
                            ),
                            if (map.selectedDestinationPositionLatLang == null)
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (map.detailedAddress != null)
                                      Container(
                                        decoration: KHelper.of(context).elevatedBox,
                                        padding: const EdgeInsets.all(5),
                                        child: state.when(
                                          loading: () => const CircularProgressIndicator(),
                                          initial: () => const SizedBox(),
                                          error: (error) => const SizedBox(),
                                          success: () => Text(
                                            map.detailedAddress?.split(',').firstOrNull ?? '',
                                            style: const TextStyle(fontSize: 10),
                                          ),
                                          onCameraMove: (_) => const SizedBox(),
                                        ),
                                      ),
                                    Center(
                                      child: Image.asset('assets/images/pin.png', width: 40),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      InDriverBottomSheet(
                        onTap: () {
                          map.changeCompleted();
                        },
                        height: map.height!,
                      ),
                      // const SearchBar(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

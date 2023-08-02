import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di.dart';
import '../../../../logic/in_drive/get/get_in_drive_bloc.dart';
import '../../../../logic/in_drive/get/get_in_drive_state.dart';
import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../trip_rate/trip_rate_screen.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/error/error_widget.dart';
import '../../../widgets/hero_dialog/btn_to_dialog.dart';
import '../../../widgets/loading/loading_overlay.dart';
import '../../../widgets/new_bg_img.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'widgets/trip_location_dialog.dart';

class TripsHistoryScreen extends StatelessWidget {
  const TripsHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KAppBar(title: Tr.get.trips_history),
        body: BlocProvider(
          create: (context) => Di.getInDriveBloc..get,
          child: BlocBuilder<GetInDriveBloc, GetInDriveState>(
            builder: (context, state) {
              final trips = GetInDriveBloc.of(context);
              final list = trips.filterTrips();
              return state.when(
                  loading: () => const KLoadingOverlay(isLoading: true),
                  initial: () => const KLoadingOverlay(isLoading: true),
                  success: () => RefreshIndicator(
                        onRefresh: () async {
                          await GetInDriveBloc.of(context).get();
                        },
                        child: BgImg(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(10),
                              itemBuilder: (context, index) => Container(
                                    decoration: KHelper.of(context).elevatedBox,
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(DateFormat.yMMMd().format(DateTime.tryParse(list[index].createdAt ?? '')!)),
                                            SizedBox(
                                              width: Get.width * .3,
                                              child: KButtonToDialog(
                                                  dialog: TripLocationsDialog(
                                                    data: list[index].tripRoads ?? [],
                                                  ),
                                                  tag: list[index].id.toString(),
                                                  child: Text(Tr.get.show_locations, style: TextStyle(color: KColors.of(context).accentColor))),
                                            ),
                                            Text(list[index].cost.toString()),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Nav.to(TripRateScreen(orderId: list[index].id));
                                                },
                                                icon: const Icon(Icons.rate_review)),
                                            Text(list[index].state ?? ''),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) => const SizedBox(height: 5),
                              itemCount: list.length),
                        ),
                      ),
                  error: (error) => KErrorWidget(
                        onTryAgain: GetInDriveBloc.of(context).get,
                        error: error,
                      ));
            },
          ),
        ));
  }
}

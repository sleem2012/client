import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/models/in_drive/trip_model.dart';
import '../../../../../logic/in_drive/find_driver/find_driver_cubit.dart';
import '../../../../../logic/in_drive/find_driver/find_driver_state.dart';
import '../../../../../logic/in_drive/update_trip/update_trip_cubit.dart';
import '../../../../../logic/in_drive/update_trip/update_trip_state.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../shared/localization/trans.dart';
import '../../../../../shared/theme/helper.dart';
import '../../../../../shared/theme/text_theme.dart';
import '../../request_details_screen.dart';
import '../../../../widgets/action_dialog.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/loading/linear_progress.dart';
import '../../../../widgets/slugs_drop_down.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CapRequestList extends StatelessWidget {
  const CapRequestList({Key? key, required this.model}) : super(key: key);
  final TripModelData model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            BlocConsumer<UpdateTripCubit, UpdateTripState>(
              listener: (context, state) {
                state.whenOrNull(success: (model) {
                  if (model.state == KSlugModel.canceled) {
                    return Nav.back();
                  }
                });
              },
              builder: (context, state) {
                final update = UpdateTripCubit.of(context);

                return Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  child: InkWell(
                    onTap: () {
                      ActionDialog(
                        title: Tr.get.cancel_request,
                        approveAction: Tr.get.yes_message,
                        cancelAction: Tr.get.no_message,
                        onApproveClick: () {
                          Navigator.pop(context);
                          update.updateTrip(
                            id: model.id,
                            State: KSlugModel.canceled,
                            cost: double.tryParse(model.fare?.split(' ').firstOrNull ?? '').toString(),
                            context: context,
                          );
                        },
                        onCancelClick: () {
                          Navigator.pop(context);
                        },
                      ).show<void>(context);
                    },
                    child: Text(
                      Tr.get.cancel,
                      textAlign: TextAlign.end,
                      style: KTextStyle.of(context).title2,
                    ),
                  ),
                );
              },
            ),
            BlocConsumer<FindDriverBloc, FindDriverState>(
              listener: (context, state) {
                state.whenOrNull(
                  socketEmit: (model) {
                    // if (model.) {}
                  },
                );
              },
              builder: (context, state) {
                final tripList = FindDriverBloc.of(context).socketTripList;

                return tripList.isEmpty
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * .2),
                            child: Lottie.asset(
                              "assets/images/man-waiting-car.json",
                              repeat: false,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(Tr.get.waiting_for_drivers, style: KTextStyle.of(context).title2),
                        ],
                      )
                    : SizedBox(
                        height: Get.height / 1.1,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            final data = tripList[index];
                            return Container(
                              key: ValueKey(tripList[index].userId),
                              decoration: KHelper.of(context).elevatedBox,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LinearProgress(key: key, timeStamp: tripList[index].created_at!),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: NetworkImage(data.data?.car_photo ?? dummyNetLogo),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width / 2,
                                                    child: Text(
                                                      data.data?.car_type ?? '',
                                                      style: KTextStyle.of(context).title2,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        data.name ?? '',
                                                        style: KTextStyle.of(context).title3,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      const SizedBox(width: 40),
                                                      Text(data.data?.car_plate ?? '', style: KTextStyle.of(context).title3),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text(
                                                data.offer?.toString() ?? '',
                                                style: KTextStyle.of(context).title3,
                                              )
                                              //             style: KTextStyle.of(context).title3),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Column(
                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                      //   children: [
                                      //     Row(
                                      //       children: [
                                      //         Text('40.0 SAR' ?? '',
                                      //             style: KTextStyle.of(context).title3),
                                      //       ],
                                      //     ),
                                      //     const SizedBox(height: 8),
                                      //     Text("${(1000 / 3).toStringAsFixed(3)} ${Tr.get.min}",
                                      //         style: KTextStyle.of(context).title3),
                                      //     const SizedBox(height: 8),
                                      //     Text('${1000.toStringAsFixed(3)} ${Tr.get.km}',
                                      //         style: KTextStyle.of(context).title3)
                                      //   ],
                                      // )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  BlocConsumer<UpdateTripCubit, UpdateTripState>(
                                    listener: (context, state) {
                                      state.whenOrNull(success: (m) {
                                        if (m.state == KSlugModel.waitingDriver) {
                                          return Nav.replace(RequestDetailsScreen(model: m));
                                        }
                                      });
                                    },
                                    builder: (context, state) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: KButton(
                                              onPressed: () {
                                                FindDriverBloc.of(context).remove(model: tripList[index]);
                                              },
                                              title: Tr.get.decline,
                                              height: 40,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: KButton(
                                              title: Tr.get.accept,
                                              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                                              onPressed: () {
                                                UpdateTripCubit.of(context).updateTrip(
                                                  context: context,
                                                  driver: tripList[index].userId,
                                                  id: tripList[index].id,
                                                  State: KSlugModel.waitingDriver,
                                                  cost: tripList[index].offer.toString(),
                                                );
                                              },
                                              height: 40,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: tripList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

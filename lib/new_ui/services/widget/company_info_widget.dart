import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'branches_list.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../packages/extensions.dart';
import '../../../logic/company/company_by_id/company_bloc_by_id.dart';
import '../../../logic/schedule/schedule_bloc.dart';
import '../../../logic/schedule/schedule_state.dart';
import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/orders/request_quote/request_quote_dialog.dart';
import '../../../views/widgets/avatar_widget.dart';
import '../../../views/widgets/custom_button.dart';
import '../../../views/widgets/error/error_widget.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../views/widgets/not_loggedin.dart';
import '../../../packages/shared/picker/view/static_map_view.dart';
import '../../../views/widgets/shimmer_box.dart';

class CompanyInfoWidget extends StatelessWidget {
  const CompanyInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CompanyBlocById data = CompanyBlocById.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              KIconButton(
                                child: const Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 20),
                                onPressed: () async {
                                  final String url = data.compSocial.facebook?.toString() ?? '';
                                  log(url);
                                  await launchUrlString(url);
                                },
                              ),
                              KIconButton(
                                child: const Icon(FontAwesomeIcons.instagram, color: Colors.blue, size: 20),
                                onPressed: () async {
                                  final String url = data.compSocial.instagram?.toString() ?? '';
                                  log("${url}url");
                                  await launchUrlString(url);
                                },
                              ),
                              KIconButton(
                                child: const Icon(FontAwesomeIcons.twitter, color: Colors.blueAccent, size: 20),
                                onPressed: () async {
                                  final String url = data.compSocial.twitter?.toString() ?? '';
                                  log("${url}url");
                                  await launchUrlString(url);
                                },
                              ),
                              KIconButton(
                                child: const Icon(FontAwesomeIcons.youtube, color: Colors.red, size: 20),
                                onPressed: () async {
                                  final String url = data.compSocial.youTube?.toString() ?? '';
                                  log("${url}url");
                                  await launchUrlString(url);
                                },
                              ),
                              KIconButton(
                                child: const Icon(FontAwesomeIcons.linkedin, color: Colors.blue, size: 20),
                                onPressed: () async {
                                  final String url = data.compSocial.linkedin?.toString() ?? '';
                                  log("${url}url");
                                  await launchUrlString(url);
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AvatarWidget(
                                icon: Icons.location_on,
                                onTap: () async {
                                  final String lat = data.compLocation.latitude ?? '';
                                  final String lng = data.compLocation.longitude ?? '';
                                  String url = "google.navigation:q=$lat,$lng";
                                  log(url);

                                  await launchUrlString(url);
                                },
                              ),
                              6.w,
                              KNotLoggedInWidget(
                                child: KChatIconButton(roomType: ChatRoomType.company, room_type_id: data.compId, order_chat_type: 'vendor'),
                              ),
                              6.w,
                              AvatarWidget(
                                icon: Icons.call,
                                onTap: () async {
                                  await launchUrlString("tel:${data.comPhone}");
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      20.h,
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Tr.get.description,
                        style: KTextStyle.of(context).black_grey_bold.S(1.4),
                        textAlign: TextAlign.left,
                      ),
                      5.h,
                      Text(
                        data.compDesc,
                        style: KTextStyle.of(context).black_grey.S(1.2),
                      ),
                      30.h,
                      BlocBuilder<ScheduleBloc, ScheduleState>(
                        builder: (context, state) {
                          final schedule = ScheduleBloc.of(context).scheduleModel?.data ?? [];
                          debugPrint(schedule.length.toString());
                          return Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.watch_later),
                                  5.w,
                                  Text(
                                    schedule.isNotEmpty ? Tr.get.workingHours : Tr.get.no_working_hours,
                                    style: KTextStyle.of(context).boldTitle1,
                                  ),
                                ],
                              ),
                              state.when(
                                  initial: () => ShimmerBox(width: Get.width, height: 120),
                                  loading: () => ShimmerBox(
                                        width: Get.width,
                                        height: 120,
                                      ),
                                  success: (model) {
                                    return ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 30),
                                            child: Row(
                                              children: [
                                                Expanded(child: Text(schedule[i].day ?? '')),
                                                Expanded(flex: 2, child: Text('${schedule[i].openAt} - ${schedule[i].closeAt}')),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) => SizedBox(
                                              height: 6,
                                            ),
                                        itemCount: schedule.length);
                                  },
                                  error: (error) => KErrorWidget(
                                        error: state.whenOrNull(error: (error) => error),
                                        isError: true,
                                        onTryAgain: ScheduleBloc.of(context).getSchedule,
                                      ))
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          const Icon(Icons.mail),
                          5.w,
                          Text(
                            Tr.get.email,
                            style: KTextStyle.of(context).boldTitle1,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          data.compMail,
                          style: KTextStyle.of(context).black_grey.S(1.2),
                        ),
                      ),
                    ],
                  ),
                ),
                10.h,
                InkWell(
                  onTap: () {
                    final String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${data.compLocation.latitude ?? "0"},${data.compLocation.longitude ?? '0'}';
                    launchUrlString(googleUrl, mode: LaunchMode.externalNonBrowserApplication);
                  },
                  child: MapStaticView(
                    latLng: LatLng(double.tryParse(data.compLocation.latitude ?? "0") ?? 0.0, double.tryParse(data.compLocation.longitude ?? '0') ?? 0.0),
                    zoom: '15',
                  ),
                ),
                10.h,
                BranchesList(company_id: data.compId)
              ],
            ),
          ),
        ),
        KNotLoggedInWidget(
          child: CustomBtn(
            text: Tr.get.request_for_quote,
            onChange: () {
              Get.dialog(RequestForQuoteDialog(companyId: data.compId));
            },
          ),
        ),
      ],
    );
  }
}

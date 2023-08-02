import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di.dart';
import '../../../logic/schedule/schedule_bloc.dart';
import '../../../logic/schedule/schedule_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';

class SchedulePicker extends StatelessWidget {
  const SchedulePicker({Key? key, this.pro_menu_id, required this.duration}) : super(key: key);

  final int? pro_menu_id;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.scheduleBloc..getSchedule(pro_menu_id: pro_menu_id, duration: duration ,firstDate:  null),
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          final schedule = ScheduleBloc.of(context);
          return KRequestOverlay(
            isLoading: state is ScheduleStateLoading,
            error: state is ScheduleStateError ? state.error : null,
            onTryAgain: () => schedule.getSchedule(pro_menu_id: pro_menu_id, duration: duration,firstDate:  null),
            child: Container(
              decoration: KHelper.of(context).elevatedBox,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Text(Tr.get.select_date, style: KTextStyle.of(context).title2),
                          ),
                          const Divider(height: 1),
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                              itemCount: schedule.availableDays.length,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final day = schedule.availableDays[index];
                                final isSelected = schedule.selectedDateIndex == index;
                                return InkWell(
                                  onTap: () {
                                    schedule.selectDate(index, duration);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    decoration: isSelected ? KHelper.of(context).outElevatedBox : KHelper.of(context).elevatedBox,
                                    child: Center(
                                      child: Text(
                                        '${day.toString().split(' ').first}  ${schedule.getWeekDay(day.weekday)}',
                                        style: isSelected ? KTextStyle.of(context).body : KTextStyle.of(context).hint,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(height: 1),
                          const SizedBox(height: 30),
                          if (schedule.availableTimes.isNotEmpty) TimesGridView(duration: duration) else const NoAvailableTimeWidget(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    child: Center(
                      child: KButton(
                        title: Tr.get.done,
                        height: 40,
                        width: Get.width * .5,
                        onPressed: () {
                          if (schedule.selectedPeriod != null) {
                            Get.back<DateTime>(result: schedule.selectedPeriod);
                          } else {
                            KHelper.showSnackBar(Tr.get.plz_select_time);
                          }
                        },
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


class ScheduleRangePicker extends StatelessWidget {
  const ScheduleRangePicker({Key? key, this.pro_menu_id, required this.duration, this.firstDate}) : super(key: key);

  final int? pro_menu_id;
  final int duration;
  final DateTime? firstDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.scheduleBloc..getSchedule(pro_menu_id: pro_menu_id, duration: duration , firstDate: firstDate),
      child: BlocBuilder<ScheduleBloc, ScheduleState>(

        builder: (context, state) {
          final schedule = ScheduleBloc.of(context);
          return KRequestOverlay(
            isLoading: state is ScheduleStateLoading,
            error: state is ScheduleStateError ? state.error : null,
            onTryAgain: () => schedule.getSchedule(pro_menu_id: pro_menu_id, duration: duration ,firstDate:  firstDate),
            child: Container(
              decoration: KHelper.of(context).elevatedBox,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(Tr.get.select_date, style: KTextStyle.of(context).title2),
                                InkWell(
                                  onTap: () {
                                    schedule.selectStartDate(context, duration: duration , firstDate: firstDate);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    decoration: KHelper.of(context).outElevatedBox,
                                    child: Text(schedule.selectedStartDate.toString().split(' ').first, style: KTextStyle.of(context).body),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1),
                          const SizedBox(height: 30),
                          if (schedule.availableTimes.isNotEmpty) TimesGridView(duration: duration) else const NoAvailableTimeWidget(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    child: Center(
                      child: KButton(
                        title: Tr.get.done,
                        height: 40,
                        width: Get.width * .5,
                        onPressed: () {
                          if (schedule.selectedPeriod != null) {
                            Get.back<DateTime>(result: schedule.selectedPeriod);
                          } else {
                            KHelper.showSnackBar(Tr.get.plz_select_time);
                          }
                        },
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




class TimesGridView extends StatelessWidget {
  const TimesGridView({Key? key, required this.duration}) : super(key: key);

  final int duration;

  @override
  Widget build(BuildContext context) {
    ScheduleBloc schedule = ScheduleBloc.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Tr.get.available_times, style: KTextStyle.of(context).title4),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.ltr,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 40,
              ),
              itemCount: schedule.availableTimes.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final isSelected = schedule.selectedPeriod == schedule.availableTimes[index];
                final date1 = schedule.availableTimes[index];
                final date2 = schedule.availableTimes[index].add(Duration(minutes: duration));

                return InkWell(
                  onTap: () {
                    schedule.selectPeriod(date1);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    padding: EdgeInsets.all(isSelected ? 10 : 5),
                    margin: EdgeInsets.symmetric(horizontal: isSelected ? 5 : 0),
                    decoration: isSelected ? KHelper.of(context).outElevatedBox : KHelper.of(context).elevatedBox,
                    child: Center(
                      child: Text(
                        "${TimeOfDay.fromDateTime(date1).hour.toString().padLeft(2, '0')} : ${TimeOfDay.fromDateTime(date1).minute.toString().padLeft(2, '0')}"
                        " ~ ${TimeOfDay.fromDateTime(date2).hour.toString().padLeft(2, '0')} : ${TimeOfDay.fromDateTime(date2).minute.toString().padLeft(2, '0')}",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



class NoAvailableTimeWidget extends StatelessWidget {
  const NoAvailableTimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer_off_outlined),
          const SizedBox(width: 15),
          Text(Tr.get.no_available_times_this_day),
        ],
      ),
    );
  }
}

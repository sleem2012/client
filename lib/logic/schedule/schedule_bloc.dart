import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/schedule/schedule_model.dart';
import '../../data/repository/schedule/schedule_repo.dart';
import 'schedule_state.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';

class ScheduleBloc extends Cubit<ScheduleState> {
  ScheduleBloc({required this.scheduleRepoImpl}) : super(const ScheduleState.initial());

  static ScheduleBloc of(context) => BlocProvider.of(context);
  final ScheduleRepoImpl scheduleRepoImpl;
  ScheduleModel? scheduleModel;

  getSchedule({int? pro_menu_id, int? duration, DateTime? firstDate, int? companyId}) async {
    emit(const ScheduleState.loading());

    try {
      final result = await scheduleRepoImpl.get(pro_menu_id: pro_menu_id, companyId: companyId);
      result.fold(
        (l) {
          emit(ScheduleState.error(error: KFailure.toError(l)));
          debugPrint('================= getSchedule (Bloc) : $l  ');
        },
        (r) {
          scheduleModel = r;
          // ScheduleModel.fromJson(json);
          setDays(duration ?? -1, firstDate: firstDate);
          emit(ScheduleState.success(model: scheduleModel!));
        },
      );
    } catch (e) {
      debugPrint('================= getSchedule (Bloc) (catch) : $e  ');
      emit(ScheduleState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  List<DateTime> availableDays = [];

  setDays(int duration, {DateTime? firstDate}) {
    availableDays = [];
    for (int i = 0; i < 7; i++) {
      final day = DateTime.now().add(Duration(days: i));
      final lD =
          scheduleModel?.data?.where((element) => element.day == getWeekDay(day.weekday) && !element.isHoliday! && !element.isOffDay!).toList() ?? [];
      if (lD.isNotEmpty) {
        availableDays.add(day);
      }
    }
    scheduleOfDay(firstDate ?? availableDays.firstOrNull ?? DateTime(1990), duration);
  }

  List<DateTime> availableTimes = [];
  scheduleOfDay(DateTime d, int duration) {
    if (duration == 0) return;
    availableTimes = [];
    debugPrint('============ Duration =====  : $duration ');
    final lD = scheduleModel?.data?.where((element) => element.day == getWeekDay(d.weekday)).toList() ?? [];
    List<DateTime> dG = [];
    for (var element in scheduleModel?.general ?? []) {
      final DateTime? dateTime = DateTime.tryParse(element.timePikerFrom ?? '');
      if (dateTime != null && d.toString().split(' ').firstOrNull == dateTime.toString().split(' ').first) {
        debugPrint('================= Picked === : $dateTime');
        dG.add(dateTime);
      }
    }

    for (var element in lD) {
      final openAt = DateTime(
        d.year,
        d.month,
        d.day,
        int.tryParse(element.openAt?.split(':').firstOrNull ?? '0') ?? 0,
        int.tryParse(element.openAt?.split(':').lastOrNull ?? '0') ?? 0,
      );
      final closeAt = DateTime(
        d.year,
        d.month,
        d.day,
        int.tryParse(element.closeAt?.split(':').firstOrNull ?? '0') ?? 0,
        int.tryParse(element.closeAt?.split(':').lastOrNull ?? '0') ?? 0,
      );
      final fullDurationInMin = closeAt.difference(openAt).inMinutes;
      if (fullDurationInMin == 0) return;
      final pickedTimes = dG.map((e) => TimeOfDay.fromDateTime(e)).toList();
      for (int i = 0; i <= (fullDurationInMin / duration).round(); i++) {
        DateTime x = openAt.add(Duration(minutes: i * duration));
        if (x.isBefore(closeAt) && !pickedTimes.contains(TimeOfDay.fromDateTime(x))) {
          debugPrint('Period $i ================= ${TimeOfDay.fromDateTime(x)}');
          availableTimes.add(x);
        }
      }
    }
  }

  int selectedDateIndex = 0;
  selectDate(int index, int duration) {
    final day = availableDays[index];
    selectedDateIndex = index;
    scheduleOfDay(day, duration);
    _update;
  }

  DateTime selectedStartDate = DateTime.now().add(const Duration(days: 1));
  selectStartDate(BuildContext context, {required int duration, DateTime? firstDate}) async {
    final day = await showDatePicker(
      context: context,
      initialDate: firstDate ?? selectedStartDate,
      firstDate: firstDate ?? DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 100 * 365)),
    );
    if (day == null) return;
    selectedStartDate = day;
    scheduleOfDay(day, duration);
    _update;
  }

  DateTime? selectedPeriod;
  selectPeriod(DateTime date) {
    selectedPeriod = date;
    _update;
  }

  getWeekDay(int d) {
    switch (d) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Monday";
    }
  }

  get _update {
    emit(const ScheduleState.loading());
    emit(const ScheduleState.initial());
  }

  Map<String, dynamic> json = {
    "success": true,
    "status": "success",
    "message": "the read process has success.",
    "data": [
      {"id": 79, "day": "Saturday", "timezone": "EET", "open_at": "14:00", "close_at": "16:00", "is_holiday": false, "is_off_day": false},
      {"id": 79, "day": "Saturday", "timezone": "EET", "open_at": "17:00", "close_at": "19:00", "is_holiday": false, "is_off_day": false},
      {"id": 80, "day": "Monday", "timezone": "EET", "open_at": "14:00", "close_at": "17:00", "is_holiday": false, "is_off_day": false},
      {"id": 81, "day": "Friday", "timezone": "EET", "open_at": "15:10", "close_at": "17:25", "is_holiday": false, "is_off_day": false},
      {"id": 81, "day": "Sunday", "timezone": "EET", "open_at": "15:10", "close_at": "17:25", "is_holiday": false, "is_off_day": false},
    ],
    "general": [
      {"order_id": 258, "time_piker_from": "2022-12-17T15:15:00.000000Z", "time_piker_to": null},
      {"order_id": 258, "time_piker_from": "2022-12-17T15:40:00.000000Z", "time_piker_to": null},
      {"order_id": 258, "time_piker_from": "2022-12-18T16:00:00.000000Z", "time_piker_to": null},
      {"order_id": 258, "time_piker_from": "2022-12-18T16:25:00.000000Z", "time_piker_to": null},
    ],
  };
}

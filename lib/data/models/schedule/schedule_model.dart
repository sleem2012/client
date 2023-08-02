class ScheduleModel {
  bool? success;
  String? status;
  String? message;
  List<ScheduleData>? data;
  List<ScheduleGeneral>? general;

  ScheduleModel({this.success, this.status, this.message, this.data, this.general});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ScheduleData>[];
      json['data'].forEach((v) {
        data!.add(ScheduleData.fromJson(v));
      });
    }
    if (json['general'] != null) {
      general = <ScheduleGeneral>[];
      json['general'].forEach((v) {
        general!.add(ScheduleGeneral.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (general != null) {
      data['general'] = general!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleData {
  int? id;
  String? day;
  String? timezone;
  String? openAt;
  String? closeAt;
  bool? isHoliday;
  bool? isOffDay;

  ScheduleData({this.id, this.day, this.timezone, this.openAt, this.closeAt, this.isHoliday, this.isOffDay});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    timezone = json['timezone'];
    openAt = json['open_at'];
    closeAt = json['close_at'];
    isHoliday = json['is_holiday'];
    isOffDay = json['is_off_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['timezone'] = timezone;
    data['open_at'] = openAt;
    data['close_at'] = closeAt;
    data['is_holiday'] = isHoliday;
    data['is_off_day'] = isOffDay;
    return data;
  }
}

class ScheduleGeneral {
  int? orderId;
  String? timePikerFrom;
  String? timePikerTo;

  ScheduleGeneral({this.orderId, this.timePikerFrom, this.timePikerTo});

  ScheduleGeneral.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    timePikerFrom = json['time_piker_from'];
    timePikerTo = json['time_piker_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['time_piker_from'] = timePikerFrom;
    data['time_piker_to'] = timePikerTo;
    return data;
  }
}

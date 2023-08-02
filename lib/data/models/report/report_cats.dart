class ReportCategories {
  bool? success;
  String? status;
  String? message;
  List<RepoCatData>? data;

  ReportCategories({this.success, this.status, this.message, this.data});

  ReportCategories.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RepoCatData>[];
      json['data'].forEach((v) {
        data!.add(RepoCatData.fromJson(v));
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
    return data;
  }
}

class RepoCatData {
  int? id;
  NameValues? nameValues;
  bool? isVisible;

  RepoCatData({this.id, this.nameValues, this.isVisible});

  RepoCatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameValues = json['name_values'] != null ? NameValues.fromJson(json['name_values']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (nameValues != null) {
      data['name_values'] = nameValues!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class NameValues {
  String? key;
  String? value;

  NameValues({this.key, this.value});

  NameValues.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

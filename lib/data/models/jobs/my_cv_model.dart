class MyCvsModel {
  bool? success;
  String? status;
  String? message;
  List<CvData>? cvData;

  MyCvsModel({this.success, this.status, this.message, this.cvData});

  MyCvsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      cvData = <CvData>[];
      json['data'].forEach((v) {
        cvData!.add(CvData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (cvData != null) {
      data['data'] = cvData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CvData {
  int? id;
  String? cv;
  String? createdAt;

  CvData({this.id, this.cv, this.createdAt});

  CvData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cv = json['cv'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['getCv'] = cv;
    data['created_at'] = createdAt;
    return data;
  }
}

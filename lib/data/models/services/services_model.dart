// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'service_type.dart';

class ServicesModel {
  bool? success;
  String? status;
  String? message;
  List<ServicesData>? data;

  ServicesModel({this.success, this.status, this.message, this.data});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ServicesData>[];
      json['data'].forEach((v) {
        data!.add(ServicesData.fromJson(v));
      });
    }
  }
}

class ServicesData {
  int? id;
  String? key;
  String? name;
  String? icons;
  bool? is_selectable;
  ServiceType? type;

  ServicesData({
    this.id,
    this.key,
    this.name,
    this.icons,
    this.is_selectable,
    this.type,
  });

  ServicesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'] != null ? json['name']["value"] : null;
    icons = json['icons'] != null ? json['icons']["svg"] : null;
    is_selectable = json['is_selectable'] ;
    type = ServiceType.fromStr(json['type'].toString());
  }
}

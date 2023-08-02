// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:forall_client/data/models/products/products_model.dart';
import 'package:forall_client/data/models/user_info/user_model.dart';

class ServiceGatesResponse {
  bool? success;
  String? status;
  String? message;
  List<UserCompany>? data;
  Pagination? pagination;

  ServiceGatesResponse({this.success, this.status, this.message, this.data, this.pagination});

  ServiceGatesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = <UserCompany>[];
      for (var element in json['data'] as List) {
        data?.add(UserCompany.fromJson(element));
      }
    }

    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }



  @override
  bool operator ==(covariant ServiceGatesResponse other) {
    if (identical(this, other)) return true;

    return
      other.success == success &&
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data) &&
      other.pagination == pagination;
  }

  @override
  int get hashCode {
    return success.hashCode ^
      status.hashCode ^
      message.hashCode ^
      data.hashCode ^
      pagination.hashCode;
  }

  ServiceGatesResponse copyWith({
    bool? success,
    String? status,
    String? message,
    List<UserCompany>? data,
    Pagination? pagination,
  }) {
    return ServiceGatesResponse(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }
}

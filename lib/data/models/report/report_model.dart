// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:forall_client/data/models/report/report_cats.dart';
import 'package:forall_client/data/models/user_info/user_model.dart';
import 'package:forall_client/data/models/vendor/vendor_model.dart';

class ReportModel {
  bool? success;
  String? status;
  String? message;
  ReportData? data;

  ReportModel({this.success, this.status, this.message, this.data});

  ReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ReportData.fromJson(json['data']) : null;
  }
}

class ReportData {
  int? id;
  UserModelData? user;
  RepoCatData? category;
  String? title;
  String? paragraph;
  List<String>? files;
  String? createdAt;
  List<DUIAttribute>? answersCollection;
  String? state;
  VendorModel? vendor;
  ReportData({
    this.id,
    this.user,
    this.category,
    this.title,
    this.paragraph,
    this.files,
    this.createdAt,
    this.answersCollection,
    this.state,
  });

  ReportData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? UserModelData.fromJson(json['user']) : null;
    category = json['category'] != null ? RepoCatData.fromJson(json['category']) : null;
    title = json['title'];
    paragraph = json['paragraph'];
    state = json['state'];
    files = json['files'].cast<String>();
    createdAt = json['created_at'];
    if (json['vendor'] != null) {
      vendor = VendorModel.fromJson(json['vendor']);
    }

    if (json['answers_collection'] != null) {
      answersCollection = <DUIAttribute>[];
      json['answers_collection'].forEach((v) {
        answersCollection!.add(DUIAttribute.fromJson(v));
      });
    }
  }



  @override
  bool operator ==(covariant ReportData other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
      other.user == user &&
      other.category == category &&
      other.title == title &&
      other.paragraph == paragraph &&
      listEquals(other.files, files) &&
      other.createdAt == createdAt &&
      listEquals(other.answersCollection, answersCollection) &&
      other.state == state &&
      other.vendor == vendor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user.hashCode ^
      category.hashCode ^
      title.hashCode ^
      paragraph.hashCode ^
      files.hashCode ^
      createdAt.hashCode ^
      answersCollection.hashCode ^
      state.hashCode ^
      vendor.hashCode;
  }
}

class DUIAttribute {
  int? id;
  int? attributeId;
  String? key;
  String? placeholder;
  String? type;
  List<AnswerCollections>? answerCollections;

  DUIAttribute({this.id, this.attributeId, this.key, this.placeholder, this.answerCollections});

  DUIAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    key = json['key'];
    type = json['type'];
    placeholder = (json['placeholder'] != null && json['placeholder'].toString().isNotEmpty) ? json['placeholder']["value"] : null;
    if (json['answer_collections'] != null) {
      answerCollections = <AnswerCollections>[];
      json['answer_collections'].forEach((v) {
        answerCollections!.add(AnswerCollections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attribute_id'] = attributeId;
    data['key'] = key;
    data['type'] = type;
    if (placeholder != null) {
      data['placeholder'] = {"value": placeholder};
    }
    if (answerCollections != null) {
      data['answer_collections'] = answerCollections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnswerCollections {
  String? key;
  String? placeholder;
  List<String>? value;

  AnswerCollections({this.key, this.placeholder, this.value});

  AnswerCollections.fromJson(Map<String, dynamic> json) {
    key = json['key'].toString();
    placeholder = (json['placeholder'] != null && json['placeholder'].toString().isNotEmpty) ? json['placeholder']["value"] : null;

    if (json['value'] != null) {
      if (json['value'] is String) {
        value = [json['value']];
      } else if (json['value'] is List) {
        value = <String>[];
        json['value'].forEach((v) {
          if (v is String) {
            value?.add(v);
          } else if (v is Map<String, dynamic>) {
            String x = '';
            final entList = v.entries.toList();
            for (var e in entList) {
              x = '$x${e.key.replaceAll('_', ' ').capitalize} : ${e.value} ${entList.indexOf(e).isEqual(entList.length - 1) ? '' : '\n'}';
            }
            value?.add(x);
          } else {
            value = [json['value'].toString()];
          }
        });
      } else {
        value = [json['value'].toString()];
      }
    } else {
      value = [json['value'].toString()];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['placeholder'] = {"value": placeholder};
    data['value'] = value;
    return data;
  }
}

class GetProAttrsFieldsModel {
  bool? success;
  String? status;
  String? message;
  List<ProAttrData>? data;

  GetProAttrsFieldsModel({this.success, this.status, this.message, this.data});

  GetProAttrsFieldsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProAttrData>[];
      json['data'].forEach((v) {
        data!.add(ProAttrData.fromJson(v));
      });
    }
  }
}

class ProAttrData {
  int? id;
  int? categoryId;
  String? name;
  List<ProAttrCollections>? collections;
  String? valueType;
  bool? isVisible;
  bool? hasMulti;
  bool? isRequired;

  ProAttrData({this.id, this.categoryId, this.name, this.collections, this.valueType, this.isVisible, this.hasMulti, this.isRequired});

  ProAttrData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json["name"] != null ? json["name"]['value'] : null;

    if (json['collections'] != null) {
      collections = <ProAttrCollections>[];
      json['collections'].forEach((v) {
        collections!.add(ProAttrCollections.fromJson(v));
      });
    }
    valueType = json['value_type'];
    isVisible = json['is_visible'];
    hasMulti = json['has_multiple'] ?? true;
    isRequired = json['is_required'] ?? false;
  }
}

class ProAttrCollections {
  int? id;
  int? attrCategoryId;
  String? value;
  String? icon;
  bool? isVisible;

  ProAttrCollections({this.id, this.attrCategoryId, this.value, this.isVisible});

  ProAttrCollections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attrCategoryId = json['attr_category_id'];
    icon = json['icon'] != null ? json['icon']['svg'] : null;
    value = json["value"] != null ? json["value"]['value'] : null;
    isVisible = json['is_visible'];
  }
}

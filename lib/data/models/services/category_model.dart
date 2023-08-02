import 'package:flutter/foundation.dart';

import 'feature_type.dart';
import 'service_type.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SupCategoriesModel {
  bool? success;
  String? status;
  String? message;
  List<CategoryModel>? data;

  SupCategoriesModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  SupCategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = <CategoryModel>[];
      json['data'].forEach((v) {
        data!.add(CategoryModel.fromJson(v));
      });
    }
  }

  SupCategoriesModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<CategoryModel>? data,
  }) {
    return SupCategoriesModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant SupCategoriesModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }
}

class CategoryModel {
  int? id;
  String? name;
  List<CategoryModel>? children;
  bool? isVisible;
  bool? isService;
  bool? hasClientVendorShipping;
  bool? isCartVisible;
  String? icons;
  ServiceType? type;
  String? typeStr;
  FeatureType? features;

  CategoryModel({
    this.id,
    this.name,
    this.children,
    this.icons,
    this.isService,
    this.isVisible,
    this.hasClientVendorShipping,
    this.isCartVisible,
    this.type,
    this.typeStr,
    this.features,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    isVisible = json['is_visible'];
    hasClientVendorShipping = json['has_client_vendor_shipping'];
    isCartVisible = json['is_cart_visible'];
    isService = json['is_service'];
    id = json['id'];
    typeStr = json['type'];
    type = ServiceType.fromStr(json['type'].toString());
    features = FeatureType.formString(json['features']);
    name = json['name'] != null ? json['name']['value'] : null;
    if (json['children'] != null) {
      children = <CategoryModel>[];
      json['children'].forEach((v) {
        children!.add(CategoryModel.fromJson(v));
      });
    }
    icons = json['icons'] != null ? json['icons']['svg'] : null;
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.children, children) &&
        other.isVisible == isVisible &&
        other.isService == isService &&
        other.hasClientVendorShipping == hasClientVendorShipping &&
        other.isCartVisible == isCartVisible &&
        other.icons == icons &&
        other.type == type &&
        other.features == features;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        children.hashCode ^
        isVisible.hashCode ^
        isService.hashCode ^
        hasClientVendorShipping.hashCode ^
        isCartVisible.hashCode ^
        icons.hashCode ^
        type.hashCode ^
        features.hashCode;
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    List<CategoryModel>? children,
    bool? isVisible,
    bool? isService,
    bool? hasClientVendorShipping,
    bool? isCartVisible,
    String? icons,
    ServiceType? type,
    FeatureType? features,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      children: children ?? this.children,
      isVisible: isVisible ?? this.isVisible,
      isService: isService ?? this.isService,
      hasClientVendorShipping: hasClientVendorShipping ?? this.hasClientVendorShipping,
      isCartVisible: isCartVisible ?? this.isCartVisible,
      icons: icons ?? this.icons,
      type: type ?? this.type,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'children': children,
      'typeStr': typeStr,
      'type': type.toString(),
      'features': features.toString(),
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import 'package:forall_client/data/models/products/products_model.dart';

class FavouriteResponseModel {
  bool? success;
  String? status;
  String? message;
  List<FavouriteDataModel>? data;
  Pagination? pagination;

  FavouriteResponseModel({
    this.success,
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  FavouriteResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;

    if (json['data'] != null) {
      data = <FavouriteDataModel>[];
      json['data'].forEach((v) {
        data!.add(FavouriteDataModel.fromJson(v));
      });
    }
  }

  FavouriteResponseModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<FavouriteDataModel>? data,
    Pagination? pagination,
  }) {
    return FavouriteResponseModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  String toString() {
    return 'FavouriteResponseModel(success: $success, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(covariant FavouriteResponseModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }
}

class FavouriteDataModel {
  int? id;
  ProductsSystemData? productId;
  FavouriteDataModel({
    this.id,
    this.productId,
  });
  FavouriteDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'] != null ? ProductsSystemData.fromJson(json['product_id']) : null;
  }

  FavouriteDataModel copyWith({
    int? id,
    ProductsSystemData? productId,
  }) {
    return FavouriteDataModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
    );
  }

  @override
  String toString() => 'FavouriteDataModel(id: $id, productId: $productId)';

  @override
  bool operator ==(covariant FavouriteDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.productId == productId;
  }

  @override
  int get hashCode => id.hashCode ^ productId.hashCode;
}

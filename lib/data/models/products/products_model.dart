// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:forall_client/data/models/services/category_model.dart';
import 'package:forall_client/data/models/user_info/user_model.dart';

class HotelsProductResponse {
  final List<ProductMenu> products;
  final PageMeta? pagination;
  HotelsProductResponse({required this.products, this.pagination});

  @override
  bool operator ==(covariant HotelsProductResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.products, products) && other.pagination == pagination;
  }

  @override
  int get hashCode => products.hashCode ^ pagination.hashCode;

  factory HotelsProductResponse.fromJson(Map<String, dynamic> map) {
    return HotelsProductResponse(
      products: map['data'] != null
          ? List<ProductMenu>.from(
              (map['data'] as List).map<ProductMenu?>((x) => ProductMenu.fromJson(x as Map<String, dynamic>)),
            )
          : [],
      pagination: map['meta'] != null ? PageMeta.fromJson(map['meta'] as Map<String, dynamic>) : null,
    );
  }

  HotelsProductResponse copyWith({
    List<ProductMenu>? products,
    PageMeta? pagination,
  }) {
    return HotelsProductResponse(
      products: products ?? this.products,
      pagination: pagination ?? this.pagination,
    );
  }
}

class ProductsSysModel {
  bool? success;
  String? status;
  String? message;
  List<ProductsSystemData>? data;
  Pagination? pagination;

  ProductsSysModel({this.success, this.status, this.message, this.data, this.pagination});

  ProductsSysModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductsSystemData>[];
      json['data'].forEach((v) {
        data!.add(ProductsSystemData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }

  ProductsSysModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<ProductsSystemData>? data,
    Pagination? pagination,
  }) {
    return ProductsSysModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }
}

class ProductsMenuModel {
  bool? success;
  String? status;
  String? message;
  List<ProductMenu>? products;
  Pagination? pagination;

  ProductsMenuModel({this.success, this.status, this.message, this.products, this.pagination});

  ProductsMenuModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      products = <ProductMenu>[];
      json['data'].forEach((v) {
        products!.add(ProductMenu.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }

  ProductsMenuModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<ProductMenu>? products,
    Pagination? pagination,
  }) {
    return ProductsMenuModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      products: products ?? this.products,
      pagination: pagination ?? this.pagination,
    );
  }
}

class ProductsSystemData {
  int? id;
  Name? name;
  Name? smallDescription;
  Name? description;
  CategoryModel? category;
  int? position;
  bool? isVisible;
  UserCompany? company;
  List<ProductMenu>? products;
  bool? isFav;
  bool? hasTimePicker;
  bool? isOneTime;
  bool? isDateOnly;
  bool? hasExtra;
  int? extraRequiredValue;
  String? timePickerType;
  String? timePickerCounted;

  ProductsSystemData({
    this.id,
    this.name,
    this.smallDescription,
    this.description,
    this.category,
    this.position,
    this.isVisible,
    this.company,
    this.products,
    this.isFav,
    this.hasTimePicker,
    this.hasExtra,
    this.extraRequiredValue,
    this.timePickerType,
    this.timePickerCounted,
    this.isDateOnly,
    this.isOneTime,
  });

  ProductsSystemData.fromJson(Map<String, dynamic> json) {
    timePickerCounted = json['time_picker_counted'];
    timePickerType = json['time_picker_type'];
    extraRequiredValue = json['extra_required_value'];
    hasExtra = json['has_extra'];
    hasTimePicker = json['has_time_picker'];
    isDateOnly = json['time_picker_type'].toString() != 'date_time';
    isOneTime = json['time_picker_counted'].toString() == 'one_time';
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    smallDescription = json['small_description'] != null ? Name.fromJson(json['small_description']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    category = json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
    position = json['position'];
    isVisible = json['is_visible'];
    isFav = json['is_favorite'];
    company = json['company'] != null ? UserCompany.fromJson(json['company']) : null;
    if (json['products'] != null) {
      products = <ProductMenu>[];
      json['products'].forEach((v) {
        products!.add(ProductMenu.fromJson(v));
      });
    }
  }

  ProductsSystemData copyWith({
    int? id,
    Name? name,
    Name? smallDescription,
    Name? description,
    CategoryModel? category,
    int? position,
    bool? isVisible,
    UserCompany? company,
    List<ProductMenu>? products,
    bool? isFav,
    bool? hasTimePicker,
    bool? isOneTime,
    bool? isDateOnly,
    bool? hasExtra,
    int? extraRequiredValue,
    String? timePickerType,
    String? timePickerCounted,
  }) {
    return ProductsSystemData(
      id: id ?? this.id,
      name: name ?? this.name,
      smallDescription: smallDescription ?? this.smallDescription,
      description: description ?? this.description,
      category: category ?? this.category,
      position: position ?? this.position,
      isVisible: isVisible ?? this.isVisible,
      company: company ?? this.company,
      products: products ?? this.products,
      isFav: isFav ?? this.isFav,
      hasTimePicker: hasTimePicker ?? this.hasTimePicker,
      isOneTime: isOneTime ?? this.isOneTime,
      isDateOnly: isDateOnly ?? this.isDateOnly,
      hasExtra: hasExtra ?? this.hasExtra,
      extraRequiredValue: extraRequiredValue ?? this.extraRequiredValue,
      timePickerType: timePickerType ?? this.timePickerType,
      timePickerCounted: timePickerCounted ?? this.timePickerCounted,
    );
  }
}

class ProductMenu {
  int? id;
  int? innerPosition;
  Product? product;
  ProductColor? productColor;
  ProductSize? productSize;
  String? ribbon;
  int? amount;
  String? price;
  String? discount;
  String? weightGrams;
  int? notificationAt;
  List<ImageValues>? imageValues;
  String? publishedDiscountAt;
  String? expiredDiscountAt;
  List<Extras>? extras;
  bool? isExtra;
  bool? isVisible;
  bool? has_offer;
  List<Review>? review;
  List<ProductAttributes>? product_attr;
  int? duration;

  ProductMenu({
    this.id,
    this.innerPosition,
    this.product,
    this.productColor,
    this.productSize,
    this.ribbon,
    this.amount,
    this.price,
    this.discount,
    this.weightGrams,
    this.notificationAt,
    this.imageValues,
    this.publishedDiscountAt,
    this.expiredDiscountAt,
    this.isVisible,
    this.review,
    this.isExtra,
    this.extras,
    this.product_attr,
    this.duration,
  });

  ProductMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isExtra = json['is_extra'];
    innerPosition = json['inner_position'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    productColor = json['product_color'] != null ? ProductColor.fromJson(json['product_color']) : null;
    productSize = json['product_size'] != null ? ProductSize.fromJson(json['product_size']) : null;
    ribbon = json['ribbon'];
    amount = json['amount'];
    has_offer = json['has_offer'] ?? false;
    price = json['price'].toString();
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(Review.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      product_attr = <ProductAttributes>[];
      json['attributes'].forEach((v) {
        product_attr!.add(ProductAttributes.fromJson(v));
      });
    }
    if (json['extras'] != null) {
      extras = <Extras>[];
      json['extras'].forEach((v) {
        extras!.add(Extras.fromJson(v));
      });
    }
    discount = json['discount'].toString();
    duration = json['duration'];
    weightGrams = json['weight_grams'].toString();
    notificationAt = json['notification_at'];
    if (json['image_values'] != null) {
      imageValues = <ImageValues>[];
      json['image_values'].forEach((v) {
        imageValues!.add(ImageValues.fromJson(v));
      });
    }
    publishedDiscountAt = json['published_discount_at'];
    expiredDiscountAt = json['expired_discount_at'];
    isVisible = json['is_visible'];
  }
}

class Product {
  int? id;
  Name? name;
  Name? smallDescription;
  Name? description;
  CategoryModel? category;
  int? position;
  bool? isVisible;
  Product({this.id, this.name, this.smallDescription, this.description, this.category, this.position, this.isVisible});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    smallDescription = json['small_description'] != null ? Name.fromJson(json['small_description']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    category = json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
    position = json['position'];
    isVisible = json['is_visible'];
  }

  Product copyWith({
    int? id,
    Name? name,
    Name? smallDescription,
    Name? description,
    CategoryModel? category,
    int? position,
    bool? isVisible,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      smallDescription: smallDescription ?? this.smallDescription,
      description: description ?? this.description,
      category: category ?? this.category,
      position: position ?? this.position,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class ProductColor {
  int? id;
  String? icon;
  String? key;
  Name? name;
  bool? isVisible;

  ProductColor({this.id, this.icon, this.key, this.name, this.isVisible});

  ProductColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'] != null ? json['icon']['svg'] : null;
    key = json['key'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isVisible = json['is_visible'];
  }

  @override
  bool operator ==(covariant ProductColor other) {
    if (identical(this, other)) return true;

    return other.id == id && other.icon == icon && other.key == key && other.name == name && other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ icon.hashCode ^ key.hashCode ^ name.hashCode ^ isVisible.hashCode;
  }
}

class ProductSize {
  int? id;
  String? symbol;
  Name? name;
  bool? isVisible;

  ProductSize({this.id, this.symbol, this.name, this.isVisible});

  ProductSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isVisible = json['is_visible'];
  }

  @override
  bool operator ==(covariant ProductSize other) {
    if (identical(this, other)) return true;

    return other.id == id && other.symbol == symbol && other.name == name && other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ symbol.hashCode ^ name.hashCode ^ isVisible.hashCode;
  }
}

class ImageValues {
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;
  String? s1024px;

  ImageValues({this.s64px, this.s128px, this.s256px, this.s512px, this.s1024px});

  ImageValues.fromJson(Map<String, dynamic> json) {
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
    s1024px = json['1024px'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      's64px': s64px,
      's128px': s128px,
      's256px': s256px,
      's512px': s512px,
      's1024px': s1024px,
    };
  }

  factory ImageValues.fromMap(Map<String, dynamic> map) {
    return ImageValues(
      s64px: map['s64px'] != null ? map['s64px'] as String : null,
      s128px: map['s128px'] != null ? map['s128px'] as String : null,
      s256px: map['s256px'] != null ? map['s256px'] as String : null,
      s512px: map['s512px'] != null ? map['s512px'] as String : null,
      s1024px: map['s1024px'] != null ? map['s1024px'] as String : null,
    );
  }
}

class Pagination {
  PageMeta? meta;

  Pagination({this.meta});

  Pagination.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? PageMeta.fromJson(json['meta']) : null;
  }
}

class PageMeta {
  int? currentPage;
  int? from;
  int? to;
  String? perPage;
  int? total;

  PageMeta({this.currentPage, this.from, this.to, this.perPage, this.total});

  PageMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    to = json['to'];
    perPage = json['per_page'].toString();
    total = json['total'];
  }
}

class Review {
  int? id;
  double? rate;
  String? comment;
  bool? isVisible;

  Review({this.id, this.rate, this.comment, this.isVisible});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = double.tryParse(json['rate'].toString());
    comment = json['comment'];
    isVisible = json['is_visible'];
  }
}

class Extras {
  int? id;
  Product? product;
  ProductColor? productColor;
  ProductSize? productSize;
  String? price;
  bool? hasDiscount;
  List<ImageValues>? imageValues;
  int? amount = 1;

  Extras({this.id, this.product, this.productColor, this.productSize, this.price, this.hasDiscount, this.imageValues, this.amount});

  Extras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    productColor = json['product_color'] != null ? ProductColor.fromJson(json['product_color']) : null;
    productSize = json['product_size'] != null ? ProductSize.fromJson(json['product_size']) : null;
    price = json['price'];
    hasDiscount = json['has_discount'];
    if (json['image_values'] != null) {
      imageValues = <ImageValues>[];
      json['image_values'].forEach((v) {
        imageValues!.add(ImageValues.fromJson(v));
      });
    }
  }

  @override
  bool operator ==(covariant Extras other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.product == product &&
        other.productColor == productColor &&
        other.productSize == productSize &&
        other.price == price &&
        other.hasDiscount == hasDiscount &&
        listEquals(other.imageValues, imageValues);
  }

  @override
  int get hashCode {
    return id.hashCode ^ product.hashCode ^ productColor.hashCode ^ productSize.hashCode ^ price.hashCode ^ hasDiscount.hashCode ^ imageValues.hashCode;
  }
}

class ProductAttributes {
  int? id;
  AttrValue? attrValue;
  String? answer;
  bool? isVisible;

  ProductAttributes({this.id, this.attrValue, this.answer, this.isVisible});

  ProductAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attrValue = json['attr_value'] != null ? AttrValue.fromJson(json['attr_value']) : null;
    answer = json['answer'];
    isVisible = json['is_visible'];
  }

  @override
  String toString() {
    return 'ProductAttributes(id: $id, attrValue: $attrValue, answer: $answer, isVisible: $isVisible)';
  }
}

class AttrValue {
  int? id;
  int? attrCategoryId;
  String? name;
  String? icon;
  bool? isVisible;

  AttrValue({this.id, this.attrCategoryId, this.name, this.icon, this.isVisible});

  AttrValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attrCategoryId = json['attr_category_id'];
    name = json['value'] != null ? json['value']['value'] : null;
    icon = json['icon'] != null ? json['icon']['svg'] : null;
    isVisible = json['is_visible'];
  }

  @override
  String toString() {
    return 'AttrValue(id: $id, attrCategoryId: $attrCategoryId, name: $name, icon: $icon, isVisible: $isVisible)';
  }
}

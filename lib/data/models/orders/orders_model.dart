import 'package:flutter/foundation.dart';
import '../cart/cart_model.dart';
import '../in_drive/rider_model.dart';

class OrderModel {
  bool? success;
  String? status;
  String? message;
  List<OrderData>? data;

  OrderModel({this.success, this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(OrderData.fromJson(v));
      });
    }
  }

  OrderModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<OrderData>? data,
  }) {
    return OrderModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }
}

class OrderData {
  int? id;
  num? supTotalPrice;
  num? discountPrice;
  num? couponPrice;
  num? shippingPrice;
  num? inventoryCount;
  String? state;
  num? totalPrice;
  String? userNote;
  String? currency;
  List<Shipping>? shipping;
  List<Reviews>? reviews;
  List<Status>? status;
  String? createdAt;
  String? updated_at;

  OrderData({
    this.id,
    this.supTotalPrice,
    this.discountPrice,
    this.couponPrice,
    this.shippingPrice,
    this.inventoryCount,
    this.state,
    this.totalPrice,
    this.userNote,
    this.currency,
    this.shipping,
    this.reviews,
    this.status,
    this.createdAt,
    this.updated_at,
  });

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supTotalPrice = json['sup_total_price'];
    discountPrice = json['discount_price'];
    couponPrice = json['coupon_price'];
    shippingPrice = json['shipping_price'];
    inventoryCount = json['inventory_count'];
    state = json['state'];
    totalPrice = json['total_price'];
    userNote = json['user_note'];
    currency = json['currency'];
    if (json['shipping'] != null) {
      shipping = <Shipping>[];
      json['shipping'].forEach((v) {
        shipping!.add(Shipping.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(Status.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updated_at = json['updated_at'];
  }

  OrderData copyWith({
    int? id,
    double? supTotalPrice,
    int? discountPrice,
    int? couponPrice,
    double? shippingPrice,
    int? inventoryCount,
    String? state,
    double? totalPrice,
    String? userNote,
    String? createdAt,
    String? updated_at,
    String? currency,
    List<Shipping>? shipping,
    List<Reviews>? reviews,
    List<Status>? status,
  }) {
    return OrderData(
      id: id ?? this.id,
      supTotalPrice: supTotalPrice ?? this.supTotalPrice,
      discountPrice: discountPrice ?? this.discountPrice,
      couponPrice: couponPrice ?? this.couponPrice,
      shippingPrice: shippingPrice ?? this.shippingPrice,
      inventoryCount: inventoryCount ?? this.inventoryCount,
      state: state ?? this.state,
      totalPrice: totalPrice ?? this.totalPrice,
      userNote: userNote ?? this.userNote,
      currency: currency ?? this.currency,
      shipping: shipping ?? this.shipping,
      reviews: reviews ?? this.reviews,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  @override
  bool operator ==(covariant OrderData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.supTotalPrice == supTotalPrice &&
        other.discountPrice == discountPrice &&
        other.couponPrice == couponPrice &&
        other.shippingPrice == shippingPrice &&
        other.inventoryCount == inventoryCount &&
        other.createdAt == createdAt &&
        other.updated_at == updated_at &&
        other.state == state &&
        other.totalPrice == totalPrice &&
        other.userNote == userNote &&
        other.currency == currency &&
        listEquals(other.shipping, shipping) &&
        listEquals(other.reviews, reviews) &&
        listEquals(other.status, status);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        supTotalPrice.hashCode ^
        discountPrice.hashCode ^
        couponPrice.hashCode ^
        shippingPrice.hashCode ^
        inventoryCount.hashCode ^
        state.hashCode ^
        totalPrice.hashCode ^
        userNote.hashCode ^
        currency.hashCode ^
        createdAt.hashCode ^
        updated_at.hashCode ^
        shipping.hashCode ^
        reviews.hashCode ^
        status.hashCode;
  }
}

class ProviderContentModel {
  int? id;
  String? icon;
  String? name;

  ProviderContentModel({this.id, this.icon, this.name});

  ProviderContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

//
class Shipping {
  int? id;
  String? state;
  Vendor? vendor;
  RiderModelData? orderRider;
  Address? source;
  Address? destination;
  int? vendorChatId;
  int? riderChatId;
  String? provider;
  ProviderContentModel? providerContentModel;
  bool? isLocal;
  bool? noProvider;
  String? qrVendor;
  String? qrClient;
  String? canceledReason;
  CartBranch? shippingContent;

  Shipping({
    this.id,
    this.state,
    this.vendor,
    this.orderRider,
    this.source,
    this.destination,
    this.vendorChatId,
    this.riderChatId,
    this.provider,
    this.qrVendor,
    this.qrClient,
    this.canceledReason,
    // this.products,
    this.isLocal,
    this.noProvider,
    this.shippingContent,
    this.providerContentModel,
  });

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    orderRider = json['order_rider'] != null ? RiderModelData.fromJson(json['order_rider']) : null;
    source = json['source'] != null ? Address.fromJson(json['source']) : null;
    destination = json['destination'] != null ? Address.fromJson(json['destination']) : null;
    providerContentModel = json['shipping_provider_content'] != null ? ProviderContentModel.fromJson(json['shipping_provider_content']) : null;
    vendorChatId = json['vendor_chat_id'];
    riderChatId = json['rider_chat_id'];
    isLocal = json['provider'].toString() == 'local';
    noProvider = json['provider'].toString() == 'none';
    provider = isLocal! ? null : json['provider'];
    qrVendor = json['qr_vendor'];
    qrClient = json['qr_client'];
    canceledReason = json['canceled_reason'];
    shippingContent = json['shipping_content'] != null ? CartBranch.fromJson(json['shipping_content']) : null;
  }

  Shipping copyWith({
    int? id,
    String? state,
    Vendor? vendor,
    RiderModelData? orderRider,
    Address? source,
    Address? destination,
    int? vendorChatId,
    int? riderChatId,
    String? provider,
    String? qrVendor,
    String? qrClient,
    String? canceledReason,
    CartBranch? shippingContent,

    // List<Products>? products,
  }) {
    return Shipping(
      id: id ?? this.id,
      state: state ?? this.state,
      vendor: vendor ?? this.vendor,
      orderRider: orderRider ?? this.orderRider,
      source: source ?? this.source,
      destination: destination ?? this.destination,
      vendorChatId: vendorChatId ?? this.vendorChatId,
      riderChatId: riderChatId ?? this.riderChatId,
      provider: provider ?? this.provider,
      qrVendor: qrVendor ?? this.qrVendor,
      qrClient: qrClient ?? this.qrClient,
      canceledReason: canceledReason ?? this.canceledReason,
      shippingContent: shippingContent ?? this.shippingContent,
      // products: products ?? this.products,
    );
  }

  @override
  bool operator ==(covariant Shipping other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.state == state &&
        other.vendor == vendor &&
        other.orderRider == orderRider &&
        other.source == source &&
        other.destination == destination &&
        other.vendorChatId == vendorChatId &&
        other.riderChatId == riderChatId &&
        other.provider == provider &&
        other.qrVendor == qrVendor &&
        other.qrClient == qrClient &&
        other.canceledReason == canceledReason &&
        other.shippingContent == shippingContent;
    // listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        state.hashCode ^
        vendor.hashCode ^
        orderRider.hashCode ^
        source.hashCode ^
        destination.hashCode ^
        vendorChatId.hashCode ^
        riderChatId.hashCode ^
        provider.hashCode ^
        qrVendor.hashCode ^
        qrClient.hashCode ^
        shippingContent.hashCode ^
        canceledReason.hashCode;
    // products.hashCode;
  }
}

class Vendor {
  int? id;
  String? name;
  String? email;
  bool? isEmailVerified;
  String? mobile;
  Image? image;
  String? gender;
  String? birthdate;
  String? fcmToken;
  String? timezone;
  int? nationality;
  Type? type;
  Language? language;
  Currency? currency;
  Address? address;
  Company? company;
  dynamic companyBranch;
  List<Rider>? rider;
  String? token;
  String? tokenExpired;
  Category? category;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;

  Vendor(
      {this.id,
      this.name,
      this.email,
      this.isEmailVerified,
      this.mobile,
      this.image,
      this.gender,
      this.birthdate,
      this.fcmToken,
      this.timezone,
      this.nationality,
      this.type,
      this.language,
      this.currency,
      this.address,
      this.company,
      this.companyBranch,
      this.rider,
      this.token,
      this.tokenExpired,
      this.category,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isEmailVerified = json['is_email_verified'];
    mobile = json['mobile'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    fcmToken = json['fcmToken'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    language = json['language'] != null ? Language.fromJson(json['language']) : null;
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    companyBranch = json['company_branch'];
    if (json['rider'] != null) {
      rider = <Rider>[];
      json['rider'].forEach((v) {
        rider!.add(Rider.fromJson(v));
      });
    }
    token = json['token'];
    tokenExpired = json['token_expired'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['is_email_verified'] = isEmailVerified;
    data['mobile'] = mobile;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['fcmToken'] = fcmToken;
    data['timezone'] = timezone;
    data['nationality'] = nationality;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (language != null) {
      data['language'] = language!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['company_branch'] = companyBranch;
    if (rider != null) {
      data['rider'] = rider!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['token_expired'] = tokenExpired;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    return data;
  }
}

class Image {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  Image({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  Image.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    return data;
  }
}

class Type {
  int? id;
  String? role;
  Name? name;

  Type({this.id, this.role, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}

class Name {
  String? key;
  String? value;

  Name({this.key, this.value});

  Name.fromJson(Map<String, dynamic> json) {
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

class Language {
  int? id;
  String? symbols;
  Name? nameValues;

  Language({this.id, this.symbols, this.nameValues});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    nameValues = json['name_values'] != null ? Name.fromJson(json['name_values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (nameValues != null) {
      data['name_values'] = nameValues!.toJson();
    }
    return data;
  }
}

class Currency {
  int? id;
  num? dollar;
  String? symbols;
  Name? name;
  bool? isVisible;

  Currency({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dollar = json['dollar'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dollar'] = dollar;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class Address {
  int? id;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;
  CityId? cityId;

  Address(
      {this.id,
      this.latitude,
      this.longitude,
      this.state,
      this.street,
      this.building,
      this.intercom,
      this.floor,
      this.zipcode,
      this.detailedAddress,
      this.cityId});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    cityId = json['city_id'] != null ? CityId.fromJson(json['city_id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    if (cityId != null) {
      data['city_id'] = cityId!.toJson();
    }
    return data;
  }
}

class CityId {
  int? id;
  String? symbols;
  Name? name;
  CountryId? countryId;
  bool? isVisible;

  CityId({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  CityId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    countryId = json['country_id'] != null ? CountryId.fromJson(json['country_id']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (countryId != null) {
      data['country_id'] = countryId!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class CountryId {
  int? id;
  String? symbols;
  Name? name;
  Name? nationality;
  Language? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  CountryId({this.id, this.symbols, this.name, this.nationality, this.defaultLanguage, this.flag, this.isVisible});

  CountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    nationality = json['nationality'] != null ? Name.fromJson(json['nationality']) : null;
    defaultLanguage = json['default_language'] != null ? Language.fromJson(json['default_language']) : null;
    flag = json['flag'] != null ? Flag.fromJson(json['flag']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (nationality != null) {
      data['nationality'] = nationality!.toJson();
    }
    if (defaultLanguage != null) {
      data['default_language'] = defaultLanguage!.toJson();
    }
    if (flag != null) {
      data['flag'] = flag!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }
}

class Flag {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;

  Flag({this.s16px, this.s32px, this.s64px, this.s128px});

  Flag.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    return data;
  }
}

class Company {
  int? id;
  Name? name;
  Name? description;
  Image? logo;
  List<CoverPhotos>? coverPhotos;
  SocialLinks? socialLinks;
  Emails? emails;
  List<String>? hotlines;
  List<Commercial>? commercial;
  double? review;
  bool? isLock;
  dynamic lockReason;
  Owner? owner;
  Agent? agent;
  Packages? packages;
  int? packagesEndAt;

  Company(
      {this.id,
      this.name,
      this.description,
      this.logo,
      this.coverPhotos,
      this.socialLinks,
      this.emails,
      this.hotlines,
      this.commercial,
      this.review,
      this.isLock,
      this.lockReason,
      this.owner,
      this.agent,
      this.packages,
      this.packagesEndAt});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    logo = json['logo'] != null ? Image.fromJson(json['logo']) : null;
    if (json['cover_photos'] != null) {
      coverPhotos = <CoverPhotos>[];
      json['cover_photos'].forEach((v) {
        coverPhotos!.add(CoverPhotos.fromJson(v));
      });
    }
    socialLinks = json['social_links'] != null ? SocialLinks.fromJson(json['social_links']) : null;
    emails = json['emails'] != null ? Emails.fromJson(json['emails']) : null;

    review = json['review'];
    isLock = json['is_lock'];
    lockReason = json['lock_reason'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    agent = json['agent'] != null ? Agent.fromJson(json['agent']) : null;
    packages = json['packages'] != null ? Packages.fromJson(json['packages']) : null;
    packagesEndAt = json['packages_end_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    if (coverPhotos != null) {
      data['cover_photos'] = coverPhotos!.map((v) => v.toJson()).toList();
    }
    if (socialLinks != null) {
      data['social_links'] = socialLinks!.toJson();
    }
    if (emails != null) {
      data['emails'] = emails!.toJson();
    }
    data['hotlines'] = hotlines;
    if (commercial != null) {
      data['commercial'] = commercial!.map((v) => v.toJson()).toList();
    }
    data['review'] = review;
    data['is_lock'] = isLock;
    data['lock_reason'] = lockReason;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (agent != null) {
      data['agent'] = agent!.toJson();
    }
    if (packages != null) {
      data['packages'] = packages!.toJson();
    }
    data['packages_end_at'] = packagesEndAt;
    return data;
  }
}

class CoverPhotos {
  String? s128px;
  String? s256px;
  String? s512px;
  String? s1024px;

  CoverPhotos({this.s128px, this.s256px, this.s512px, this.s1024px});

  CoverPhotos.fromJson(Map<String, dynamic> json) {
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
    s1024px = json['1024px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    data['1024px'] = s1024px;
    return data;
  }
}

class SocialLinks {
  String? hwggw;

  SocialLinks({this.hwggw});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    hwggw = json['hwggw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hwggw'] = hwggw;
    return data;
  }
}

class Emails {
  String? nbb;

  Emails({this.nbb});

  Emails.fromJson(Map<String, dynamic> json) {
    nbb = json['nbb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nbb'] = nbb;
    return data;
  }
}

class Commercial {
  String? id;
  String? key;
  String? file;

  Commercial({this.id, this.key, this.file});

  Commercial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['file'] = file;
    return data;
  }
}

class Owner {
  int? id;
  String? name;
  String? email;
  String? mobile;
  Image? image;
  String? gender;
  String? birthdate;
  String? timezone;
  int? nationality;
  int? typeId;
  int? langId;
  int? currencyId;
  AddressId? addressId;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;

  Owner(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.image,
      this.gender,
      this.birthdate,
      this.timezone,
      this.nationality,
      this.typeId,
      this.langId,
      this.currencyId,
      this.addressId,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address'] != null ? AddressId.fromJson(json['address']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['timezone'] = timezone;
    data['nationality'] = nationality;
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    if (addressId != null) {
      data['address'] = addressId!.toJson();
    }
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    return data;
  }
}

class AddressId {
  int? id;
  int? userId;
  int? cityId;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;
  String? createdAt;
  String? updatedAt;

  AddressId(
      {this.id,
      this.userId,
      this.cityId,
      this.latitude,
      this.longitude,
      this.state,
      this.street,
      this.building,
      this.intercom,
      this.floor,
      this.zipcode,
      this.detailedAddress,
      this.createdAt,
      this.updatedAt});

  AddressId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    // cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['city_id'] = cityId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Agent {
  int? id;
  String? name;
  String? email;
  String? mobile;
  Image? image;
  String? gender;
  String? birthdate;
  String? timezone;
  dynamic nationality;
  int? typeId;
  int? langId;
  int? currencyId;
  AddressId? addressId;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;

  Agent(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.image,
      this.gender,
      this.birthdate,
      this.timezone,
      this.nationality,
      this.typeId,
      this.langId,
      this.currencyId,
      this.addressId,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address'] != null ? AddressId.fromJson(json['address']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['timezone'] = timezone;
    data['nationality'] = nationality;
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    if (addressId != null) {
      data['address'] = addressId!.toJson();
    }
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    return data;
  }
}

class Packages {
  int? id;
  String? code;
  int? subscribeDays;
  String? price;
  Name? name;
  Name? description;
  CompanyType? companyType;

  Packages({this.id, this.code, this.subscribeDays, this.price, this.name, this.description, this.companyType});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    subscribeDays = json['subscribe_days'];
    price = json['price'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    companyType = json['company_type'] != null ? CompanyType.fromJson(json['company_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['subscribe_days'] = subscribeDays;
    data['price'] = price;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (companyType != null) {
      data['company_type'] = companyType!.toJson();
    }
    return data;
  }
}

class CompanyType {
  int? id;
  String? key;
  Name? name;
  Icons? icons;

  CompanyType({this.id, this.key, this.name, this.icons});

  CompanyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    icons = json['icons'] != null ? Icons.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    return data;
  }
}

class Icons {
  String? svg;

  Icons({this.svg});

  Icons.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    return data;
  }
}

class Category {
  int? id;
  Name? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}

class OrderRider {
  int? id;
  String? name;
  String? email;
  bool? isEmailVerified;
  String? mobile;
  Image? image;
  String? gender;
  String? birthdate;
  String? fcmToken;
  String? timezone;
  int? nationality;
  Type? type;
  Language? language;
  Currency? currency;
  Address? address;
  dynamic company;
  dynamic companyBranch;
  List<Rider>? rider;
  String? token;
  String? tokenExpired;
  dynamic category;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;

  OrderRider(
      {this.id,
      this.name,
      this.email,
      this.isEmailVerified,
      this.mobile,
      this.image,
      this.gender,
      this.birthdate,
      this.fcmToken,
      this.timezone,
      this.nationality,
      this.type,
      this.language,
      this.currency,
      this.address,
      this.company,
      this.companyBranch,
      this.rider,
      this.token,
      this.tokenExpired,
      this.category,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  OrderRider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isEmailVerified = json['is_email_verified'];
    mobile = json['mobile'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    fcmToken = json['fcmToken'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    language = json['language'] != null ? Language.fromJson(json['language']) : null;
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    company = json['company'];
    companyBranch = json['company_branch'];
    if (json['rider'] != null) {
      rider = <Rider>[];
      json['rider'].forEach((v) {
        rider!.add(Rider.fromJson(v));
      });
    }
    token = json['token'];
    tokenExpired = json['token_expired'];
    category = json['category'];
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['is_email_verified'] = isEmailVerified;
    data['mobile'] = mobile;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['fcmToken'] = fcmToken;
    data['timezone'] = timezone;
    data['nationality'] = nationality;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (language != null) {
      data['language'] = language!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['company'] = company;
    data['company_branch'] = companyBranch;
    if (rider != null) {
      data['rider'] = rider!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['token_expired'] = tokenExpired;
    data['category'] = category;
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    return data;
  }
}

class Rider {
  int? id;
  int? attributeId;
  String? key;
  String? type;
  String? keyboard;
  Name? placeholder;
  List<AnswerCollections>? answerCollections;

  Rider({this.id, this.attributeId, this.key, this.type, this.keyboard, this.placeholder, this.answerCollections});

  Rider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    key = json['key'];
    type = json['type'];
    keyboard = json['keyboard'];
    placeholder = json['placeholder'] != null ? Name.fromJson(json['placeholder']) : null;
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
    data['keyboard'] = keyboard;
    if (placeholder != null) {
      data['placeholder'] = placeholder!.toJson();
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
  String? value;

  AnswerCollections({this.key, this.placeholder, this.value});

  AnswerCollections.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    placeholder = (json['placeholder'] != null && json['placeholder'].toString().isNotEmpty) ? json['placeholder']["value"] : null;

    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    // if (placeholder != null) {
    //   data['placeholder'] = placeholder!.toJson();
    // }
    data['value'] = value;
    return data;
  }
}

class AmountCollection {
  int? id;
  String? branch;
  int? branchId;
  int? productMenuId;
  int? amount;

  AmountCollection({this.id, this.branch, this.branchId, this.productMenuId, this.amount});

  AmountCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch = json['branch'];
    branchId = json['branch_id'];
    productMenuId = json['product_menu_id'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['branch'] = branch;
    data['branch_id'] = branchId;
    data['product_menu_id'] = productMenuId;
    data['amount'] = amount;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['64px'] = s64px;
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    data['1024px'] = s1024px;
    return data;
  }
}

class Review {
  int? id;
  int? rate;
  String? comment;
  bool? isVisible;

  Review({this.id, this.rate, this.comment, this.isVisible});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    comment = json['comment'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate'] = rate;
    data['comment'] = comment;
    data['is_visible'] = isVisible;
    return data;
  }
}

class Reviews {
  int? id;
  User? user;
  String? type;
  String? note;
  int? rate;

  Reviews({this.id, this.user, this.type, this.note, this.rate});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    type = json['type'];
    note = json['note'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['type'] = type;
    data['note'] = note;
    data['rate'] = rate;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? mobile;
  dynamic mobileVerifiedAt;
  String? verifyToken;
  Image? image;
  String? fcmToken;
  dynamic otpToken;
  String? timezone;
  String? gender;
  String? birthdate;
  int? typeId;
  int? langId;
  int? currencyId;
  int? addressId;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;
  String? token;
  String? tokenExpired;
  dynamic nationalityId;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.mobile,
      this.mobileVerifiedAt,
      this.verifyToken,
      this.image,
      this.fcmToken,
      this.otpToken,
      this.timezone,
      this.gender,
      this.birthdate,
      this.typeId,
      this.langId,
      this.currencyId,
      this.addressId,
      this.isOnline,
      this.isBlocked,
      this.blockReason,
      this.token,
      this.tokenExpired,
      this.nationalityId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    mobileVerifiedAt = json['mobile_verified_at'];
    verifyToken = json['verify_token'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    fcmToken = json['fcmToken'];
    otpToken = json['otpToken'];
    timezone = json['timezone'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address_id'];
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
    token = json['token'];
    tokenExpired = json['token_expired'];
    nationalityId = json['nationality_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['mobile'] = mobile;
    data['mobile_verified_at'] = mobileVerifiedAt;
    data['verify_token'] = verifyToken;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['fcmToken'] = fcmToken;
    data['otpToken'] = otpToken;
    data['timezone'] = timezone;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    data['address_id'] = addressId;
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    data['token'] = token;
    data['token_expired'] = tokenExpired;
    data['nationality_id'] = nationalityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Status {
  int? id;
  User? user;
  int? orderId;
  String? state;

  Status({this.id, this.user, this.orderId, this.state});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    orderId = json['order_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['order_id'] = orderId;
    data['state'] = state;
    return data;
  }
}

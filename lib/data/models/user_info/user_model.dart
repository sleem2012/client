// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:forall_client/data/models/ads/ads_model.dart' hide Iconss;
import 'package:forall_client/data/models/global/location/adresses/adress_model.dart';
import 'package:forall_client/data/models/services/category_model.dart';
import 'package:forall_client/data/models/services/service_type.dart';
import 'package:forall_client/packages/extensions.dart';

class UserModel {
  bool? success;
  String? status;
  String? message;
  UserModelData? data;

  UserModel({this.success, this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  UserModel copyWith({
    bool? success,
    String? status,
    String? message,
    UserModelData? data,
  }) {
    return UserModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class UserModelData {
  int? id;
  String? name;
  String? email;
  Name? category;

  String? mobile;
  UserImage? image;
  String? gender;
  String? birthdate;
  UserRole? type;
  UserLanguage? language;
  UserCurrency? currency;
  AddressData? address;
  UserCompany? company;
  String? token;
  bool? is_email_verified;
  String? tokenExpired;
  String? plateNumber;
  String? carModel;
  List<DriverAttribute>? driverAttribute;

  UserModelData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.category,
    this.gender,
    this.birthdate,
    this.type,
    this.language,
    this.currency,
    this.address,
    this.company,
    this.token,
    this.tokenExpired,
    this.driverAttribute,
    this.is_email_verified,
    this.plateNumber,
  });

  UserModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
    gender = json['gender'];
    is_email_verified = json['is_email_verified'];
    birthdate = json['birthdate'];
    type = json['type'] != null ? UserRole.fromJson(json['type']) : null;
    category = json['category'] != null ? Name.fromJson(json['category']) : null;
    language = json['language'] != null ? UserLanguage.fromJson(json['language']) : null;
    currency = json['currency'] != null ? UserCurrency.fromJson(json['currency']) : null;
    address = json['address'] != null ? AddressData.fromJson(json['address']) : null;
    company = json['company'] != null ? UserCompany.fromJson(json['company']) : null;
    token = json['token'];
    tokenExpired = json['token_expired'];
    if (json['rider'] != null) {
      driverAttribute = <DriverAttribute>[];
      json['rider'].forEach((v) {
        driverAttribute!.add(DriverAttribute.fromJson(v));
      });
    } else {
      driverAttribute = <DriverAttribute>[];
    }

    final ln = driverAttribute?.firstWhereOrNull((element) => element.key == 'plateLetterLeft');
    final mid = driverAttribute?.firstWhereOrNull((element) => element.key == 'plateLetterMiddle');
    final rn = driverAttribute?.firstWhereOrNull((element) => element.key == 'plateLetterRight');
    final n = driverAttribute?.firstWhereOrNull((element) => element.key == 'plateNumber');

    final left = ln?.answerCollections?.firstOrNull?.value ?? "";
    final midL = mid?.answerCollections?.firstOrNull?.value ?? '';
    final right = rn?.answerCollections?.firstOrNull?.value ?? '';
    final number = n?.answerCollections?.firstOrNull?.value ?? '';
    plateNumber = left + midL + right + number;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
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

    data['token'] = token;
    data['token_expired'] = tokenExpired;

    return data;
  }

  UserModelData copyWith({
    int? id,
    String? name,
    Name? category,
    String? email,
    String? mobile,
    UserImage? image,
    String? gender,
    String? birthdate,
    UserRole? type,
    UserLanguage? language,
    UserCurrency? currency,
    AddressData? address,
    UserCompany? company,
    String? token,
    String? tokenExpired,
  }) {
    return UserModelData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      category: category ?? this.category,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      type: type ?? this.type,
      language: language ?? this.language,
      currency: currency ?? this.currency,
      address: address ?? this.address,
      company: company ?? this.company,
      token: token ?? this.token,
      tokenExpired: tokenExpired ?? this.tokenExpired,
    );
  }
}

class UserImage {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  UserImage({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  UserImage.fromJson(Map<String, dynamic> json) {
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

class UserRole {
  int? id;
  String? role;
  Name? name;

  UserRole({this.id, this.role, this.name});

  UserRole.fromJson(Map<String, dynamic> json) {
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

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}

class UserLanguage {
  int? id;
  String? symbols;
  Name? nameValues;

  UserLanguage({this.id, this.symbols, this.nameValues});

  UserLanguage.fromJson(Map<String, dynamic> json) {
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

class UserCurrency {
  int? id;
  double? dollar;
  String? symbols;
  Name? name;
  bool? isVisible;

  UserCurrency({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  UserCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // dollar = double.parse(json['dollar'].toString());
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

class DriverAttribute {
  int? id;
  int? attributeId;
  String? key;
  String? placeholder;
  String? type;
  List<AnswerCollections>? answerCollections;

  DriverAttribute({this.id, this.attributeId, this.key, this.placeholder, this.answerCollections});

  DriverAttribute.fromJson(Map<String, dynamic> json) {
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
    data['placeholder'] = {"value": placeholder};
    data['value'] = value;
    return data;
  }
}

class AddressCity {
  int? id;
  String? symbols;
  Name? name;
  AddressCountryId? countryId;
  bool? isVisible;

  AddressCity({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  AddressCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    countryId = json['country_id'] != null ? AddressCountryId.fromJson(json['country_id']) : null;
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

class AddressCountryId {
  int? id;
  String? symbols;
  Name? name;
  UserLanguage? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  AddressCountryId({this.id, this.symbols, this.name, this.defaultLanguage, this.flag, this.isVisible});

  AddressCountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    defaultLanguage = json['default_language'] != null ? UserLanguage.fromJson(json['default_language']) : null;
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

class UserCompany {
  int? id;
  Name? name;
  Name? description;
  Logo? logo;
  SocialLinks? socialLinks;
  Emails? emails;
  Hotlines? hotlines;
  num? companyReview;
  bool? isLock;
  String? lockReason;
  Owner? owner;
  Packages? packages;
  List<CategoryModel>? category;
  String? category_name;
  num? packagesEndAt;
  List<Logo>? coverPhotos;

  UserCompany({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.coverPhotos,
    this.socialLinks,
    this.emails,
    this.hotlines,
    this.companyReview,
    this.isLock,
    this.lockReason,
    this.owner,
    this.packages,
    this.packagesEndAt,
    this.category,
    this.category_name,
  });

  UserCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    if (json['cover_photos'] != null) {
      List<Logo> list = [];
      for (var element in (json['cover_photos'] as List)) {
        list.add(Logo.fromJson(element));
      }
      coverPhotos = list;
    }
    if (json['categories'] != null) {
      List<CategoryModel> list = [];
      for (var element in (json['categories'] as List)) {
        list.add(CategoryModel.fromJson(element));
      }
      category = list;
    }
    category_name = json["category"] != null ? (json["category"]?['name']?['value']) : null;
    socialLinks = json['social_links'] != null ? SocialLinks.fromJson(json['social_links']) : null;
    emails = json['emails'] != null ? Emails.fromJson(json['emails']) : null;
    hotlines = json['hotlines'] != null ? Hotlines.fromJson(json['hotlines']) : null;
    companyReview = json['review'];
    isLock = json['is_lock'];
    lockReason = json['lock_reason'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    packages = json['packages'] != null ? Packages.fromJson(json['packages']) : null;
    packagesEndAt = json['packages_end_at'];
  }

  UserCompany copyWith({
    int? id,
    Name? name,
    Name? description,
    Logo? logo,
    SocialLinks? socialLinks,
    Emails? emails,
    Hotlines? hotlines,
    double? review,
    bool? isLock,
    String? lockReason,
    Owner? owner,
    Packages? packages,
    num? packagesEndAt,
  }) {
    return UserCompany(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logo: logo ?? this.logo,
      socialLinks: socialLinks ?? this.socialLinks,
      emails: emails ?? this.emails,
      hotlines: hotlines ?? this.hotlines,
      companyReview: review ?? companyReview,
      isLock: isLock ?? this.isLock,
      lockReason: lockReason ?? this.lockReason,
      owner: owner ?? this.owner,
      packages: packages ?? this.packages,
      packagesEndAt: packagesEndAt ?? this.packagesEndAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'logo': logo,
      'socialLinks': socialLinks,
      'emails': emails,
      'hotlines': hotlines,
      'companyReview': companyReview,
      'isLock': isLock,
      'lockReason': lockReason,
      'owner': owner,
      'packages': packages,
      'category': category,
      'category_name': category_name,
      'packagesEndAt': packagesEndAt,
      'coverPhotos': coverPhotos,
    };
  }
}

class Logo {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  Logo({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  Logo.fromJson(Map<String, dynamic> json) {
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

class Packages {
  int? id;
  CompanyType? companyType;
  String? code;
  double? cost;
  double? tax;
  double? fees;
  Name? name;
  Name? description;
  Currency? currency;

  Packages({this.id, this.code, this.cost, this.tax, this.fees, this.name, this.description, this.currency, this.companyType});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    cost = double.tryParse(json['cost'].toString());
    tax = double.tryParse(json['tax'].toString());
    fees = double.tryParse(json['fees'].toString());
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    companyType = json['company_type'] != null ? CompanyType.fromJson(json['company_type']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['cost'] = cost;
    data['tax'] = tax;
    data['fees'] = fees;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }

    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }
}

class Currency {
  int? id;
  double? dollar;
  String? symbols;
  Name? name;
  bool? isVisible;

  Currency({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dollar = double.parse(json['dollar'].toString());
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

class CompanyType {
  int? id;
  String? key;
  String? name;
  String? icons;
  ServiceType? type;

  CompanyType({this.id, this.key, this.name, this.icons});

  CompanyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    type = ServiceType.fromStr(json['type'].toString());
    name = json['name'] != null ? json['name']["value"] : null;
    icons = json['icons'] != null ? json['icons']["svg"] : null;
  }
}


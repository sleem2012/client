// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:forall_client/data/models/user_info/user_model.dart';

import '../branch/branch_model.dart';

class CompanyModel {
  bool? success;
  String? status;
  String? message;
  List<UserCompany>? data;
  Pagination? pagination;

  CompanyModel({
    this.success,
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserCompany>[];
      json['data'].forEach((v) {
        data!.add(UserCompany.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }


  @override
  bool operator ==(covariant CompanyModel other) {
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

  CompanyModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<UserCompany>? data,
    Pagination? pagination,
  }) {
    return CompanyModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }
}

class AdsData {
  int? id;
  Name? name;
  Name? description;
  Logo? logo;
  SocialLinks? socialLinks;
  Emails? emails;
  Hotlines? hotlines;
  double? review;
  bool? isLock;
  String? lockReason;
  Owner? owner;
  Packages? packages;
  int? packagesEndAt;

  AdsData(
      {this.id,
        this.name,
        this.description,
        this.logo,
        this.socialLinks,
        this.emails,
        this.hotlines,
        this.review,
        this.isLock,
        this.lockReason,
        this.owner,
        this.packages,
        this.packagesEndAt});

  AdsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    socialLinks = json['social_links'] != null
        ? SocialLinks.fromJson(json['social_links'])
        : null;
    emails =
    json['emails'] != null ? Emails.fromJson(json['emails']) : null;
    hotlines = json['hotlines'] != null
        ? Hotlines.fromJson(json['hotlines'])
        : null;
    // if (json['commercial'] != null) {
    //   commercial = <Null>[];
    //   json['commercial'].forEach((v) {
    //     commercial!.add(Null.fromJson(v));
    //   });
    // }
    review = json['review'];
    isLock = json['is_lock'];
    lockReason = json['lock_reason'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    packages = json['packages'] != null
        ? Packages.fromJson(json['packages'])
        : null;
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
    if (socialLinks != null) {
      data['social_links'] = socialLinks!.toJson();
    }
    if (emails != null) {
      data['emails'] = emails!.toJson();
    }
    if (hotlines != null) {
      data['hotlines'] = hotlines!.toJson();
    }
    // if (commercial != null) {
    //   data['commercial'] = commercial!.map((v) => v.toJson()).toList();
    // }
    data['review'] = review;
    data['is_lock'] = isLock;
    data['lock_reason'] = lockReason;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (packages != null) {
      data['packages'] = packages!.toJson();
    }
    data['packages_end_at'] = packagesEndAt;
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

class Logo {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  Logo(
      {this.s16px,
        this.s32px,
        this.s64px,
        this.s128px,
        this.s256px,
        this.s512px});

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

class SocialLinks {
  String? youTube;
  String? twitter;
  String? website;
  String? whatsApp;
  String? facebook;
  String? linkedin;
  String? snapchat;
  String? instagram;
  String? companyMobile;

  SocialLinks(
      {this.youTube,
        this.twitter,
        this.website,
        this.whatsApp,
        this.facebook,
        this.linkedin,
        this.snapchat,
        this.instagram,
        this.companyMobile});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    youTube = json['YouTube'];
    twitter = json['twitter'];
    website = json['website'];
    whatsApp = json['WhatsApp'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    snapchat = json['snapchat'];
    instagram = json['instagram'];
    companyMobile = json['company_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['YouTube'] = youTube;
    data['twitter'] = twitter;
    data['website'] = website;
    data['WhatsApp'] = whatsApp;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['snapchat'] = snapchat;
    data['instagram'] = instagram;
    data['company_mobile'] = companyMobile;
    return data;
  }
}

class Emails {
  String? sales;
  String? contact;
  String? recruitment;

  Emails({this.sales, this.contact, this.recruitment});

  Emails.fromJson(Map<String, dynamic> json) {
    sales = json['sales'];
    contact = json['contact'];
    recruitment = json['recruitment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sales'] = sales;
    data['contact'] = contact;
    data['recruitment'] = recruitment;
    return data;
  }
}

class Hotlines {
  String? founded;
  String? founders;
  String? headquarters;
  String? subsidiaries;
  String? branchesNumbers;
  String? locationsNumbers;

  Hotlines(
      {this.founded,
        this.founders,
        this.headquarters,
        this.subsidiaries,
        this.branchesNumbers,
        this.locationsNumbers});

  Hotlines.fromJson(Map<String, dynamic> json) {
    founded = json['founded'];
    founders = json['founders'];
    headquarters = json['headquarters'];
    subsidiaries = json['subsidiaries'];
    branchesNumbers = json['branches_numbers'];
    locationsNumbers = json['locations_numbers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['founded'] = founded;
    data['founders'] = founders;
    data['headquarters'] = headquarters;
    data['subsidiaries'] = subsidiaries;
    data['branches_numbers'] = branchesNumbers;
    data['locations_numbers'] = locationsNumbers;
    return data;
  }
}

class Owner {
  int? id;
  String? name;
  String? email;
  String? mobile;
  Logo? image;
  String? gender;
  String? birthdate;
  String? timezone;
  int? typeId;
  int? langId;
  int? currencyId;
  AddressId? addressId;
  bool? isOnline;
  bool? isBlocked;

  Owner(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.image,
        this.gender,
        this.birthdate,
        this.timezone,
        this.typeId,
        this.langId,
        this.currencyId,
        this.addressId,
        this.isOnline,
        this.isBlocked,
        });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? Logo.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    timezone = json['timezone'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address'] != null
        ? AddressId.fromJson(json['address'])
        : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
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
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    if (addressId != null) {
      data['address'] = addressId!.toJson();
    }
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
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

  Packages(
      {this.id,
        this.code,
        this.subscribeDays,
        this.price,
        this.name,
        this.description,
        this.companyType});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    subscribeDays = json['subscribe_days'];
    price = json['price'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
    companyType = json['company_type'] != null
        ? CompanyType.fromJson(json['company_type'])
        : null;
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
  Iconss? icons;

  CompanyType({this.id, this.key, this.name, this.icons});

  CompanyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    icons = json['icons'] != null ? Iconss.fromJson(json['icons']) : null;
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

class Iconss {
  String? svg;

  Iconss({this.svg});

  Iconss.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    return data;
  }
}

class Pagination {
  Links? links;
  Meta? meta;

  Pagination({this.links, this.meta});

  Pagination.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Links {
  String? first;
  String? next;

  Links({this.first, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? to;
  String? perPage;
  int? total;

  Meta({this.currentPage, this.from, this.to, this.perPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    to = json['to'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['to'] = to;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}

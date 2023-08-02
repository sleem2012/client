// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:forall_client/data/models/user_info/user_model.dart';

class JobModel {
  bool? success;
  String? status;
  String? message;
  List<JobData>? data;

  JobModel({this.success, this.status, this.message, this.data});

  JobModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <JobData>[];
      json['data'].forEach((v) {
        data!.add(JobData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  JobModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<JobData>? data,
  }) {
    return JobModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant JobModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.status == status &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^
    status.hashCode ^
    message.hashCode ^
    data.hashCode;
  }
}

class JobData {
  int? id;
  String? title;
  String? state;
  int? positions;
  String? experienceYears;
  Description? description;
  Description? requirements;
  String? salary;
  String? experience;
  String? employmentType;
  String? workPlace;
  String? educational;
  AddressId? addressId;
  List<Appliers>? appliers;
  Categories? categories;
  String? closedAt;
  UserCompany? company;
  bool? isApplied;
  Counter? counter;


  JobData({
    this.id,
    this.title,
    this.state,
    this.positions,
    this.experienceYears,
    this.description,
    this.requirements,
    this.salary,
    this.experience,
    this.employmentType,
    this.workPlace,
    this.educational,
    this.addressId,
    this.appliers,
    this.categories,
    this.closedAt,
    this.counter,
    this.company,this.isApplied,
  });

  JobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    state = json['state'];
    positions = json['positions'];
    experienceYears = json['experience_years'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    company =
    json['company'] != null ? UserCompany.fromJson(json['company']) : null;
    requirements = json['requirements'] != null
        ? Description.fromJson(json['requirements'])
        : null;
    counter = json['counter'] != null ? Counter.fromJson(json['counter']) : null;
    salary = json['salary'];
    isApplied = json['has_applied'];
    experience = json['experience'];
    employmentType = json['employment_type'];
    workPlace = json['work_place'];
    educational = json['educational'];
    addressId = json['address'] != null
        ? AddressId.fromJson(json['address'])
        : null;
    if (json['appliers'] != null) {
      appliers = <Appliers>[];
      json['appliers'].forEach((v) {
        appliers!.add(Appliers.fromJson(v));
      });
    }
    categories = json['categories'] != null
        ? Categories.fromJson(json['categories'])
        : null;
    closedAt = json['closed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['state'] = state;
    data['positions'] = positions;
    data['experience_years'] = experienceYears;
    if (description != null) {
      data['description'] = description!.toJson();
    }

    if (requirements != null) {
      data['requirements'] = requirements!.toJson();
    }
    data['salary'] = salary;
    data['has_applied'] = isApplied;
    data['experience'] = experience;
    data['employment_type'] = employmentType;
    data['work_place'] = workPlace;
    data['educational'] = educational;
    if (addressId != null) {
      data['address'] = addressId!.toJson();
    }
    if (appliers != null) {
      data['appliers'] = appliers!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.toJson();
    }
    data['closed_at'] = closedAt;
    return data;
  }

  JobData copyWith({
    int? id,
    String? title,
    String? state,
    int? positions,
    String? experienceYears,
    Description? description,
    Description? requirements,
    String? salary,
    String? experience,
    String? employmentType,
    String? workPlace,
    String? educational,
    AddressId? addressId,
    bool? isApplied,
    List<Appliers>? appliers,
    Categories? categories,
    String? closedAt,
    UserCompany? company,

  }) {
    return JobData(
      id: id ?? this.id,
      title: title ?? this.title,
      state: state ?? this.state,
      positions: positions ?? this.positions,
      experienceYears: experienceYears ?? this.experienceYears,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      salary: salary ?? this.salary,
      experience: experience ?? this.experience,
      employmentType: employmentType ?? this.employmentType,
      workPlace: workPlace ?? this.workPlace,
      educational: educational ?? this.educational,
      addressId: addressId ?? this.addressId,
      appliers: appliers ?? this.appliers,
      categories: categories ?? this.categories,
      closedAt: closedAt ?? this.closedAt,
      company: company ?? this.company,
      isApplied: isApplied ?? this.isApplied,
    );
  }

  @override
  bool operator ==(covariant JobData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.state == state &&
        other.isApplied == isApplied &&
        other.positions == positions &&
        other.experienceYears == experienceYears &&
        other.description == description &&
        other.requirements == requirements &&
        other.salary == salary &&
        other.experience == experience &&
        other.employmentType == employmentType &&
        other.workPlace == workPlace &&
        other.educational == educational &&
        other.addressId == addressId &&
        listEquals(other.appliers, appliers) &&
        other.categories == categories &&
        other.closedAt == closedAt &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    title.hashCode ^
    state.hashCode ^
    positions.hashCode ^
    experienceYears.hashCode ^
    description.hashCode ^
    requirements.hashCode ^
    salary.hashCode ^
    experience.hashCode ^
    employmentType.hashCode ^
    workPlace.hashCode ^
    educational.hashCode ^
    addressId.hashCode ^
    appliers.hashCode ^
    categories.hashCode ^
    closedAt.hashCode ^
    isApplied.hashCode ^
    company.hashCode;
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
  String? bjedbj;
  String? facebook;
  String? hgggg;

  SocialLinks({this.bjedbj, this.facebook, this.hgggg});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    bjedbj = json['bjedbj'];
    facebook = json['facebook'];
    hgggg = json['hgggg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bjedbj'] = bjedbj;
    data['facebook'] = facebook;
    data['hgggg'] = hgggg;
    return data;
  }
}

class Emails {
  String? vjdejv;
  String? support;
  String? jgg;

  Emails({this.vjdejv, this.support, this.jgg});

  Emails.fromJson(Map<String, dynamic> json) {
    vjdejv = json['vjdejv'];
    support = json['support'];
    jgg = json['jgg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vjdejv'] = vjdejv;
    data['support'] = support;
    data['jgg'] = jgg;
    return data;
  }
}

class Description {
  String? key;
  String? value;

  Description({this.key, this.value});

  Description.fromJson(Map<String, dynamic> json) {
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

class AddressId {
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

  AddressId(
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

  AddressId.fromJson(Map<String, dynamic> json) {
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
  Description? name;
  CountryId? countryId;
  bool? isVisible;

  CityId({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  CityId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Description.fromJson(json['name']) : null;
    countryId = json['country_id'] != null
        ? CountryId.fromJson(json['country_id'])
        : null;
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
  Description? name;

  bool? isVisible;

  CountryId({this.id, this.symbols, this.name, this.isVisible});

  CountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Description.fromJson(json['name']) : null;

    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }

    data['is_visible'] = isVisible;
    return data;
  }
}

class Appliers {
  int? id;
  int? jobId;
  JobCvId? jobCvId;
  String? state;
  String? vendorNote;
  bool? isVisible;
  bool? isRead;
  String? createdAt;

  Appliers(
      {this.id,
        this.jobId,
        this.jobCvId,
        this.state,
        this.vendorNote,
        this.isVisible,
        this.isRead,
        this.createdAt});

  Appliers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobCvId =
    json['job_cv_id'] != null ? JobCvId.fromJson(json['job_cv_id']) : null;
    state = json['state'];
    vendorNote = json['vendor_note'];
    isVisible = json['is_visible'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    if (jobCvId != null) {
      data['job_cv_id'] = jobCvId!.toJson();
    }
    data['state'] = state;
    data['vendor_note'] = vendorNote;
    data['is_visible'] = isVisible;
    data['is_read'] = isRead;
    data['created_at'] = createdAt;
    return data;
  }
}

class JobCvId {
  int? id;
  String? cv;
  User? user;
  String? createdAt;

  JobCvId({this.id, this.cv, this.user, this.createdAt});

  JobCvId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cv = json['cv'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cv'] = cv;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  Image? image;
  String? gender;
  String? birthdate;
  String? timezone;
  AddressId? addressId;
  bool? isOnline;
  bool? isBlocked;
  String? blockReason;

  User(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.image,
        this.gender,
        this.birthdate,
        this.timezone,
        this.addressId,
        this.isOnline,
        this.isBlocked,
        this.blockReason});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    timezone = json['timezone'];
    addressId = json['address'] != null
        ? AddressId.fromJson(json['address'])
        : null;
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
    if (addressId != null) {
      data['address'] = addressId!.toJson();
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

  Image(
      {this.s16px,
        this.s32px,
        this.s64px,
        this.s128px,
        this.s256px,
        this.s512px});

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

class Categories {
  Category? category;
  List<SkillsCollection>? skillsCollection;

  Categories({this.category, this.skillsCollection});

  Categories.fromJson(Map<String, dynamic> json) {
    category =
    json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['skills_collection'] != null) {
      skillsCollection = <SkillsCollection>[];
      json['skills_collection'].forEach((v) {
        skillsCollection!.add(SkillsCollection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (skillsCollection != null) {
      data['skills_collection'] =
          skillsCollection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  Description? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Description.fromJson(json['name']) : null;
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

class SkillsCollection {
  int? id;
  Description? value;
  String? createdAt;

  SkillsCollection({this.id, this.value, this.createdAt});

  SkillsCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'] != null ? Description.fromJson(json['value']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }
}
class Counter {
  int? viewed;
  int? applied;
  int? accepted;

  Counter({this.viewed, this.applied, this.accepted});

  Counter.fromJson(Map<String, dynamic> json) {
    viewed = json['viewed'];
    applied = json['applied'];
    accepted = json['accepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['viewed'] = viewed;
    data['applied'] = applied;
    data['accepted'] = accepted;
    return data;
  }
}
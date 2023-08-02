// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  bool? success;
  String? status;
  String? message;
  List<AddressData>? addressData;

  AddressModel({this.success, this.status, this.message, this.addressData});

  AddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      addressData = <AddressData>[];
      json['data'].forEach((v) {
        addressData!.add(AddressData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (addressData != null) {
      data['data'] = addressData!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  AddressModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<AddressData>? addressData,
  }) {
    return AddressModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      addressData: addressData ?? this.addressData,
    );
  }
}

class AddressData {
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

  AddressData(
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

  AddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    cityId =
    json['city_id'] != null ? CityId.fromJson(json['city_id']) : null;
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

  AddressData copyWith({
    int? id,
    String? latitude,
    String? longitude,
    String? state,
    String? street,
    String? building,
    String? intercom,
    String? floor,
    String? zipcode,
    String? detailedAddress,
    CityId? cityId,
  }) {
    return AddressData(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      state: state ?? this.state,
      street: street ?? this.street,
      building: building ?? this.building,
      intercom:  intercom ?? this.intercom,
      floor: floor ?? this.floor,
      zipcode: zipcode ?? this.zipcode,
      detailedAddress:  detailedAddress ?? this.detailedAddress,
      cityId: cityId ?? this.cityId,
    );
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

  CityId copyWith({
    int? id,
    String? symbols,
    Name? name,
    CountryId? countryId,
    bool? isVisible,
  }) {
    return CityId(
      id: id ?? this.id,
      symbols: symbols ?? this.symbols,
      name: name ?? this.name,
      countryId: countryId ?? this.countryId,
      isVisible: isVisible ?? this.isVisible,
    );
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

  Name copyWith({
    String? key,
    String? value,
  }) {
    return Name(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }
}

class CountryId {
  int? id;
  String? symbols;
  Name? name;
  DefaultLanguage? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  CountryId(
      {this.id,
        this.symbols,
        this.name,
        this.defaultLanguage,
        this.flag,
        this.isVisible});

  CountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    defaultLanguage = json['default_language'] != null
        ? DefaultLanguage.fromJson(json['default_language'])
        : null;
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

  CountryId copyWith({
    int? id,
    String? symbols,
    Name? name,
    DefaultLanguage? defaultLanguage,
    Flag? flag,
    bool? isVisible,
  }) {
    return CountryId(
     id: id ?? this.id,
      symbols:symbols ?? this.symbols,
      name:  name ?? this.name,
      defaultLanguage:   defaultLanguage ?? this.defaultLanguage,
      flag: flag ?? this.flag,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class DefaultLanguage {
  int? id;
  String? symbols;
  Name? nameValues;

  DefaultLanguage({this.id, this.symbols, this.nameValues});

  DefaultLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    nameValues = json['name_values'] != null
        ? Name.fromJson(json['name_values'])
        : null;
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

  DefaultLanguage copyWith({
    int? id,
    String? symbols,
    Name? nameValues,
  }) {
    return DefaultLanguage(
      id: id ?? this.id,
      symbols: symbols ?? this.symbols,
      nameValues: nameValues ?? this.nameValues,
    );
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

  Flag copyWith({
    String? s16px,
    String? s32px,
    String? s64px,
    String? s128px,
  }) {
    return Flag(
      s16px: s16px ?? this.s16px,
      s32px: s32px ?? this.s32px,
      s64px: s64px ?? this.s64px,
      s128px: s128px ?? this.s128px,
    );
  }
}

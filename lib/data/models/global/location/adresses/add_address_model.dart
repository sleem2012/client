class AddAddressModel {
  String? cityId;
  double? latitude;
  double? longitude;
  String? addressState;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;

  AddAddressModel({
    this.cityId,
    this.latitude,
    this.longitude,
    this.addressState,
    this.street,
    this.building,
    this.intercom,
    this.floor,
    this.zipcode,
    this.detailedAddress,
  });

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addressState = json['address_state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['city_id'] = cityId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = addressState;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    return data;
  }

  AddAddressModel copyWith({
    String? cityId,
    double? latitude,
    double? longitude,
    String? addressState,
    String? street,
    String? building,
    String? intercom,
    String? floor,
    String? zipcode,
    String? detailedAddress,
  }) {
    return AddAddressModel(
      cityId: cityId ?? this.cityId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addressState: addressState ?? this.addressState,
      street: street ?? this.street,
      building: building ?? this.building,
      intercom: intercom ?? this.intercom,
      floor: floor ?? this.floor,
      zipcode: zipcode ?? this.zipcode,
      detailedAddress: detailedAddress ?? this.detailedAddress,
    );
  }

  @override
  bool operator ==(covariant AddAddressModel other) {
    if (identical(this, other)) return true;

    return other.cityId == cityId &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.addressState == addressState &&
        other.street == street &&
        other.building == building &&
        other.intercom == intercom &&
        other.floor == floor &&
        other.zipcode == zipcode &&
        other.detailedAddress == detailedAddress;
  }

  @override
  int get hashCode {
    return cityId.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        addressState.hashCode ^
        street.hashCode ^
        building.hashCode ^
        intercom.hashCode ^
        floor.hashCode ^
        zipcode.hashCode ^
        detailedAddress.hashCode;
  }
}

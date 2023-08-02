// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveringModel {
  String? paymentId;
  String? sourceId;
  String? destinationId;
  String? userNote;
  String? type;
  String? sourceCityId;
  String? sourceLatitude;
  String? sourceLongitude;
  String? sourceAddressState;
  String? sourceStreet;
  String? sourceBuilding;
  String? sourceIntercom;
  String? sourceFloor;
  String? sourceZipcode;
  String? sourceDetailedAddress;
  String? destinationCityId;
  String? destinationLatitude;
  String? destinationLongitude;
  String? destinationAddressState;
  String? destinationStreet;
  String? destinationBuilding;
  String? destinationIntercom;
  String? destinationFloor;
  String? destinationZipcode;
  String? destinationDetailedAddress;

  DeliveringModel({
    this.paymentId,
    this.sourceId,
    this.destinationId,
    this.userNote,
    this.type,
    this.sourceCityId,
    this.sourceLatitude,
    this.sourceLongitude,
    this.sourceAddressState,
    this.sourceStreet,
    this.sourceBuilding,
    this.sourceIntercom,
    this.sourceFloor,
    this.sourceZipcode,
    this.sourceDetailedAddress,
    this.destinationCityId,
    this.destinationLatitude,
    this.destinationLongitude,
    this.destinationAddressState,
    this.destinationStreet,
    this.destinationBuilding,
    this.destinationIntercom,
    this.destinationFloor,
    this.destinationZipcode,
    this.destinationDetailedAddress,
  });

  DeliveringModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    sourceId = json['source_id'];
    destinationId = json['destination_id'];
    userNote = json['user_note'];
    type = json['type'];
    sourceCityId = json['source_city_id'];
    sourceLatitude = json['source_latitude'];
    sourceLongitude = json['source_longitude'];
    sourceAddressState = json['source_address_state'];
    sourceStreet = json['source_street'];
    sourceBuilding = json['source_building'];
    sourceIntercom = json['source_intercom'];
    sourceFloor = json['source_floor'];
    sourceZipcode = json['source_zipcode'];
    sourceDetailedAddress = json['source_detailed_address'];
    destinationCityId = json['destination_city_id'];
    destinationLatitude = json['destination_latitude'];
    destinationLongitude = json['destination_longitude'];
    destinationAddressState = json['destination_address_state'];
    destinationStreet = json['destination_street'];
    destinationBuilding = json['destination_building'];
    destinationIntercom = json['destination_intercom'];
    destinationFloor = json['destination_floor'];
    destinationZipcode = json['destination_zipcode'];
    destinationDetailedAddress = json['destination_detailed_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_id'] = paymentId;
    data['source_id'] = sourceId;
    data['destination_id'] = destinationId;
    data['user_note'] = userNote;
    data['type'] = type;
    data['source_city_id'] = sourceCityId;
    data['source_latitude'] = sourceLatitude;
    data['source_longitude'] = sourceLongitude;
    data['source_address_state'] = sourceAddressState;
    data['source_street'] = sourceStreet;
    data['source_building'] = sourceBuilding;
    data['source_intercom'] = sourceIntercom;
    data['source_floor'] = sourceFloor;
    data['source_zipcode'] = sourceZipcode;
    data['source_detailed_address'] = sourceDetailedAddress;
    data['destination_city_id'] = destinationCityId;
    data['destination_latitude'] = destinationLatitude;
    data['destination_longitude'] = destinationLongitude;
    data['destination_address_state'] = destinationAddressState;
    data['destination_street'] = destinationStreet;
    data['destination_building'] = destinationBuilding;
    data['destination_intercom'] = destinationIntercom;
    data['destination_floor'] = destinationFloor;
    data['destination_zipcode'] = destinationZipcode;
    data['destination_detailed_address'] = destinationDetailedAddress;
    return data;
  }

  DeliveringModel copyWith({
    String? paymentId,
    String? sourceId,
    String? destinationId,
    String? userNote,
    String? type,
    String? sourceCityId,
    String? sourceLatitude,
    String? sourceLongitude,
    String? sourceAddressState,
    String? sourceStreet,
    String? sourceBuilding,
    String? sourceIntercom,
    String? sourceFloor,
    String? sourceZipcode,
    String? sourceDetailedAddress,
    String? destinationCityId,
    String? destinationLatitude,
    String? destinationLongitude,
    String? destinationAddressState,
    String? destinationStreet,
    String? destinationBuilding,
    String? destinationIntercom,
    String? destinationFloor,
    String? destinationZipcode,
    String? destinationDetailedAddress,
  }) {
    return DeliveringModel(
      paymentId: paymentId ?? this.paymentId,
      sourceId: sourceId ?? this.sourceId,
      destinationId: destinationId ?? this.destinationId,
      userNote: userNote ?? this.userNote,
      type: type ?? this.type,
      sourceCityId: sourceCityId ?? this.sourceCityId,
      sourceLatitude: sourceLatitude ?? this.sourceLatitude,
      sourceLongitude: sourceLongitude ?? this.sourceLongitude,
      sourceAddressState: sourceAddressState ?? this.sourceAddressState,
      sourceStreet: sourceStreet ?? this.sourceStreet,
      sourceBuilding: sourceBuilding ?? this.sourceBuilding,
      sourceIntercom: sourceIntercom ?? this.sourceIntercom,
      sourceFloor: sourceFloor ?? this.sourceFloor,
      sourceZipcode: sourceZipcode ?? this.sourceZipcode,
      sourceDetailedAddress: sourceDetailedAddress ?? this.sourceDetailedAddress,
      destinationCityId: destinationCityId ?? this.destinationCityId,
      destinationLatitude: destinationLatitude ?? this.destinationLatitude,
      destinationLongitude: destinationLongitude ?? this.destinationLongitude,
      destinationAddressState: destinationAddressState ?? this.destinationAddressState,
      destinationStreet: destinationStreet ?? this.destinationStreet,
      destinationBuilding: destinationBuilding ?? this.destinationBuilding,
      destinationIntercom: destinationIntercom ?? this.destinationIntercom,
      destinationFloor: destinationFloor ?? this.destinationFloor,
      destinationZipcode: destinationZipcode ?? this.destinationZipcode,
      destinationDetailedAddress: destinationDetailedAddress ?? this.destinationDetailedAddress,
    );
  }
}

class CreateOrderModel {
  int? paymentId;
  String? userNote;
  String? lat;
  String? lng;

  CreateOrderModel({this.paymentId, this.userNote, this.lat, this.lng});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    userNote = json['user_note'];
    lat = json['lat'];
    lng = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_id'] = paymentId;
    data['user_note'] = userNote;
    data['lat'] = lat;
    data['long'] = lng;
    return data;
  }

  CreateOrderModel copyWith({
    int? paymentId,
    String? userNote,
    String? lat,
    String? lng,
  }) {
    return CreateOrderModel(
      paymentId: paymentId ?? this.paymentId,
      userNote: userNote ?? this.userNote,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}

class SocketTripModel {
  int? id;
  String? name;
  String? image;
  int? userId;
  num? offer;
  int? created_at;
  Data? data;

  SocketTripModel({
    this.id,
    this.name,
    this.image,
    this.userId,
    this.offer,
    this.created_at,
    this.data,
  });

  SocketTripModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    offer = json['cost'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    created_at = json['created_at'] ?? DateTime.now().millisecond;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['user_id'] = userId;
    data['cost'] = offer;
    data['created_at'] = created_at;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;

  }

  SocketTripModel copyWith(
      {int? id,
      String? name,
      String? image,
      int? userId,
      num? offer,
      int? created_at,
        Data? data
      }) {
    return SocketTripModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        userId: userId ?? this.userId,
        offer: offer ?? this.offer,
        data: data?? this.data,
        created_at: created_at ?? this.created_at);
  }

  @override
  bool operator ==(covariant SocketTripModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.userId == userId &&
        other.offer == offer &&
        other.data == data &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        userId.hashCode ^
        offer.hashCode ^
    data.hashCode ^
        created_at.hashCode;


  }
}

class Data {
  double? driverLat;
  double? driverLng;
  String? carModel;
  String? car_plate;
  String? car_photo;
  String? car_type;

  Data({this.driverLat, this.driverLng, this.carModel,this.car_plate,this.car_photo,this.car_type}) ;

  Data.fromJson(Map<String, dynamic> json) {
    driverLat = json['driver_lat'];
    driverLng = json['driver_lng'];
    carModel = json['car_model'];
    car_plate = json['car_plate'];
    car_photo = json['car_photo'];
    car_type = json['car_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_lat'] = driverLat;
    data['driver_lng'] = driverLng;
    data['car_model'] = carModel;
    data['car_plate'] = car_plate;
    data['car_photo'] = car_photo;
    data['car_type'] = car_type;
    return data;
  }
}

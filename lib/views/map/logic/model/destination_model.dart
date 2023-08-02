class DestinationModel {
  double? lat;
  double? long;
  String? address;
  DestinationModel({this.address,this.lat,this.long});


  @override
  bool operator ==(covariant DestinationModel other) {
    if (identical(this, other)) return true;

    return
      other.lat == lat &&
          other.long == long &&
          other.address == address;
  }

  @override
  int get hashCode => lat.hashCode ^ long.hashCode ^ address.hashCode;
}
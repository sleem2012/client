
class UpdateTripModel {
  int? id;
  String? fare;
  String? cost;
  int? driverId;
  String? state;

  UpdateTripModel({
    this.id,
    this.fare,
    this.driverId,
    this.state,
    this.cost,
  });

  UpdateTripModel copyWith({
    int? id,
    String? fare,
    int? driverId,
    String? state,
    String? cost,

  }) {
    return UpdateTripModel(
      id: id ?? this.id,
      fare: fare ?? this.fare,
      driverId: driverId ?? this.driverId,
      state: state ?? this.state,
      cost: cost?? this.cost,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      if(fare!=null)'fare': fare,
      if(cost!=null)'cost': cost,
      if(driverId!=null) 'driver': driverId,
      if(state!=null) 'state': state,
    };
  }

  @override
  bool operator ==(covariant UpdateTripModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.fare == fare && other.cost == cost && other.driverId == driverId && other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^ fare.hashCode ^ driverId.hashCode ^ state.hashCode^ cost.hashCode;
  }
}

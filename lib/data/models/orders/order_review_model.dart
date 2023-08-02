// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderReviewModel {
  int? id;
  int? rateId;
  String? type;
  String? note;
  String? rate;

  OrderReviewModel({this.id, this.type, this.note, this.rate,this.rateId});

  OrderReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['order_id'];
    type = json['state'];
    note = json['note'];
    rate = json['rate'];
    rateId = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = id;
    data['state'] = type;
    data['note'] = note;
    data['rate'] = rate;
    data['id'] = rateId;
    return data;
  }

  OrderReviewModel copyWith({
    int? id,
    int? rateId,
    String? type,
    String? note,
    String? rate,
  }) {
    return OrderReviewModel(
      id: id ?? this.id,
      rateId: rateId ?? this.rateId,
      type: type ?? this.type,
      note: note ?? this.note,
      rate: rate ?? this.rate,
    );
  }

  @override
  bool operator ==(covariant OrderReviewModel other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
      other.type == type &&
      other.note == note &&
      other.rateId == rateId &&
      other.rate == rate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      type.hashCode ^
      note.hashCode ^
      rateId.hashCode ^
      rate.hashCode;
  }

  @override
  String toString() {
    return 'OrderReviewModel(id: $id, type: $type, note: $note, rate: $rate)';
  }
}

import 'package:flutter/foundation.dart';
class ProductSelectable {
  String? title;
  String? id;
  String? pro_id;
  String? img;
  bool? isSelected = false;
  List<ProductSelectable>? subSelection;

  ProductSelectable({this.title, this.id, this.pro_id, this.isSelected, this.subSelection, this.img});

  @override
  bool operator ==(covariant ProductSelectable other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.id == id &&
        other.pro_id == pro_id &&
        other.img == img &&
        other.isSelected == isSelected &&
        listEquals(other.subSelection, subSelection);
  }

  @override
  int get hashCode {
    return title.hashCode ^ id.hashCode ^ pro_id.hashCode ^ img.hashCode ^ isSelected.hashCode ^ subSelection.hashCode;
  }
}


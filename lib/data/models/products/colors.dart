// import '../ads/ads_model.dart';
//
// class ColorsModel{
//   List<ProductColor>? colors;
//
//   ColorsModel.fromJson(Map<String, dynamic> json) {
//     colors = json["data"];
//   }
//
//
// }
//
// class ProductColor {
//   int? id;
//   String? icon;
//   String? key;
//   Name? name;
//   bool? isVisible;
//
//   ProductColor({this.id, this.icon, this.key, this.name, this.isVisible});
//
//   ProductColor.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     icon = json['icon'] != null ? json['icon']['svg'] : null;
//     key = json['key'];
//     name = json['name'] != null ? Name.fromJson(json['name']) : null;
//     isVisible = json['is_visible'];
//   }
//
//   @override
//   bool operator ==(covariant ProductColor other) {
//     if (identical(this, other)) return true;
//
//     return other.id == id && other.icon == icon && other.key == key && other.name == name && other.isVisible == isVisible;
//   }
//
//   @override
//   int get hashCode {
//     return id.hashCode ^ icon.hashCode ^ key.hashCode ^ name.hashCode ^ isVisible.hashCode;
//   }
// }

import '../user_info/user_model.dart';

class VendorModel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  UserImage? image;
  bool? isOnline;
  UserCompany? company;

  VendorModel({this.id, this.name, this.email, this.mobile, this.image, this.isOnline, this.company});

  VendorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
    isOnline = json['is_online'];
    company = json['company'] != null ? UserCompany.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['is_online'] = isOnline;
    return data;
  }
}

import '../user_info/user_model.dart';

class SearchModel {
  List<UserCompany>? data;

  SearchModel({this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserCompany>[];
      json['data'].forEach((v) {
        data!.add( UserCompany.fromJson(v));
      });
    }
  }


}



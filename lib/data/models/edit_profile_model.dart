import 'in_drive/rider_model.dart';

class EditProfileModel {
  bool? success;
  String? message;
  Data? data;
  int? code;

  EditProfileModel({this.success, this.message, this.data, this.code});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? mobile;
  dynamic mobileVerifiedAt;
  dynamic verifyToken;
  UserImage? image;
  int? addressId;
  int? currencyId;
  String? fcmToken;
  dynamic otpToken;
  String? gender;
  String? birthdate;
  int? typeId;
  int? langId;
  int? isOnline;
  int? isBlocked;
  dynamic blockReason;
  String? token;
  dynamic tokenExpired;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.mobile,
        this.mobileVerifiedAt,
        this.verifyToken,
        this.image,
        this.addressId,
        this.currencyId,
        this.fcmToken,
        this.otpToken,
        this.gender,
        this.birthdate,
        this.typeId,
        this.langId,
        this.isOnline,
        this.isBlocked,
        this.blockReason,
        this.token,
        this.tokenExpired,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    mobileVerifiedAt = json['mobile_verified_at'];
    verifyToken = json['verify_token'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
    addressId = json['address_id'];
    currencyId = json['currency_id'];
    fcmToken = json['fcmToken'];
    otpToken = json['otpToken'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
    token = json['token'];
    tokenExpired = json['token_expired'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['mobile'] = mobile;
    data['mobile_verified_at'] = mobileVerifiedAt;
    data['verify_token'] = verifyToken;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['address_id'] = addressId;
    data['currency_id'] = currencyId;
    data['fcmToken'] = fcmToken;
    data['otpToken'] = otpToken;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    data['token'] = token;
    data['token_expired'] = tokenExpired;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


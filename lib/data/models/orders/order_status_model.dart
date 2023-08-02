class OrderStatusModel {
  bool? success;
  String? status;
  String? message;
  List<StatusData>? data;

  OrderStatusModel({this.success, this.status, this.message, this.data});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StatusData>[];
      json['data'].forEach((v) {
        data!.add(StatusData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusData {
  int? id;
  User? user;
  int? orderId;
  String? state;

  StatusData({this.id, this.user, this.orderId, this.state});

  StatusData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    orderId = json['order_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['order_id'] = orderId;
    data['state'] = state;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? mobile;
  String? verifyToken;
  Image? image;
  String? fcmToken;
  String? timezone;
  String? gender;
  String? birthdate;
  int? typeId;
  int? langId;
  int? currencyId;
  int? addressId;
  bool? isOnline;
  bool? isBlocked;
  String? token;
  String? tokenExpired;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.mobile,
        this.verifyToken,
        this.image,
        this.fcmToken,
        this.timezone,
        this.gender,
        this.birthdate,
        this.typeId,
        this.langId,
        this.currencyId,
        this.addressId,
        this.isOnline,
        this.isBlocked,
        this.token,
        this.tokenExpired,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    verifyToken = json['verify_token'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    fcmToken = json['fcmToken'];
    timezone = json['timezone'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address_id'];
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
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
    data['verify_token'] = verifyToken;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['fcmToken'] = fcmToken;
    data['timezone'] = timezone;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    data['address_id'] = addressId;
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['token'] = token;
    data['token_expired'] = tokenExpired;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Image {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  Image(
      {this.s16px,
        this.s32px,
        this.s64px,
        this.s128px,
        this.s256px,
        this.s512px});

  Image.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    return data;
  }
}

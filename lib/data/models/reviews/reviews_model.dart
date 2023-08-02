class ReviewModel {
  bool? success;
  String? status;
  String? message;
  List<ReviewData>? data;
  Pagination? pagination;
  Average? average;

  ReviewModel({this.success, this.status, this.message, this.data, this.pagination, this.average});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ReviewData>[];
      json['data'].forEach((v) {
        data!.add(ReviewData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    average = json['average'] != null ? Average.fromJson(json['average']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (average != null) {
      data['average'] = average!.toJson();
    }
    return data;
  }
}

class ReviewData {
  int? id;
  User? user;
  int? rate;
  String? comment;
  bool? isVisible;
  bool? isPurchase;
  String? createdAt;

  ReviewData({this.id, this.user, this.rate, this.comment, this.isVisible, this.isPurchase, this.createdAt});

  ReviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rate = json['rate'];
    comment = json['comment'];
    isVisible = json['is_visible'];
    isPurchase = json['is_purchase'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['rate'] = rate;
    data['comment'] = comment;
    data['is_visible'] = isVisible;
    data['is_purchase'] = isPurchase;
    data['created_at'] = createdAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Image? image;
  String? gender;
  String? birthdate;

  User({this.id, this.name, this.email, this.image, this.gender, this.birthdate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
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

  Image({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

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

class Pagination {
  Links? links;
  Meta? meta;

  Pagination({this.links, this.meta});

  Pagination.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Links {
  String? first;
  String? prev;
  String? next;

  Links({this.first, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? to;
  int? perPage;
  int? total;

  Meta({this.currentPage, this.from, this.to, this.perPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    to = json['to'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['to'] = to;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}

class Average {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;
  double? avg;

  Average({this.i1, this.i2, this.i3, this.i4, this.i5, this.avg});

  Average.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
    avg = double.parse(json['avg'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    data['4'] = i4;
    data['5'] = i5;
    data['avg'] = avg;
    return data;
  }
}

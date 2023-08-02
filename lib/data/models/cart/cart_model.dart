import '../services/feature_type.dart';

class CartModel {
  bool? success;
  String? status;
  String? message;
  CartData? data;

  CartModel({this.success, this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }
}

class PaymentPriceModel {
  String? name;
  String? value;

  PaymentPriceModel(this.name, this.value);

  PaymentPriceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    value = json['value'].toString();
  }
  double get parsedPrice => double.tryParse((value ?? '').split(' ').first) ?? 0;
  String get price => value ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class CartData {
  String? total;

  int? quantity;
  List<CartBranch>? branches;
  List<PaymentPriceModel>? additions;

  CartData({
    this.total,
    this.quantity,
    this.branches,
    this.additions,
  });

  CartData.fromJson(Map<String, dynamic> json) {
    total = json['total'].toString();

    quantity = json['quantity'];
    if (json['additions'] != null) {
      additions = <PaymentPriceModel>[];
      json['additions'].forEach((v) {
        additions!.add(PaymentPriceModel.fromJson(v));
      });
    }
    if (json['branches'] != null) {
      branches = <CartBranch>[];
      for (var v in (json['branches'] as List)) {
        branches!.add(CartBranch.fromJson(v));
      }
    }
  }
}

class CartBranch {
  int? id;
  Shippers? shippers;
  List<CartItems>? items;
  String? vendorName;
  String? supTotal;
  FeatureType? features;
  int? quantity;

  CartBranch({this.id, this.shippers, this.items, this.supTotal, this.features, this.quantity, this.vendorName});

  CartBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippers = json['shippers'] != null ? Shippers.fromJson(json['shippers']) : null;
    if (json['items'] != null) {
      items = <CartItems>[];
      json['items'].forEach((v) {
        items!.add(CartItems.fromJson(v));
      });
    }
    supTotal = json['sup_total'].toString();
    features = FeatureType.formString(json['features']);
    quantity = json['quantity'];
    vendorName = json['vendor'];
  }
}

class Shippers {
  Distance? distance;
  Weight? weight;
  Weight? duration;
  List<ProviderOfferModel>? offers;

  Shippers({this.distance, this.weight, this.duration, this.offers});

  Shippers.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    duration = json['duration'] != null ? Weight.fromJson(json['duration']) : null;
    if (json['offers'] != null) {
      offers = <ProviderOfferModel>[];
      json['offers'].forEach((v) {
        offers!.add(ProviderOfferModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (distance != null) {
      data['distance'] = distance!.toJson();
    }
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    if (duration != null) {
      data['duration'] = duration!.toJson();
    }
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProviderContentModel {
  int? id;
  String? icon;
  String? name;

  ProviderContentModel({this.id, this.icon, this.name});

  ProviderContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class Distance {
  String? unit;
  num? total;

  Distance({this.unit, this.total});

  Distance.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['total'] = total;
    return data;
  }
}

class Weight {
  String? unit;
  num? total;

  Weight({this.unit, this.total});

  Weight.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['total'] = total;
    return data;
  }
}

class ProviderOfferModel {
  int? id;
  String? name;
  String? icon;
  String? type;
  String? price;

  ProviderOfferModel({this.id, this.name, this.icon, this.type, this.price});

  ProviderOfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['type'] = type;
    data['price'] = price;
    return data;
  }

  @override
  bool operator ==(covariant ProviderOfferModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.icon == icon && other.type == type && other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ icon.hashCode ^ type.hashCode ^ price.hashCode;
  }
}

class CartItems {
  int? id;
  String? name;
  String? description;
  ProductColor? productColor;
  ProductSize? productSize;
  List<ApiImages>? images;
  String? quantity;
  num? price;
  num? discount;
  bool? isOffer;
  bool? isCouponAdded;
  String? timePikerFrom;
  String? timePikerTo;
  String? note;
  List<CartItemExtra>? extras;

  CartItems(
      {this.id,
      this.name,
      this.description,
      this.productColor,
      this.productSize,
      this.images,
      this.quantity,
      this.price,
      this.discount,
      this.isOffer,
      this.isCouponAdded,
      this.timePikerFrom,
      this.timePikerTo,
      this.note,
      this.extras});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? json['name']['value'] : null;
    description = json['description'] != null ? json['description']['value'] : null;
    productColor = json['product_color'] != null ? ProductColor.fromJson(json['product_color']) : null;
    productSize = json['product_size'] != null ? ProductSize.fromJson(json['product_size']) : null;
    if (json['images'] != null) {
      images = <ApiImages>[];
      json['images'].forEach((v) {
        images!.add(ApiImages.fromJson(v));
      });
    }
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    isOffer = json['is_offer'] ?? false;
    isCouponAdded = json['is_coupon_added'];
    timePikerFrom = json['time_piker_from'];
    timePikerTo = json['time_piker_to'];
    note = json['note'];
    if (json['extras'] != null) {
      extras = <CartItemExtra>[];
      json['extras'].forEach((v) {
        extras!.add(CartItemExtra.fromJson(v));
      });
    }
  }
}

class ProductColor {
  int? id;
  String? icon;
  String? key;
  String? name;
  bool? isVisible;

  ProductColor({this.id, this.icon, this.key, this.name, this.isVisible});

  ProductColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'] != null ? json['icon']['svg'] : null;
    key = json['key'];
    name = json['name'] != null ? json['name']['value'] : null;
    isVisible = json['is_visible'];
  }
}

class ProductSize {
  int? id;
  String? symbol;
  String? name;
  bool? isVisible;

  ProductSize({this.id, this.symbol, this.name, this.isVisible});

  ProductSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'] != null ? json['name']['value'] : null;
    isVisible = json['is_visible'];
  }
}

class ApiImages {
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;
  String? s1024px;

  ApiImages({this.s64px, this.s128px, this.s256px, this.s512px, this.s1024px});

  ApiImages.fromJson(Map<String, dynamic> json) {
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
    s1024px = json['1024px'];
  }
}

class CartItemExtra {
  int? id;
  String? name;
  List<ApiImages>? images;
  String? quantity;
  num? price;

  CartItemExtra({this.id, this.name, this.images, this.quantity, this.price});

  CartItemExtra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? json['name']['value'] : null;
    if (json['images'] != null) {
      images = <ApiImages>[];
      json['images'].forEach((v) {
        images!.add(ApiImages.fromJson(v));
      });
    }
    quantity = json['quantity'];
    price = json['price'];
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductReviewModel {
  int? id;
  ProductId? productId;
  int? rate;
  String? comment;
  bool? isVisible;

  ProductReviewModel({this.id, this.productId, this.rate, this.comment, this.isVisible});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'] != null ? ProductId.fromJson(json['product_id']) : null;
    rate = json['rate'];
    comment = json['comment'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (productId != null) {
      data['product_id'] = productId!.toJson();
    }
    data['rate'] = rate;
    data['comment'] = comment;
    data['is_visible'] = isVisible;
    return data;
  }

  ProductReviewModel copyWith({
    int? id,
    ProductId? productId,
    int? rate,
    String? comment,
    bool? isVisible,
  }) {
    return ProductReviewModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      rate: rate ?? this.rate,
      comment: comment ?? this.comment,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  @override
  bool operator ==(covariant ProductReviewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.productId == productId &&
      other.rate == rate &&
      other.comment == comment &&
      other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      productId.hashCode ^
      rate.hashCode ^
      comment.hashCode ^
      isVisible.hashCode;
  }
}

class ProductId {
  int? id;
  String? name;
  String? smallDescription;
  String? description;
  String? category;
  String? position;
  bool? isVisible;

  ProductId({this.id, this.name, this.smallDescription, this.description, this.category, this.position, this.isVisible});

  ProductId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    smallDescription = json['small_description'];
    description = json['description'];
    category = json['category'];
    position = json['position'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['small_description'] = smallDescription;
    data['description'] = description;
    data['category'] = category;
    data['position'] = position;
    data['is_visible'] = isVisible;
    return data;
  }

  @override
  bool operator ==(covariant ProductId other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.smallDescription == smallDescription &&
      other.description == description &&
      other.category == category &&
      other.position == position &&
      other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      smallDescription.hashCode ^
      description.hashCode ^
      category.hashCode ^
      position.hashCode ^
      isVisible.hashCode;
  }

  ProductId copyWith({
    int? id,
    String? name,
    String? smallDescription,
    String? description,
    String? category,
    String? position,
    bool? isVisible,
  }) {
    return ProductId(
      id: id ?? this.id,
      name: name ?? this.name,
      smallDescription: smallDescription ?? this.smallDescription,
      description: description ?? this.description,
      category: category ?? this.category,
      position: position ?? this.position,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

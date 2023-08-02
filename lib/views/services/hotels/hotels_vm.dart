import '../../../data/models/products/products_model.dart';

class HotelVm{
  final ProductMenu pro;

  HotelVm(this.pro);
  List<ProductAttributes> get product_attr_with_check {
    return (pro.product_attr ?? <ProductAttributes>[])
        .where(
          (element) => element.attrValue?.icon == null && element.answer == element.attrValue?.name,
    )
        .toList();
  }

  List<ProductAttributes> get product_attr_with_icons {
    return (pro.product_attr ?? <ProductAttributes>[]).where((element) => element.attrValue?.icon != null).toList();
  }

  List<ProductAttributes> get product_attr_with_answer {
    return (pro.product_attr ?? <ProductAttributes>[])
        .where(
          (element) => element.attrValue?.icon == null && element.answer != element.attrValue?.name,
    )
        .toList();
  }

  bool get has_attr {
    return (pro.product_attr ?? <ProductAttributes>[]).isNotEmpty;
  }

}
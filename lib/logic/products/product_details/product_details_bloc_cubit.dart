import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/ads/ads_model.dart';
import '../../../data/models/products/products_model.dart';
import 'product_details_bloc_state.dart';

class ProductDetailsBloc extends Cubit<ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsState.initial());

  static ProductDetailsBloc of(BuildContext context) {
    return BlocProvider.of<ProductDetailsBloc>(context);
  }

  int productAmount = 1;

  Map<int, int> extraAmountMap = {};

  List<int> extraAmountList = [];

  bool setSelection(bool isSelected) {
    return isSelected;
  }

  setAmountMap() {
    for (var element in selectedProductMenu?.extras ?? <Extras>[]) {
      extraAmountMap.addAll({element.id!: element.amount!});
    }

    debugPrint(extraAmountMap.toString());

    update;
  }

  increaseExtraAmount(int? prodId) {
    extraAmountMap.update(prodId ?? 0, (value) {
      extraAmountList
        ..remove(value)
        ..add((extraAmountMap[prodId] ?? 1) + 1);
      return (extraAmountMap[prodId] ?? 1) + 1;
    });
    debugPrint(extraAmountMap.toString());

    update;
  }

  decreaseExtraAmount(int? prodId) {
    if (extraAmountMap[prodId] == 1) {
      return;
    } else {
      extraAmountMap.update(prodId ?? 0, (value) {
        extraAmountList
          ..remove(value)
          ..add((extraAmountMap[prodId] ?? 1) - 1);
        return (extraAmountMap[prodId] ?? 1) - 1;
      });
      debugPrint(extraAmountMap.toString());

      update;
    }
  }

  increaseProductAmount() {
    productAmount++;
    update;
  }

  decreaseProductAmount() {
    if (productAmount == 1) {
      return;
    } else {
      productAmount--;
      update;
    }
  }

  List<int> extraIds = [];

  get update {
    emit(const ProductDetailsState.initial());
    emit(const ProductDetailsState.success());
  }

  ProductsSystemData? _productsSys;
  ProductMenu? selectedProductMenu;
  List<ProductMenu> filterdProsMenu = [];

  setProduct(ProductsSystemData productsData) {
    _productsSys = productsData;
    selectedProductMenu = _productsSys?.products?.firstOrNull;
    setAmountMap();
    update;
  }

  ProductsSystemData get productsSys => _productsSys!;

  List<ImageValues> get images {
    List<ImageValues>? imageValues = [];
    for (var img in selectedProductMenu?.imageValues ?? <ImageValues>[]) {
      imageValues.add(img);
    }
    return imageValues;
  }

  String? get brandImg {
    return _productsSys?.company?.logo?.s128px;
  }

  Owner? get companyOwner {
    return _productsSys?.company?.owner;
  }

  String? get proName {
    return _productsSys?.name?.value;
  }

  int get proSysId {
    return _productsSys!.id!;
  }

  String get price {
    return _productsSys!.products!.first.price!;
  }

  int get proMenuId {
    return selectedProductMenu!.id!;
  }

  List<ProductColor?> get allAvailableColors {
    filterdProsMenu = _productsSys?.products ?? <ProductMenu>[];
    List<ProductColor?> allColors = [];
    for (var pro in _productsSys?.products ?? <ProductMenu>[]) {
      allColors.add(pro.productColor);
    }
    return allColors.toSet().toList();
  }

  ProductColor? get sellectedColor {
    return selectedProductMenu?.productColor;
  }

  ProductSize? get sellectedSize {
    return _sellectedSize ?? selectedProductMenu?.productSize;
  }

  ProductSize? _sellectedSize;

  onColorSelected(int i) {
    extraAmountMap.clear();
    extraAmountList.clear();
    extraIds.clear();
    filterdProsMenu = _productsSys?.products?.where((element) {
          return element.productColor == allAvailableColors[i];
        }).toList() ??
        [];
    selectedProductMenu = filterdProsMenu.first;
    _sellectedSize = selectedProductMenu?.productSize;
    // allAvailableSizes()
    update;
  }

  onSizeSelected(int i) {
    extraAmountMap.clear();
    extraAmountList.clear();
    extraIds.clear();
    _sellectedSize = allAvailableSizes[i];
    selectedProductMenu = filterdProsMenu.where((element) => element.productSize == sellectedSize).toList().first;
    debugPrint('================= ${selectedProductMenu?.id} : ');
    debugPrint('_selectedSize ${sellectedSize?.id.toString()}');
    update;
  }

  List<ProductSize?> get allAvailableSizes {
    List<ProductSize?> list = [];
    for (var element in filterdProsMenu) {
      list.add(element.productSize);
    }
    return list.toSet().toList();
  }

  String get description {
    return _productsSys?.description?.value ?? '';
  }

  List<ProductAttributes> get product_attr_with_check {
    return (selectedProductMenu?.product_attr ?? <ProductAttributes>[])
        .where(
          (element) => element.attrValue?.icon == null && element.answer == element.attrValue?.name,
        )
        .toList();
  }

  List<ProductAttributes> get product_attr_with_icons {
    return (selectedProductMenu?.product_attr ?? <ProductAttributes>[]).where((element) => element.attrValue?.icon != null).toList();
  }

  List<ProductAttributes> get product_attr_with_answer {
    return (selectedProductMenu?.product_attr ?? <ProductAttributes>[])
        .where(
          (element) => element.attrValue?.icon == null && element.answer != element.attrValue?.name,
        )
        .toList();
  }

  bool get has_attr {
    return (selectedProductMenu?.product_attr ?? <ProductAttributes>[]).isNotEmpty;
  }
}

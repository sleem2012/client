import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/products/products_model.dart';
import 'hotel_extra_state.dart';

class HotelExtraBloc extends Cubit<HotelExtraState> {
  HotelExtraBloc() : super(const HotelExtraState.initial());

  static HotelExtraBloc of(context) => BlocProvider.of(context);

  ProductMenu? productMenu;

  setProductMenu(ProductMenu value) {
    productMenu = value;
  }

  bool selected = false;
  int productAmount = 1;

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

  // handleExtraAmount(int extraId) {
  //   if (selected == false) {
  //     debugPrint(extraAmountMap.toString());
  //
  //     extraAmountList.add(extraAmountMap[extraId] ?? 0);
  //     extraIds.add(extraId ?? 0);
  //     selected = true;
  //   } else {
  //     debugPrint(extraAmountMap.toString());
  //
  //     extraAmountList.remove(extraAmountMap[extraId] ?? 0);
  //
  //     extraIds.remove(extraId ?? 0);
  //
  //     selected = false;
  //   }
  //   emit(HotelExtraState.success(id: extraId));
  // }

  List<int> extraIds = [];

  Map<int, int> extraAmountMap = {};

  List<int> extraAmountList = [];

  setAmountMap() {
    for (var element in productMenu?.extras ?? <Extras>[]) {
      extraAmountMap.addAll({element.id!: element.amount!});
    }

    debugPrint(extraAmountMap.toString());

    // update;
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

  get update {
    emit(const HotelExtraState.initial());
    emit(const HotelExtraState.success());
  }
}

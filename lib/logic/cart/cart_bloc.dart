import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/branch/branch_model.dart';

import '../../data/models/cart/cart_model.dart';
import '../../data/repository/cart/cart_repo.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import 'cart_state.dart';

class CartBloc extends Cubit<CartState> {
  CartBloc({required this.cartRepoImp}) : super(const CartState.initial());

  static CartBloc of(BuildContext context) => BlocProvider.of<CartBloc>(context);
  final TextEditingController noteController = TextEditingController();
  final CartRepoImp cartRepoImp;
  final Map<int, int> amountMap = {};
  final Map<int, int> initAmountMap = {};
  CartModel? _cartModel;

  CartModel? get cartModel => _cartModel;

  get_cart({bool isLoading = false}) async {
    if (KStorage.i.getToken == null) return;
    try {
      if (isLoading) {
        emit(const CartState.loading());
      }
      final result = await cartRepoImp.get();
      result.fold(
        (l) {
          debugPrint('================= Cart Bloc : ${KFailure.toError(l)}');
          emit(CartState.error(error: KFailure.toError(l)));
        },
        (r) {
          _cartModel = r;
          setAmountVals(cartModel!);

          emit(CartState.success(cartModel: cartModel));
        },
      );
    } catch (e) {
      debugPrint('================= Cart Bloc (Catch): ${e.toString()} ');
      emit(CartState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  addToCart(
    int id,
    int amount, {
    List? extraIds,
    List? extraAmount,
    String? date,
    String? dateTo,
  }) async {
    debugPrint('================= id: $id ==> amount : $amount ');
    try {
      emit(const CartState.AddLoading());
      final result = await cartRepoImp.add(
        id: id,
        amount: amount,
        note: noteController.text,
        extraAmount: extraAmount,
        extraIds: extraIds,
        date: date,
        dateTo: dateTo,
        branch_id: selectedBranch?.id,
      );
      result.fold(
        (l) {
          debugPrint('================= add : ${KFailure.toError(l)}');
          emit(CartState.error(error: KFailure.toError(l)));
        },
        (r) {
          _cartModel = r;
          setAmountVals(_cartModel!);
          emit(CartState.success(cartModel: cartModel));
        },
      );
    } catch (e) {
      debugPrint('================= addToCart (Catch): ${e.toString()} ');
      emit(CartState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  int get itemCount {
    return cartModel?.data?.branches?.fold(0, (previousValue, element) => (element.items?.length ?? 0) + (previousValue ?? 0)) ?? 0;
  }

  delete(int id) async {
    try {
      final result = await cartRepoImp.delete(id);
      result.fold(
        (l) {
          debugPrint('================= delete : ${KFailure.toError(l)}');
          emit(CartState.error(error: KFailure.toError(l)));
        },
        (r) {
          _cartModel = r;
          emit(CartState.success(cartModel: cartModel));
        },
      );
    } catch (e) {
      debugPrint('================= delete (Catch): ${e.toString()} ');
      emit(CartState.error(error: Tr.get.something_went_wrong));
    }
  }

  update({int? id, int? amount, String? date, String? dateTo}) async {
    try {
      emit(const CartState.updateLoading());
      final result = await cartRepoImp.update(id: id, amount: amount, date: date, dateTo: dateTo);
      result.fold(
        (l) {
          debugPrint('================= update : ${KFailure.toError(l)}');
          emit(CartState.error(error: KFailure.toError(l)));
        },
        (r) {
          _cartModel = r;
          setAmountVals(cartModel!);
          emit(CartState.success(cartModel: cartModel));
        },
      );
    } catch (e) {
      debugPrint('================= update (Catch): ${e.toString()} ');
      emit(CartState.error(error: Tr.get.something_went_wrong));
    }
  }

  setAmountVals(CartModel cartModel) {
    for (var x in cartModel.data?.branches ?? <CartBranch>[]) {
      for (var pro in x.items ?? <CartItems>[]) {
        amountMap.addAll({(pro.id ?? 0): int.tryParse(pro.quantity ?? '0') ?? 0});
        initAmountMap.addAll({(pro.id ?? 0): int.tryParse(pro.quantity ?? '0') ?? 0});
      }
    }
  }

  increaseAmount(int? prodId) {
    debugPrint(amountMap.toString());
    amountMap.update(prodId ?? 0, (value) => (amountMap[prodId] ?? 0) + 1);
    update(id: prodId ?? -1, amount: amountMap[prodId] ?? 0);
  }

  decreaseAmount(int? prodId) {
    if (amountMap[prodId] == 1) {
      return;
    } else {
      debugPrint(amountMap.toString());
      amountMap.update(prodId ?? 0, (value) => (amountMap[prodId] ?? 0) - 1);
      update(id: prodId ?? -1, amount: amountMap[prodId] ?? 0);
    }
  }

  remove(CartBranch branches, int index) {
    delete(branches.items?[index].id ?? 0);
    branches.items?.removeAt(index);
    _update;
  }

  updateCartModel(CartModel? model) {
    _cartModel = model;
    _update;
  }

  Map<int?, ProviderOfferModel> selectedOffers = {};

  selectOffer(Map<int?, ProviderOfferModel> offer) {
    selectedOffers.addAll(offer);
    _update;
  }

  selectDefaultOffer() {
    selectedOffers.clear();
    final l = cartModel?.data?.branches ?? [];
    for (var element in l) {
      if ((element.shippers?.offers ?? []).isNotEmpty) {
        debugPrint('================= ${element.id}');
        selectedOffers.addAll({element.id: element.shippers!.offers!.first});
      }
    }
  }

  List<PaymentPriceModel> get paymentDetails {
    final List<PaymentPriceModel> list = [];
    list.add(PaymentPriceModel(Tr.get.subtotal, cartModel?.data?.total ?? '0'));
    for (var element in selectedOffers.entries) {
      list.add(PaymentPriceModel("${element.value.name ?? ''} ${Tr.get.shipping}", element.value.price ?? '0'));
    }

    cartModel?.data?.additions?.forEach(list.add);
    return list;
  }

  String get _total {
    double sum = 0.0;
    final List<PaymentPriceModel> list = [];
    for (var element in selectedOffers.entries) {
      list.add(PaymentPriceModel("${element.value.name ?? ''} ${Tr.get.shipping}", element.value.price ?? '0'));
    }
    list.add(PaymentPriceModel(Tr.get.tax, cartModel?.data?.total ?? '0'));

    for (var element in list) {
      sum += element.parsedPrice;
    }
    return sum.toStringAsFixed(2);
  }

  String get totalPrice => '$_total $currency';

  String get currency => (cartModel?.data?.total ?? '').split(' ').last;

  List<CartBranch> get branches => cartModel?.data?.branches ?? [];
  BranchData? _selectedBranch;

  BranchData? get selectedBranch => _selectedBranch;

  onSelectBranch(BranchData? data) {
    _selectedBranch = data;
  }

  get _update {
    emit(const CartState.loading());
    emit(const CartState.initial());
  }
}

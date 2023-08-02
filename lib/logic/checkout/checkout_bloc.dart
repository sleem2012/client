import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/cart/cart_model.dart';
import '../../data/repository/cart/cart_repo.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Cubit<CheckOutState> {
  CheckoutBloc({required this.cartRepoImp}) : super(const CheckOutState.initial());

  static CheckoutBloc of(BuildContext context) => BlocProvider.of<CheckoutBloc>(context);
  final TextEditingController noteController = TextEditingController();
  final CartRepoImp cartRepoImp;
  final Map<int, int> amountMap = {};
  final Map<int, int> initAmountMap = {};
  CartModel? _cartModel;

  CartModel? get cartModel => _cartModel;

  get_checkout({bool isLoading = false}) async {
    try {
      // if (isLoading) {
      emit(const CheckOutState.loading());
      // }
      final result = await cartRepoImp.getCheckout();
      result.fold(
        (l) {
          debugPrint('================= Checkout Bloc : ${KFailure.toError(l)}');
          emit(CheckOutState.error(error: KFailure.toError(l)));
        },
        (r) {
          _cartModel = r;

          emit(CheckOutState.success(model: cartModel));
        },
      );
    } catch (e) {
      debugPrint('================= Checkout Bloc (Catch): ${e.toString()} ');
      emit(CheckOutState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
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
    _update;
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
  get _update {
    emit(const CheckOutState.loading());
    emit(const CheckOutState.initial());
  }
}

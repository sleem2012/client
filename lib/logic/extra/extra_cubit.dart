import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/cart/cart_model.dart';
import '../../data/repository/cart/cart_repo.dart';
import 'extra_state.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';

class ExtraBloc extends Cubit<ExtraState> {
  ExtraBloc({required this.cartRepoImp}) : super(const ExtraState.initial());

  final CartRepoImp cartRepoImp;
  CartModel? cartModel;

  static ExtraBloc of(BuildContext context) => BlocProvider.of(context);

  final Map<int, int> extraAmount = {};
  final Map<int, int> initExtraAmountMap = {};

  setInitial(List<CartItemExtra> extras) {
    for (var extra in extras) {
      extraAmount.addAll({extra.id ?? 0: int.tryParse(extra.quantity ?? '0') ?? 0});
      initExtraAmountMap.addAll({extra.id ?? 0: int.tryParse(extra.quantity ?? '0') ?? 0});
    }
  }

  increaseExtraAmount(int? extraId) {
    debugPrint(extraAmount.toString());
    extraAmount.update(extraId ?? 0, (value) => (extraAmount[extraId] ?? 0) + 1);
    _update;
    return;
  }

  decreaseExtraAmount(int? extraId) {
    if (extraAmount[extraId] == 1) {
      return;
    } else {
      debugPrint(extraAmount.toString());
      extraAmount.update(extraId ?? 0, (value) => (extraAmount[extraId] ?? 0) - 1);
      _update;
    }
  }

  get _update {
    emit(const ExtraState.loading());
    emit(const ExtraState.initial());
  }

  updateExtra({
    required int id,
    required int pro_id,
    required int amount,
  }) async {
    debugPrint(id.toString());
    debugPrint(amount.toString());
    try {
      emit(ExtraState.loading(id: id));
      final result = await cartRepoImp.updateExtra(extra_id: id, amount: amount, pro_id: pro_id);
      result.fold(
        (l) {
          debugPrint('================= update : ${KFailure.toError(l)}');
          emit(ExtraState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= update : ${r.toString()}  ');
          cartModel = r;
          initExtraAmountMap.update(id, (value) => amount);
          emit(ExtraState.success(cartModel: cartModel!));
        },
      );
    } catch (e) {
      debugPrint('================= update (Catch): ${e.toString()} ');
      emit(ExtraState.error(error: Tr.get.something_went_wrong));
    }
  }

  delete(int id) async {
    try {
      emit(const ExtraState.loading());

      final result = await cartRepoImp.deleteExtra(id);
      result.fold(
        (l) {
          debugPrint('================= delete : ${KFailure.toError(l)}');
          emit(ExtraState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= delete : ${r.toString()}  ');
          cartModel = r;

          emit(ExtraState.success(cartModel: cartModel!));
        },
      );
    } catch (e) {
      debugPrint('================= delete (Catch): ${e.toString()} ');
      emit(ExtraState.error(error: Tr.get.something_went_wrong));
    }
  }
}

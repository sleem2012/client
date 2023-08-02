import '../../data/models/cart/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_state.freezed.dart';

@freezed
 class CartState with _$CartState{
  const factory CartState.initial() = CartStateInitial;
  const factory CartState.loading() = CartStateLoading;
  const factory CartState.updateLoading() = CartStateUpdateLoading;
  const factory CartState.AddLoading() = CartStateAddLoading;
  const factory CartState.success({ CartModel? cartModel}) = CartStateSuccess;
  const factory CartState.error({required String error}) = CartStateError;

}
// flutter pub run build_runner watch --delete-conflicting-outputs
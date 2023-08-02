import '../../data/models/cart/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'checkout_state.freezed.dart';

@freezed
 class CheckOutState with _$CheckOutState{
  const factory CheckOutState.initial() = CheckOutStateInitial;
  const factory CheckOutState.loading() = CheckOutStateLoading;
  const factory CheckOutState.updateLoading() = CheckOutStateUpdateLoading;
  const factory CheckOutState.AddLoading() = CheckOutStateAddLoading;
  const factory CheckOutState.success({ CartModel? model}) = CheckOutStateSuccess;
  const factory CheckOutState.error({required String error}) = CheckOutStateError;

}
// flutter pub run build_runner watch --delete-conflicting-outputs
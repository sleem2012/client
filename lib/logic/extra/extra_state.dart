import '../../data/models/cart/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'extra_state.freezed.dart';
@freezed
 class ExtraState with _$ExtraState{
  const factory ExtraState.initial() = ExtraStateInitial;
  const factory ExtraState.loading({int? id}) = ExtraStateLoading;
  const factory ExtraState.success({ CartModel? cartModel}) = ExtraStateSuccess;
  const factory ExtraState.error({required String error}) = ExtraStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
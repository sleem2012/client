import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/products/products_model.dart';
import '../../../packages/shared/error/failures.dart';

part 'product_menu_state.freezed.dart';

@freezed
class ProductMenuState with _$ProductMenuState {
  const factory ProductMenuState.initial() = ProductMenuStateInitial;

  const factory ProductMenuState.loading() = ProductMenuStateLoading;

  const factory ProductMenuState.success(List<ProductMenu> proMenuList) = ProductMenuStateSuccess;

  const factory ProductMenuState.error({required KFailure error}) = ProductMenuStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs

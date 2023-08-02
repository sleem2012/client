
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/products/products_model.dart';
part 'color_state.freezed.dart';

@freezed
 class ColorState with _$ColorState {
  const factory ColorState.initial() = ColorStateInitial;
  const factory ColorState.loading() = ColorStateLoading;
  const factory ColorState.success({required List<ProductColor>? model}) = ColorStateSuccess;
  const factory ColorState.error({required String error}) = ColorStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
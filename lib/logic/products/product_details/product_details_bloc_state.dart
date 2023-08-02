

import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_details_bloc_state.freezed.dart';
@freezed
 class ProductDetailsState with _$ProductDetailsState{
  const factory ProductDetailsState.initial() = ProductDetailsStateInitial;
  const factory ProductDetailsState.success() = ProductDetailsStateSuccess;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
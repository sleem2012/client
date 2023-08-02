import '../../../data/models/products/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/services/category_model.dart';

part 'products_state.freezed.dart';

@freezed
class GetProductsState with _$GetProductsState {
  const factory GetProductsState.loading() = GetProductsLoading;
  const factory GetProductsState.loadMore({required ProductsSysModel model}) = GetProductsLoadMore;
  const factory GetProductsState.success({required ProductsSysModel model}) = GetProductsSuccess;
  const factory GetProductsState.error({required String error}) = GetProductsError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs

@freezed
class GetProductsEvents with _$GetProductsEvents {
  const factory GetProductsEvents.get({CategoryModel? sub, required bool isMore, bool? isRefresh, int? companyId}) = GetProductsEventsGet;
}
// flutter pub run build_runner watch --delete-conflicting-outputs

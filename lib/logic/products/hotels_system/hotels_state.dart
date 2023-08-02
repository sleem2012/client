import '../../../data/models/products/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotels_state.freezed.dart';

@freezed
class HotelsState with _$HotelsState {
  const factory HotelsState.initial() = HotelsStateInitial;
  const factory HotelsState.loading() = HotelsStateLoading;
  const factory HotelsState.loadMore() = HotelsStateLoadMore;
  const factory HotelsState.success({required HotelsProductResponse model}) = HotelsStateSuccess;
  const factory HotelsState.error({required String error}) = HotelsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs

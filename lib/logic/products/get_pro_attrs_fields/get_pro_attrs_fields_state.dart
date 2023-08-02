import '../../../data/models/products/get_pro_attr_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_pro_attrs_fields_state.freezed.dart';

@freezed
class GetProAttrsFieldsState with _$GetProAttrsFieldsState {
  const factory GetProAttrsFieldsState.loading() = GetProAttrsFieldsStateLoading;
  const factory GetProAttrsFieldsState.success({required GetProAttrsFieldsModel model}) = GetProAttrsFieldsStateSuccess;
  const factory GetProAttrsFieldsState.error({required String error}) = GetProAttrsFieldsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
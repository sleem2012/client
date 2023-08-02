
import '../../../data/models/services/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_categories_state.freezed.dart';
@freezed
 class GetCategoriesState with _$GetCategoriesState{
  const factory GetCategoriesState.loading() = GetCategoriesStateLoading;
  const factory GetCategoriesState.success({required SupCategoriesModel supCategories}) = GetCategoriesStateSuccess;
  const factory GetCategoriesState.error({required String error}) = GetCategoriesStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs




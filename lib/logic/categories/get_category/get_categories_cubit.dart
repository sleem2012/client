import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/services/category_model.dart';
import '../../../data/repository/services/services_repo.dart';
import 'get_categories_state.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

class GetCategoriesBloc extends Cubit<GetCategoriesState> {
  GetCategoriesBloc({required this.servicesRepo}) : super(const GetCategoriesState.loading());

  static GetCategoriesBloc of(BuildContext context) {
    return BlocProvider.of<GetCategoriesBloc>(context);
  }

  final ServicesRepoImpl servicesRepo;
  SupCategoriesModel? supCategoriesModel;
  List<CategoryModel>? initialData = [];

  getCats(int? company_type_id) async {
    try {
      final result = await servicesRepo.getCategory(company_type_id);
      if (isClosed) return;
      result.fold(
        (l) => emit(GetCategoriesState.error(error: KFailure.toError(l))),
        (r) {
          supCategoriesModel = r;
          emit(GetCategoriesState.success(supCategories: r));
          initialData = supCategoriesModel?.data;
        },
      );
    } catch (e) {
      debugPrint('================= Get Categories Bloc Catch  : $e ');
      emit(GetCategoriesState.error(error: Tr.get.something_went_wrong));
    }
  }

  void search({required String v}) {
    if (v.isNotEmpty) {
      supCategoriesModel = supCategoriesModel?.copyWith(
        data: initialData?.where((element) => element.name!.toLowerCase().contains(v.toLowerCase())).toList(),
      );
    } else {
      supCategoriesModel = supCategoriesModel?.copyWith(data: initialData);
    }
    emit(GetCategoriesState.success(supCategories: supCategoriesModel!));
  }

  CategoryModel? supCatChild;

  setSelectedSupCat(CategoryModel s) {
    supCatChild = s;
    debugPrint('================= $supCatChild');
    emit(const GetCategoriesState.error(error: ''));
    emit(const GetCategoriesState.loading());
  }

  getChildById() {
    initialData = supCategoriesModel?.data?.where((element) => element.id == 1).toList();
  }

  setCatChild(CategoryModel value) {
    supCatChild = value;
    emit(GetCategoriesState.success(supCategories: supCategoriesModel!));
    emit(const GetCategoriesState.loading());
  }
}

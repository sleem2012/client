import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/ads/ads_model.dart' hide Logo;
import '../../data/models/user_info/user_model.dart';
import '../../data/repository/ads/company_repo.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';

import 'company_state.dart';

class CompanyBloc extends Cubit<CompanyState> {
  CompanyBloc({required this.compRepoImpl}) : super(const CompanyState.loading());

  static CompanyBloc of(BuildContext context) {
    return BlocProvider.of<CompanyBloc>(context);
  }

  int page = 1;
  int totalPages = 1;
  int totalItems = 0;
  int perPage = 10;

  final CompanyRepoImpl compRepoImpl;
  CompanyModel? compModel = CompanyModel();
  List<UserCompany>? initialData = [];

  getCompanies(bool isMore, {required int? cat_id, required int? com_type_id}) async {
    if (isMore && totalPages > page) {
      page++;
      emit(const CompanyState.loadmore());
    } else if (isMore && totalPages == page) {
      return;
    } else {
      page = 1;
      emit(const CompanyState.loading());
    }
    try {
      final result = await compRepoImpl.getCompanies(page: page, page_count: perPage, cat_id: cat_id, com_type_id: com_type_id);
      result.fold(
        (l) {
          debugPrint('================= comp Bloc $l : ');
          emit(CompanyState.error(error: KFailure.toError(l)));
        },
        (r) {
          if (isMore) {
            compModel = compModel?.copyWith(data: compModel?.data?..addAll(r.data ?? []));
          } else {
            compModel = r;
          }
          totalPages = (compModel!.pagination!.meta!.total! / perPage).ceil();
          totalItems = (compModel!.pagination!.meta!.total!);
          initialData = compModel?.data ?? [];
          emit(CompanyState.success(model: compModel!));
        },
      );
    } catch (e) {
      debugPrint('================= comp Bloc Ex : $e : ');
      emit(CompanyState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  UserCompany? selectedCompany;

  void search({required String v}) {
    if (v.isNotEmpty) {
      debugPrint(v);
      compModel = compModel?.copyWith(data: initialData?.where((element) => element.name!.value!.contains(v.trim())).toList());
    } else {
      compModel = compModel?.copyWith(data: initialData);
    }
    emit(CompanyState.success(model: compModel!));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/helpers_models.dart';
import '../../../data/repository/products/products_repo.dart';
import '../../../packages/extensions.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

import '../../../data/models/products/products_model.dart';
import '../../../data/models/services/category_model.dart';
import 'products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvents, GetProductsState> {
  GetProductsBloc({required this.productsRepoImp}) : super(const GetProductsState.loading()) {
    on<GetProductsEvents>(_getProducts);
  }

  final ProductsRepoImp productsRepoImp;

  static GetProductsBloc of(BuildContext context) => BlocProvider.of<GetProductsBloc>(context);

  int _page = 1;

  List<BlocEventState<GetProductsEvents, GetProductsSuccess>> stateEvents = [];
  ProductsSysModel? productsModel;
  CategoryModel? _catId;

  CategoryModel? get selectedCat => _catId;

  FutureOr<void> _getProducts(GetProductsEvents event, Emitter<GetProductsState> emit) async {
    debugPrint('================= is More >> ${event.isMore}   ${_catId?.name}');

    _catId = event.sub;
    final exist = stateEvents.firstWhereOrNull((element) => element.event.sub == _catId);
    bool no_more = exist?.state.model.pagination?.meta?.total == exist?.state.model.data?.length;
    debugPrint('================= is More >> ${event.isMore}  , no more >> $no_more  ,  ${_catId?.name}');
    if (exist != null) {
      emit(exist.state);
    }
    if (no_more && event.isMore) return;

    if (exist != null && !event.isMore && !(event.isRefresh ?? false)) {
      return;
    }
    if (event.isMore) {
      _page++;
      emit(GetProductsState.loadMore(model: exist!.state.model));
    } else {
      _page = 1;
      emit(const GetProductsState.loading());
    }

    try {
      final result = await productsRepoImp.get_products(catId: _catId?.id, count: 100, page: _page, companyId: event.companyId );
      result.fold(
        (l) {
          emit(GetProductsState.error(error: KFailure.toError(l)));
          debugPrint('================= Get Sys Products (Bloc) : $l  ');
        },
        (r) {
          productsModel = event.isMore
              ? exist?.state.model.copyWith(
                  data: exist.state.model.data?..addAll(r.data ?? []),
                  pagination: r.pagination,
                )
              : r;
          emit(GetProductsState.success(model: productsModel!));
          stateEvents.add(BlocEventState(event, GetProductsState.success(model: productsModel!) as GetProductsSuccess));
        },
      );
    } catch (e) {
      emit(GetProductsState.error(error: Tr.get.something_went_wrong));
      debugPrint('================= Get Sys Products (Bloc) (catch) : $e  ');
      rethrow;
    }
  }
}

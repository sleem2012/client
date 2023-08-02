import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/global/location/cities/cities_model.dart';
import '../../../data/models/products/products_model.dart';

import '../../../data/repository/products/products_repo.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/logger.dart';
import 'hotels_state.dart';

class HotelsBloc extends Cubit<HotelsState> {
  HotelsBloc({required this.productsRepoImp}) : super(const HotelsState.initial());

  static HotelsBloc of(BuildContext context) {
    return BlocProvider.of<HotelsBloc>(context);
  }

  final fromCtrl = TextEditingController();
  final toCtrl = TextEditingController();

  int page = 1;

  CitiesDatum? selectedCity;
  int? catId;

  selectCatId(int id) {
    catId = id;
  }

  selectCityId(CitiesDatum? citiesDatum) {
    selectedCity = citiesDatum;
  }

  final ProductsRepoImp productsRepoImp;
  HotelsProductResponse? productsModel;

  bool get no_more => productsModel?.pagination?.total == productsModel?.products.length;

  getHotelsProducts(int? catId, bool isMore, {int? companyId, required Map<String, int> mainAttr}) async {
    if (no_more && isMore) return;
    if (isMore) {
      page++;
      emit(const HotelsState.loadMore());
    } else {
      page = 1;
      emit(const HotelsState.loading());
    }

    try {
      final map = {
        if (catId != null) "category_id": catId,
        "page_count": 10,
        "page": page,
        "quantity": 1,
        if (selectedCity?.id! != null) "city_id": selectedCity?.id!,
        if (companyId != null) "company_id": companyId,
        if (fromCtrl.text.isNotEmpty) "from": fromCtrl.text,
        if (toCtrl.text.isNotEmpty) "to": toCtrl.text,
      }..addAll(mainAttr);

      printMap(map);

      final result = await productsRepoImp.get_hotels_products(map);
      result.fold(
        (l) {
          emit(HotelsState.error(error: KFailure.toError(l)));
          debugPrint('================= Get Sys Products (Bloc) : $l  ');
        },
        (r) {
          productsModel = isMore ? productsModel?.copyWith(products: productsModel?.products?..addAll(r.products), pagination: r.pagination) : r;
          debugPrint('================= ${r.products.length} : ');

          for (var element in r.products) {
            debugPrint('================= ${element.product?.name?.value} : ');
          }
          emit(HotelsState.success(model: productsModel!));
        },
      );
    } catch (e) {
      debugPrint('================= Get Sys Products (Bloc) (catch) : $e  ');
      emit(HotelsState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}

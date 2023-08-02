import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/products/products_model.dart';
import '../../../data/repository/products/products_repo.dart';
import '../../../packages/shared/error/failures.dart';
import 'product_menu_state.dart';

class ProductMenuBloc extends Cubit<ProductMenuState> {
  ProductMenuBloc({required this.productsRepoImp}) : super(const ProductMenuState.initial());

  static ProductMenuBloc of(BuildContext context) => BlocProvider.of<ProductMenuBloc>(context);

  final ProductsRepoImp productsRepoImp;
  ProductsMenuModel? productsMenuModel;

  get(ProductsSystemData? proSys) async {
    if ((proSys?.products ?? []).isEmpty || proSys?.products == null) {
      try {
        emit(const ProductMenuState.loading());
        final result = await productsRepoImp.get_pro_menu(proSys?.id);
        result.fold(
          (l) {
            debugPrint('================= ProductMenu Bloc : ${KFailure.toError(l)}');
            emit(ProductMenuState.error(error: l));
          },
          (r) {
            productsMenuModel = r;
            debugPrint('================= ProductMenu Bloc : ${r.toString()}  ');
            emit(ProductMenuState.success(r.products ?? []));
          },
        );
      } catch (e) {
        debugPrint('================= ProductMenu Bloc (Catch): ${e.toString()} ');
        emit(const ProductMenuState.error(error: KFailure.someThingWrongPleaseTryAgain()));
      }
    } else {
      await Future.delayed(Duration(milliseconds: 50));
      emit(ProductMenuState.success(proSys?.products ?? []));
    }
  }
}

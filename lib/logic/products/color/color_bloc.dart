import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/products/products_repo.dart';
import '../../../data/models/products/products_model.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import 'color_state.dart';

class ColorBloc extends Cubit<ColorState> {
  ColorBloc({required this.repo}) : super(const ColorState.initial());

  static ColorBloc of(BuildContext context) {
    return BlocProvider.of<ColorBloc>(context);
  }

  final ProductsRepoImp repo;
  String? selectedCurrency;

  List<ProductColor>? model;
  Future getColor() async {
    emit(const ColorState.loading());
    try {
      final result = await repo.get_colors();
      result.fold(
        (l) {
          debugPrint('================= Get Color: $l ');

          emit(ColorState.error(error: KFailure.toError(l)));
        },
        (r) {
          model = r;
          emit(ColorState.success(
            model: r,
          ));
        },
      );
    } catch (e) {
      debugPrint('================= Get Color Error: $e  ');
      emit(ColorState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}

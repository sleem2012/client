import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/products/get_pro_attr_model.dart';
import '../../../data/repository/products/products_repo.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/logger.dart';
import 'get_pro_attrs_fields_state.dart';

class GetProAttrsFieldsBloc extends Cubit<GetProAttrsFieldsState> {
  GetProAttrsFieldsBloc({required this.productsRepoImpl}) : super(const GetProAttrsFieldsState.loading());

  static GetProAttrsFieldsBloc of(BuildContext context) {
    return BlocProvider.of<GetProAttrsFieldsBloc>(context);
  }

  final ProductsRepoImp productsRepoImpl;
  GetProAttrsFieldsModel? getProAttrsFieldsModel;

  Map<String, dynamic> get values {
    return {
      "product_menu_id": productId,
      "attr_value_id": _values.keys.toList(),
      "answer": _values.values.toList(),
      "is_visible": 1,
    };
  }

  Map<String, int> attrValues = {};
  GetProAttrsFieldsModel? fieldsModel;
  setAttrValue(ProAttrCollections? val, int count) {
    if (count < 0) return;
    attrValues.addAll({"attributes[${val?.id}]": count});
    _update;
    printMap(attrValues);
  }

  int getAttrValue(ProAttrCollections? val) {
    return attrValues["attributes[${val?.id}]"] ?? 1;
  }

  _setAttributes(List<ProAttrData> list) {
    attrValues.clear();
    for (var attr in list) {
      for (int i = 0; i < (attr.collections?.length ?? 0); i++) {
        attrValues.addAll({"attributes[${attr.collections?[i].id}]": 0});
      }
    }
  }

  final Map<int, dynamic> _values = {};
  final Map<int, dynamic> _texts = {};
  final Map<int, List<Map<int, dynamic>>> _multiSelect = {};
  int? productId;

  void setAttr({required int key, required val}) {
    _texts.addAll({key: val});
  }

  void addBoolAttr(int catId, List<ProAttrCollections> p1) {
    _multiSelect[catId]?.clear();
    debugPrint('================= : $_multiSelect');
    for (var attr in p1) {
      if (_multiSelect.containsKey(catId)) {
        _multiSelect.update(catId, (value) => value..add({attr.id!: attr.value}));
      } else {
        _multiSelect.addAll({
          catId: [
            {attr.id!: attr.value}
          ]
        });
      }
    }
  }

  get setAllValues {
    _values.clear();
    _values.addAll(_texts);
    for (var attr in _multiSelect.values.toList()) {
      for (var v in attr) {
        _values.addAll(v);
      }
    }
    _update;
  }

  get _update {
    emit(const GetProAttrsFieldsState.loading());
    emit(GetProAttrsFieldsState.success(model: getProAttrsFieldsModel!));
  }

  set_pro_menu_id(int id) {
    productId = id;
    debugPrint('================= $id : $productId');
  }

  get(int? cat_id) async {
    /// getProAttrsFieldsModel = GetProAttrsFieldsModel.fromJson(json);
    /// emit(GetProAttrsFieldsState.success(model: getProAttrsFieldsModel!));
    /// _multueSelect.clear();
    /// setAllValues;
    /// return;
    try {
      _multiSelect.clear();
      emit(const GetProAttrsFieldsState.loading());
      final result = await productsRepoImpl.get_pro_attrs_menu(cat_id);
      result.fold(
        (l) {
          debugPrint('================= GetProAttrsFields Bloc : ${KFailure.toError(l)}');
          emit(GetProAttrsFieldsState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= GetProAttrsFields Bloc : ${r.toString()}  ');
          getProAttrsFieldsModel = r;
          setAllValues;
          emit(GetProAttrsFieldsState.success(model: r));
          _mainAttr = r.data?.where((element) => element.name == 'main').toList() ?? [];
          _setAttributes(_mainAttr);
        },
      );
    } catch (e) {
      debugPrint('================= GetProAttrsFields Bloc (Catch): ${e.toString()} ');
      emit(GetProAttrsFieldsState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  List<ProAttrData> get mainAttr => _mainAttr;
  List<ProAttrData> _mainAttr = [];
  setMainAttr(List<ProAttrData> main) {
    _mainAttr = main;
  }
}

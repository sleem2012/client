import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/menu_list.dart';

import '../../../../data/models/products/products_model.dart';

part 'vendor_details_state.dart';

class SectionTabsCubit extends Cubit<VendorDetailsState> {
  SectionTabsCubit() : super(VendorDetailsInitial());

  static SectionTabsCubit of(context) => BlocProvider.of(context);
  int? selected;

  changeIndex(int index) {
    selected = index;
    emit(ChangeIndex(index));
  }

  List<ProductsSystemData> proSystemList = [];
  List<MenuTileModel> menuProducts = [];
  ProductsSystemData? proSys;

  setSingleProSys(int i) {
    proSys = proSystemList[i];
  }

  setProSysList({required List<ProductsSystemData> date}) {
    proSystemList = date;
    setMenuProducts();
  }

  setMenuProducts() {
    for (var element in proSystemList) {
      final model = MenuTileModel(
        id: element.id.toString(),
        img: element.products?.firstOrNull?.imageValues?.firstOrNull?.s256px ?? '',
        name: element.name?.value ?? '',
        price: element.products?.firstOrNull?.price ?? '',
      );
      menuProducts.add(model);
    }
  }
}

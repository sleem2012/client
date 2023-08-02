import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../packages/extensions.dart';
import '../../../shared/theme/helper.dart';

import '../../../data/models/products/products_model.dart';
import '../../../logic/products/pro_helper.dart';
import '../product_details_entity.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  static DetailsCubit of(context) => BlocProvider.of(context);

  ProductsSystemData? proSystem;
  ProductSelectable? _selectedMain;
  ProductSelectable? _selectedSub;
  final List<ProductSelectable> _mainSelection = [];
  List<ProductsSystemData> similar = [];

  _setProductMenu(ProductMenu? selectedProductMenu) {
    this.selectedProductMenu = selectedProductMenu ?? products.firstOrNull;
  }

  setMainAndSub({ProductSelectable? main, sub}) {
    _selectedMain = main;
    _selectedSub = sub;
  }

  setProductSystem({required ProductsSystemData model, List<ProductsSystemData>? similar, ProductMenu? selectedProductMenu}) {
    productAmount = 1;
    _mainSelection.clear();
    proSystem = model;
    this.similar = similar ?? [];
    _setProductMenu(selectedProductMenu);
    setMainSelection();
    onMainSelect(getMainSelection.firstOrNull);
    _selectedSub = getMainSelection.firstOrNull?.subSelection?.firstOrNull;
    emit(SelectMainState());
  }

  List<ProductSelectable> productSubs(int? id) {
    final l = products.where((element) => element.productColor?.id == id).toList().map(
      (pro) {
        final sub = pro.productSize;
        return ProductSelectable(
          id: sub?.id.toString(),
          isSelected: false,
          title:
              (sub?.name?.value ?? pro.ribbon ?? name).capitalized + "  ( ${pro.price}  ${pro.discount != pro.price ? (pro.discount ?? '' + '/') : ''}) ",
          pro_id: pro.id.toString(),
        );
      },
    ).toList();
    return l;
  }

  setMainSelection() {
    for (var pro in products) {
      final main = pro.productColor;
      final x = ProductSelectable(
        id: main?.id.toString(),
        isSelected: false,
        title: main?.name?.value ?? '',
        pro_id: pro.id.toString(),
        subSelection: productSubs(main?.id),
        img: pro.imageValues?.firstOrNull?.s128px,
      );
      if (!_mainSelection.map((e) => e.id).toList().contains(x.id)) {
        _mainSelection.add(x);
      }
    }
  }

  int productAmount = 1;

  increaseProductAmount() {
    productAmount++;
    emit(ChangeAmount());
  }

  decreaseProductAmount() {
    if (productAmount == 1) {
      return;
    } else {
      productAmount--;
      emit(ChangeAmount());
    }
  }

  onMainSelect(ProductSelectable? item) {
    _selectedMain = item;
    if (_selectedMain?.subSelection?.map((e) => e.id).toList().contains(_selectedSub?.id) ?? false) {}

    onSubSelect(_selectedMain?.subSelection?.firstWhereOrNull((e) => e.id == _selectedSub?.id));
    emit(SelectMainState());
  }

  onSubSelect(ProductSelectable? item) {
    _selectedSub = item ?? _selectedMain?.subSelection?.firstOrNull;
    selectedProductMenu = products.firstWhereOrNull((element) => element.id.toString() == _selectedSub?.pro_id);
    debugPrint('================= Selected Pro Menu id >> ${selectedProductMenu?.id.toString()} ');
    emit(SelectMainState());
  }

  List<ProductMenu> get products => proSystem?.products ?? [];

  ProductMenu? selectedProductMenu;

  String get price => selectedProductMenu?.price?.split(' ').firstOrNull ?? '';

  String get currency => selectedProductMenu?.price?.split(' ').lastOrNull ?? '';

  String get discount => selectedProductMenu?.discount ?? '';

  String get name => proSystem?.name?.value ?? '';

  String get description => proSystem?.description?.value ?? '';

  String get companyTitle => proSystem?.company?.name?.value ?? '';

  UserCompany get company => proSystem?.company ?? UserCompany();

  String get companyImg => proSystem?.company?.coverPhotos?.firstOrNull?.s256px ?? dummyNetLogo;

  String get img => selectedProductMenu?.imageValues?.firstOrNull?.s1024px ?? dummyNetCover;

  double get rate => ProductHelper.proReviewAvg(selectedProductMenu);

  int get reviews => selectedProductMenu?.review?.length ?? 0;

  int get id => selectedProductMenu?.id ?? 0;

  bool get isFav => proSystem?.isFav ?? false;
  bool get hasMain => selectedProductMenu?.productColor != null;
  bool get hasSub => selectedProductMenu?.productSize != null;

  List<ProductSelectable> get getMainSelection => _mainSelection;

  List<ProductSelectable> get getSubSelection => selectedMain?.subSelection ?? [];

  ProductSelectable? get selectedMain => _selectedMain ?? _mainSelection.firstOrNull;

  ProductSelectable? get selectedSub => _selectedSub ?? getSubSelection.firstOrNull;

  List<ProductsSystemData>? get getSimilar => similar;

  bool get hasTimePicker => proSystem?.hasTimePicker ?? false;

  bool get isOneTime => proSystem?.isOneTime ?? false;
}

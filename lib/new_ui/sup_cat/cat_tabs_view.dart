import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/search/filter_product_screen.dart';

import '../../data/models/services/category_model.dart';
import '../../di.dart';
import '../../logic/products/product_system_bloc/products_state.dart';
import '../../views/services/widgets/search_field.dart';
import '../../views/widgets/appbar.dart';
import '../../views/widgets/new_bg_img.dart';
import 'sub_cat_child_tabs.dart';

class SubCategoriesView extends StatefulWidget {
  const SubCategoriesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SubCategoriesView> createState() => _SubCategoriesViewState();
}

class _SubCategoriesViewState extends State<SubCategoriesView> {
  List<CategoryModel> filteredList = [];

  @override
  void initState() {
    filteredList = widget.category.children ?? [];
    super.initState();
  }

  bool containsCats(CategoryModel element, String val) => element.name!.toLowerCase().contains(val.toLowerCase());

  void onSearch(String val) {
    filteredList = widget.category.children
            ?.where(
              (element) => containsCats(element, val) || element.children!.where((element) => containsCats(element, val)).isNotEmpty,
            )
            .toList() ??
        [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: KAppBar(title: widget.category.name?.toUpperCase() ?? ''),
      body: BlocProvider(
        create: (context) => Di.getProductsBloc
          ..add(
            GetProductsEventsGet(
              sub: widget.category.children?.firstOrNull ?? widget.category,
              isMore: false,
            ),
          ),
        child: BgImg(
          child: Column(
            children: [
              KSearchBar(
                onSearch: onSearch,
                onFilter: () {
                    Nav.to(FilterProductScreen(supCatChild: widget.category,));
                },
              ),
              SubCatChildTabs(supCatChild: widget.category.copyWith(children: filteredList)),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class SAT {
  String g();
}

class SAT1 extends SAT {
  @override
  String g() {
    // TODO: implement g
    throw UnimplementedError();
  }
}

class SAT2 extends SAT1 {}

final c = SAT2();

v() {
  c.g();
}

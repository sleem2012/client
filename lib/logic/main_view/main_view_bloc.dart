import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';

@immutable
class MainViewState {
  final int index;

  const MainViewState({required this.index});
}

class MainViewBloc extends Cubit<MainViewState> {
  MainViewBloc() : super(const MainViewState(index: 4));

  static MainViewBloc of(BuildContext context) {
    return BlocProvider.of<MainViewBloc>(context);
  }

  PageController pageCtrl = PageController(initialPage: 4);

  void navTaped(int page) {
    if (page != pageCtrl.page?.toInt()) {
      pageCtrl.jumpToPage(page);
    }
    emit(MainViewState(index: page));
  }

  List<String> labels = [
    (Tr.get.favorite),
    (Tr.get.chat),
    (Tr.get.cart),
    (Tr.get.profile),
    (Tr.get.home),
    (Tr.get.notification),
  ];

  List<IconData> navItems = [
    KHelper.favorite,
    KHelper.chats,
    Icons.shopping_cart_rounded,
    KHelper.person,
  ];
}

import 'package:flutter/material.dart';

import 'text_theme.dart';

abstract class KColors {
  static ColorsGetter of(BuildContext context) {
    return ColorsGetter(context);
  }

  //Light
  static const Color backgroundL = Color(0xFFffffff);
  static const Color textL = KTextStyle.mainL;
  static const Color linearOne = Color(0xff00ADB5);
  static const Color linearTwo = Color(0xFFBDE4E7);
  static const Color elevatedBoxL = Color(0xFFffffff);
  static const Color productElevatedBoxL = Color(0xffDDE6E6);
  static const Color navBarL = Color(0xFFF8F8F8);
  static const Color actionBTNL = Color(0xFF05B646);
  static const Color inActionBTNL = Color(0xFF8BD8D7);
  static const Color fabL = Color(0xFF45C0BE);
  static const Color iconL = Color(0xFF00ADB5);
  static const Color selectedIconL = Color(0xFF222134);
  static const Color errorL = Colors.red;
  static const Color shadowL = Color(0x20000000);
  static const Color cursorL = Color(0xFFBE0202);
  static const Color accentColorL = Color(0xFF00ADB5);
  static const Color searchFillColorL = Colors.white;
  static const Color bsBackground = Color(0xffCCE6E6);
  static const Color accentWithOpacity = Color(0xff92CCCF);
  static const Color fillContainerL = Color(0xff7EC5C8);

  //Dark
  static const Color backgroundD = Color(0xff292C3B);
  static const Color darkField = Color(0xFF406478);
  static const Color searchFillColorD = Color.fromARGB(100, 66, 69, 84);
  static const Color textD = KTextStyle.mainD;
  static const Color fillContainerD = Color(0xFF223C4A);

  static const Color elevatedBoxD = Color(0xFF223C4A);
  static const Color productElevatedBoxD = Color(0xff456575);
  static const Color navBarD = Color(0xFF292C3B);
  static const Color actionBTND = Color(0xFF05B646);
  static const Color inActionBTND = Color(0xFF8BD8D7);
  static const Color fabD = Color(0xFF45C0BE);
  static const Color iconD = Color(0xFF00ADB5);
  static const Color selectedIconD = Colors.white;
  static const Color errorD = Colors.red;
  static const Color shadowD = Color(0x20000000);
  static const Color cursorD = Color(0xFFBE0202);
  static const Color accentColorD = Color(0xFF00ADB5);

  static const Color gray = Color(0xff465D5B);
  static const Color grayDark = Color(0xff2F3345);
  static const Color viewColor = Color(0xff45C0BE);
  static const Color sBackground = Color(0xffD5EEED);
  static const Color gridBackground = Color(0xFFFFFFFF);
  static const Color gridBackgroundDark = Color(0xFF555562);
  static const Color svg = Color(0xff46C0BE);
  static const Color bluishColor = Color(0xff61607A);
  static const Color divider = Color(0xff494D61);
  static const Color bgItem = Color(0xff424654);

  ///Text Colors
  ////
  static const Color greenTxt = Color(0xFF48B857);
  static const Color orangeTxt = Color(0xFFF94545);
  static const Color blackTxt = Color(0xFF223C4A);
  static const Color accentTxt = Color(0xFF00ADB5);
  static const Color whiteTxt = Color(0xffF1F1F1);
}

class ColorsGetter extends KColors {
  final BuildContext? _context;

  ColorsGetter(this._context);

  //Getters
  Color get error {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.errorL : KColors.errorD;
  }

  Color get text {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.textD : KColors.textL;
  }

  Color get actionBTN {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.actionBTNL : KColors.actionBTND;
  }
  Color get fillContainer {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.fillContainerL : KColors.fillContainerD;
  }
  Color get freeShiping {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.inActionBTNL : KColors.inActionBTND;
  }

  Color get fillColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.backgroundL : KColors.backgroundD;
  }

  Color get navBar {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.navBarD : KColors.navBarL;
  }

  Color get card {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.accentColorL : KColors.elevatedBoxD;
  }

  Color get background {
    return Theme.of(_context!).brightness == Brightness.dark ? KColors.backgroundD : KColors.backgroundL;
  }

  Color get elevatedBox {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.elevatedBoxL : KColors.elevatedBoxD;
  }

  Color get productElevatedBox {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.productElevatedBoxL : KColors.productElevatedBoxD;
  }

  Color get shadow {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.shadowL : KColors.shadowD;
  }

  Color get cursor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.cursorL : KColors.cursorD;
  }

  Color get reBackground {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.backgroundD : KColors.backgroundL;
  }

  Color get searchFillColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.searchFillColorL : KColors.searchFillColorD;
  }

  Color get divider {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.divider : KColors.divider;
  }

  Color get bgItem {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.bgItem : KColors.bgItem;
  }

  Color get border {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.backgroundD.withOpacity(.2) : KColors.backgroundL.withOpacity(.2);
  }

  Color get trackColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.actionBTND : KColors.actionBTND;
  }

  Color get thumbColor {
    return Colors.white;
  }

  Color get activeIcons {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.iconL : KColors.iconD;
  }

  Color get bsBackground {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.bsBackground : KColors.productElevatedBoxD;
  }

  Color get selected {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.selectedIconL : KColors.selectedIconD;
  }

  Color get fabBackground {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.fabL : KColors.fabD;
  }

  Color get accentColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.accentColorL : KColors.accentColorD;
  }Color get accentOpacity {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.accentWithOpacity : KColors.accentWithOpacity;
  }

  Color get greyColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.gray : KColors.grayDark;
  }

  Color get viewColor {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.viewColor : KColors.viewColor;
  }

  Color get sBackground {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.sBackground : KColors.gridBackgroundDark;
  }

  Color get gridBackground {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.gridBackground.withOpacity(.8) : KColors.gridBackgroundDark.withOpacity(.8);
  }

  Color get svg {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.svg : KColors.svg;
  }

  Color get bluish {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.gridBackground : KColors.bluishColor;
  }

  Color get selectedCats {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.textL : KColors.textD;
  }

  Color get unSelectedCats {
    return Theme.of(_context!).brightness == Brightness.light ? KColors.textL.withOpacity(.4) : KColors.textD.withOpacity(.5);
  }
}

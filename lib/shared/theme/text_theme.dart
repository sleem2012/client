import 'package:flutter/material.dart';

import 'colors.dart';

abstract class KTextStyle {
  static TextStyleGetters of(BuildContext context) {
    return TextStyleGetters(context);
  }

  //Light
  static const Color mainL = Color(0xFF569BA5);
  static const Color subL = Color(0xFF45C0BE);
  static const Color orangeText = Color(0xFF05B646);

  //Dark
  static const Color mainD = Color(0xffd5d5d5);
  static const Color subD = Color(0xFF45C0BE);
}

class TextStyleGetters {
  final BuildContext? _context;
  TextStyleGetters(this._context);

  bool get isAr => Directionality.of(_context!) == TextDirection.rtl;
  String get fontFamily => isAr ? 'font' : "sf";

  //Getters
  TextStyle get headers {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get headers2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get names {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.subL : KTextStyle.subD,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get profileTiles {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.subL : KTextStyle.subD,
      fontSize: 13,
      fontFamily: fontFamily,
    );
  }

  TextStyle get tileProps {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 11,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get labels {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 12,
      fontFamily: fontFamily,
    );
  }

  TextStyle get labelsB {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 12,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get listTileTitle {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get listTileSub {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.subL : KTextStyle.subD,
      fontSize: 8,
      fontFamily: fontFamily,
    );
  }

  TextStyle get tilePropsValues {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get tilePropsValues1 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 14,
      fontFamily: fontFamily,
    );
  }

  TextStyle get bodyTrans {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.7) : KTextStyle.mainD.withOpacity((.7)),
      fontSize: 14,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body1 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get reBody {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.dark ? Colors.black : Colors.white,
      fontSize: 14,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 12.5,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body3 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 11.5,
      fontFamily: fontFamily,
    );
  }

  TextStyle get blackbody3 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 11.5,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body4 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get subCatText {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 8,
      fontFamily: fontFamily,
    );
  }

  TextStyle get tapBar {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 13,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get editBTN {
    return const TextStyle(
      color: Colors.white,
      fontSize: 10,
    );
  }

  TextStyle get addTooCart {
    return TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get freeShiping {
    return TextStyle(
      color: KTextStyle.mainL,
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get enabled {
    return TextStyle(color: KTextStyle.orangeText, fontSize: 12, fontFamily: fontFamily, fontWeight: FontWeight.bold);
  }

  TextStyle get error {
    return TextStyle(color: Colors.red, fontSize: 14, fontFamily: fontFamily);
  }

  TextStyle get success {
    return TextStyle(color: Colors.green, fontSize: 14, fontFamily: fontFamily);
  }

  TextStyle get hint {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.5) : KTextStyle.mainD.withOpacity(.5),
      fontSize: 12,
      fontFamily: fontFamily,
    );
  }

  TextStyle get lineThrough {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.5) : KTextStyle.mainD.withOpacity(.5),
      fontSize: 14,
      fontFamily: fontFamily,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle get hintWithUnderLine {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.5) : KTextStyle.mainD.withOpacity(.5),
      fontSize: 12,
      fontFamily: fontFamily,
      decoration: TextDecoration.underline,
    );
  }

  TextStyle get hint2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.5) : KTextStyle.mainD.withOpacity(.5),
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get hint3 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.5) : KTextStyle.mainD.withOpacity(.5),
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get topHint {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.subL : KTextStyle.subD,
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get title {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get title1 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get boldTitle1 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get boldTitle2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get price {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black.withOpacity(.6) : Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get doublePrice {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black.withOpacity(.3) : Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get title2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get title3 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 14,
      fontFamily: fontFamily,
    );
  }

  TextStyle get title4 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 13,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get title5 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 12,
      fontFamily: fontFamily,
    );
  }

  TextStyle get btntitle {
    return TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: fontFamily,
    );
  }

  TextStyle get textBtn {
    return TextStyle(
      color: Colors.blue,
      fontSize: 14,
      fontFamily: fontFamily,
    );
  }

  /////////////////////////////////////////////
  ///
  ///
  ///

  TextStyle get _base_Style {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KColors.blackTxt : KColors.whiteTxt,
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get _base_Style_bold => _base_Style.copyWith(fontWeight: FontWeight.bold);

  TextStyle get black_grey => _base_Style;
  TextStyle get black_grey_bold => _base_Style_bold;

  TextStyle get grey_white => _base_Style.copyWith(color: Theme.of(_context!).brightness == Brightness.dark ? KColors.whiteTxt : KColors.gray);
  TextStyle get grey_white_bold => grey_white.copyWith(fontWeight: FontWeight.bold);

  TextStyle get orange_txt => _base_Style.copyWith(color: KColors.orangeTxt);
  TextStyle get orangeTxt_B => orange_txt.copyWith(fontWeight: FontWeight.bold);

  TextStyle get green_txt => _base_Style.copyWith(color: KColors.greenTxt);
  TextStyle get greenTxt_B => green_txt.copyWith(fontWeight: FontWeight.bold);

  TextStyle get white_txt => _base_Style.copyWith(color: KColors.whiteTxt);
  TextStyle get whiteTxt_B => white_txt.copyWith(color: KColors.whiteTxt);

  TextStyle get black_txt => _base_Style.copyWith(color: KColors.blackTxt);
  TextStyle get black_txt_B => black_txt.copyWith(color: KColors.blackTxt);

  TextStyle get accent_txt => _base_Style.copyWith(color: KColors.accentColorD);
  TextStyle get accent_txt_B => accent_txt.copyWith(fontWeight: FontWeight.bold);
}

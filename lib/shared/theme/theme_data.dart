import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'helper.dart';

class KThemeData {
  BuildContext? context;
  KThemeData(this.context);

  static KThemeData of(BuildContext context) {
    return KThemeData(context);
  }

  SystemUiOverlayStyle get overlayStyle {
    return Theme.of(context!).brightness == Brightness.light ? _lightOverLay : _darkOverLay;
  }

  static ThemeData get light {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.elevatedBoxL,
      appBarTheme: const AppBarTheme(
        color: KColors.elevatedBoxL,
        systemOverlayStyle: _lightOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.iconL),
        iconTheme: IconThemeData(color: KColors.iconL),
      ),
      shadowColor: KColors.shadowL,
      inputDecorationTheme: inputDecorationTheme(accentColor: Colors.transparent),
      iconTheme: const IconThemeData(color: KColors.iconL),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowL, background: KColors.accentColorL),
      switchTheme: const SwitchThemeData(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.elevatedBoxD,
      appBarTheme: const AppBarTheme(
        color: KColors.elevatedBoxD,
        systemOverlayStyle: _darkOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.iconD),
        iconTheme: IconThemeData(color: KColors.iconD),
      ),
      shadowColor: KColors.shadowD,
      inputDecorationTheme: inputDecorationTheme(accentColor: Colors.transparent),
      iconTheme: const IconThemeData(color: KColors.iconD),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowD, background: KColors.accentColorD),
      switchTheme: const SwitchThemeData(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    );
  }

  static ElevatedButtonThemeData elevatedBtnTheme({required Color shadow, required Color background}) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        shadowColor: MaterialStateProperty.all<Color>(shadow),
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(background),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(KHelper.btnRadius)),
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme({required Color accentColor}) {
    return InputDecorationTheme(
      border: outlineInputBorder(color: accentColor),
      disabledBorder: outlineInputBorder(color: accentColor),
      errorBorder: outlineInputBorder(color: Colors.red),
      focusedErrorBorder: outlineInputBorder(color: Colors.red),
      enabledBorder: outlineInputBorder(color: accentColor),
      focusedBorder: outlineInputBorder(color: Colors.grey.withOpacity(0.0)),
    );
  }

  static OutlineInputBorder outlineInputBorder({required Color color}) => OutlineInputBorder(
        borderSide: BorderSide(width: .75, color: color),
        borderRadius: BorderRadius.circular(KHelper.txtFRadius),
      );

  static const SystemUiOverlayStyle _darkOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle _lightOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}

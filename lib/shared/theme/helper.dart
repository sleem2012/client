import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/multi_select_dialog/multi_helper.dart';
import '../../packages/shared/picker/data/country_search_model/address_result.dart';
import '../../packages/shared/picker/view/map.dart';
import '../localization/trans.dart';
import 'colors.dart';
import 'text_theme.dart';

String get dummyNetLogo => 'https://forall.sa/assets/image/no-image.jpg';

String get dummyNetCover => 'https://forall.sa/assets/image/bg.jpg';

abstract class KHelper {
  static _KHelperGetters of(BuildContext context) {
    return _KHelperGetters.of(context);
  }

  /// Icons Data =================*
  static const IconData activity = Icons.show_chart_rounded;
  static const IconData list = Icons.list_rounded;
  static const IconData store = Icons.storefront_rounded;
  static const IconData add = Icons.add;
  static const IconData person = Icons.person;
  static const IconData check = Icons.check_circle;
  static const IconData cancel = Icons.cancel;
  static const IconData delete = Icons.delete;
  static const IconData chats = Icons.chat;
  static const IconData moreHoriz = Icons.more_horiz;
  static const IconData notifications = Icons.notifications;
  static const IconData expand = Icons.keyboard_arrow_down_rounded;
  static const IconData expandSided = Icons.keyboard_arrow_right_rounded;
  static const IconData phone = Icons.phone_android_rounded;
  static const IconData email = Icons.email_rounded;
  static const IconData location = Icons.location_pin;
  static const IconData branches = Icons.map_rounded;
  static const IconData payment = Icons.payment_rounded;
  static const IconData orders = Icons.local_shipping;
  static const IconData lang = Icons.language_rounded;
  static const IconData passworrd = Icons.key_rounded;
  static const IconData theme = Icons.dark_mode_rounded;
  static const IconData terms = Icons.file_copy_rounded;
  static const IconData privacyPolicy = Icons.privacy_tip_rounded;
  static const IconData help = Icons.help;
  static const IconData visibility = Icons.visibility;
  static const IconData visibilityOff = Icons.visibility_off;
  static const IconData logout = Icons.exit_to_app;
  static const IconData home = Icons.home;
  static const IconData money = Icons.attach_money;
  static const IconData chat = Icons.message;
  static const IconData bascket = Icons.card_travel;
  static const IconData favorite = Icons.favorite;
  static const IconData search = Icons.search;
  static const IconData share = Icons.share;
  static const IconData join = Icons.join_inner;

  /// Constants =================*
  static const double btnRadius = 12.0;
  static const double txtFRadius = 24;
  static const double cornerRadius = 8.0;
  static const double hPadding = 12.0;
  static const double hScaffoldPadding = 30.0;
  static const double iconSize = 18.0;
  static const double iconSize2 = 15.0;

  static Future<T?> showCustomBottomSheet<T>(Widget child, {bool? isScrollControlled}) async {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: isScrollControlled ?? true,
      context: Nav.navigator.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 30),
        color: KColors.of(context).sBackground,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: DecoratedBox(decoration: of(Nav.navigator.currentContext!).elevatedBox, child: const SizedBox(height: 8, width: 80)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  primary: true,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showSnackBar(String msg, {bool? isTop}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      '',
      '',
      snackPosition: isTop ?? true ? SnackPosition.TOP : SnackPosition.BOTTOM,
      barBlur: 10.0,
      //backgroundColor: Colors.black.withOpacity(.6),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      duration: const Duration(seconds: 6),
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 8),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      dismissDirection: DismissDirection.horizontal,
      //colorText: Colors.white,
      messageText: Text(
        msg,
        textAlign: TextAlign.center,
        // style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  static double get height {
    return MediaQuery.of(Nav.navigator.currentContext!).size.height;
  }

  static double get width {
    return MediaQuery.of(Nav.navigator.currentContext!).size.width;
  }

  static String apiDateFormatter(DateTime date) {
    return DateFormat('yyyy-MM-dd kk:mm').format(date);
  }

  static Future<AddressResult?> showMaps(BuildContext context, {Position? initLocation}) async {
    return await showGoogleMapLocationPicker(
      pinWidget: const Icon(Icons.location_pin, color: Colors.red, size: 40),
      pinColor: Colors.blue,
      context: context,
      addressPlaceHolder: 'move_the_map'.tr,
      addressTitle: 'single_address'.tr,
      apiKey: 'AIzaSyA4PY3RYKRShU07E-8rxSKnBMHY5UNUDjY',
      appBarTitle: Tr.get.choose_location,
      confirmButtonColor: KColors.of(context).accentColor,
      confirmButtonText: Tr.get.confirm_location,
      confirmButtonTextColor: Colors.white,
      country: "eg",
      language: "ar",
      searchHint: Tr.get.search_for_location,
      initialLocation: LatLng(
        initLocation?.latitude ?? 33.0515261234,
        initLocation?.longitude ?? 31.1952702387,
      ),
    );
  }
}

class _KHelperGetters {
  static BuildContext? _context;
  static _KHelperGetters? _instance;

  _KHelperGetters._internal() {
    _instance = this;
  }

  static _KHelperGetters of(BuildContext context) {
    _context = context;
    return _instance ?? _KHelperGetters._internal();
  }

  BoxDecoration get errorBorder {
    return BoxDecoration(
      color: KColors.of(_context!).fillColor,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: KColors.of(_context!).error, width: 1),
    );
  }

  BoxDecoration get elevatedBox {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 2.0, offset: const Offset(0, 2), color: KColors.of(_context!).shadow),
      ],
    );
  }

  Border get eBorder => Border.all(color: KColors.of(_context!).error, width: 1);

  BoxDecoration get roundedFields {
    return BoxDecoration(
      color: KColors.of(_context!).background,
      borderRadius: BorderRadius.circular(22),
    );
  }

  BoxDecoration get fillContainer {
    return BoxDecoration(
      color: KColors.of(_context!).fillContainer,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 6.0, offset: const Offset(0, 3), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get bsBackground {
    return BoxDecoration(
      color: KColors.of(_context!).bsBackground,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 2.0, offset: const Offset(0, 2), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get productElevatedBox {
    return BoxDecoration(
      color: KColors.of(_context!).productElevatedBox,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 2.0, offset: const Offset(0, 2), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get outLined {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: KColors.of(_context!).accentColor, width: 1),
    );
  }

  BoxDecoration get gradientDecoration {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.1, 0.7],
        colors: [Color(0xb01B1D27), Color(0xb0595E72)],
      ),
    );
  }

  IconData get back {
    bool isAr = Directionality.of(_context!).name == TextDirection.RTL.value;
    return isAr ? Icons.arrow_back : Icons.arrow_forward;
  }

  get gradient => const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.1, 0.7],
        colors: [Color(0xb01B1D27), Color(0xb0595E72)],
      );

  BoxDecoration get msgBubble {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 2.0, offset: const Offset(0, 2), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get shimmerBox {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox.withOpacity(.3),
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
    );
  }

  BoxDecoration get shimmerCircle {
    return BoxDecoration(color: KColors.of(_context!).elevatedBox.withOpacity(.3), shape: BoxShape.circle);
  }

  BoxDecoration get underLineBox {
    return BoxDecoration(
      border: Border(bottom: BorderSide(color: KColors.of(_context!).accentOpacity)),
      shape: BoxShape.rectangle,
    );
  }

  BoxDecoration get underLineBoxError => underLineBox.copyWith(border: Border(bottom: BorderSide(color: KColors.of(_context!).error)));

  BoxDecoration get outlineBorder {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(KHelper.cornerRadius), border: Border.all(color: KColors.of(_context!).accentColor, width: 1));
  }

  BoxDecoration get outElevatedBox {
    return BoxDecoration(
      color: KColors.of(_context!).bluish,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      border: Border.all(color: KColors.of(_context!).accentColor, width: 1.5),
    );
  }

  BoxDecoration get selectedBox {
    return BoxDecoration(
      color: KColors.of(_context!).accentColor,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: KColors.of(_context!).accentColor, width: 1.5),
    );
  }

  BoxDecoration get outSelectedBox {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: KColors.of(_context!).accentColor, width: 1.5),
    );
  }

  BoxDecoration get freeShipping {
    return BoxDecoration(
      color: KColors.of(_context!).freeShiping,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(blurRadius: 6.0, offset: const Offset(0, 3), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get filled {
    return BoxDecoration(
      color: KColors.of(_context!).fillColor,
      borderRadius: BorderRadius.circular(50),
    );
  }

  BoxDecoration get outlineCircle {
    return BoxDecoration(border: Border.all(color: KColors.of(_context!).accentColor, width: 1), shape: BoxShape.circle);
  }

  BoxDecoration outlineCircleSelected(bool isSelected) {
    return BoxDecoration(
      border: Border.all(color: isSelected ? KColors.of(_context!).selectedCats : KColors.of(_context!).unSelectedCats, width: 1),
      shape: BoxShape.circle,
    );
  }

  BoxDecoration circle(Color color) {
    return BoxDecoration(color: color, shape: BoxShape.circle);
  }

  DropdownMenuItem<T> dropdownItem<T>({required String itemText, required T value}) {
    return DropdownMenuItem<T>(
      value: value,
      child: Center(
        child: Text(
          itemText,
          style: KTextStyle.of(_context!).body,
        ),
      ),
    );
  }

  MultiSelectorItem<T> itemView<T>({required String itemText, required T value, Widget? icon}) {
    return MultiSelectorItem<T>(
      value: value,
      searchValue: itemText,
      icon: icon,
      child: Text(itemText, style: KTextStyle.of(_context!).body, overflow: TextOverflow.ellipsis),
    );
  }
}

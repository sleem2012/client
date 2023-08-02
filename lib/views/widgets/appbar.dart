import 'package:flutter/material.dart';
import '../../packages/extensions.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../Auth/login/login_screen.dart';
import '../notifications/view/notifications_list.dart';
import '../services/widgets/cart_icon_btn.dart';
import 'custom_button.dart';
import '../../packages/widgets/icon_button.dart';
import 'not_loggedin.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showCart;
  final bool needsPop;
  final bool home;
  final String? title;
  final Widget? titleWidget;
  final bool? showAct;

  const KAppBar({
    Key? key,
    this.title,
    this.showCart = true,
    this.needsPop = false,
    this.titleWidget,
    this.home = false, this.showAct,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appBar',
      child: AppBar(
        title: titleWidget ?? Text((title ?? '').capitalized),
        titleTextStyle: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold),
        actions: [
          if (KStorage.i.getToken == null)
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomBtn(
                width: Get.width * .2,
                text: Tr.get.login,
                onChange: () {
                  Get.to(() => const LoginScreen());
                },
                textStyle: KTextStyle.of(context).editBTN,
              ),
            ),
          if (showCart)
            const CartIconButton()
          else
            KNotLoggedInWidget(
              child: KIconButton(
                child: Icon(KHelper.notifications, color: KColors.of(context).accentColor),
                onPressed: () {
                  Nav.to(const NotificationsList());
                },
              ),
            ),
        ],
      ),
    );
  }
}

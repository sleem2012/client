import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../packages/cache/locale_storage.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../Auth/login/login_screen.dart';
import '../home_screen/widgets/location_widget.dart';
import 'custom_button.dart';
import '../../packages/widgets/icon_button.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../logic/main_view/main_view_bloc.dart';

class HomeAppBar extends StatelessWidget {
  final bool showCart;
  final bool home;
  final String? title;
  final Widget? titleWidget;

  const HomeAppBar(
      {Key? key,
      this.title,
      this.showCart = true,
      this.titleWidget,
      this.home = false})
      : super(key: key);

  @override
  // Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,


        children: [
          Center(child: SvgPicture.asset("assets/images/Logo Only.svg")),
          const LocationWidget(),

          if (KStorage.i.getToken == null)
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomBtn(
                width: Get.width * .3,
                text: Tr.get.not_loggedin,
                onChange: () {
                  Get.to(() => const LoginScreen());
                },
                textStyle: KTextStyle.of(context).title2.copyWith(fontSize: 10),
              ),
            ),

          /// if (showCart)
          ///   const CartIconButton()
          /// else
          KIconButton(
            child: Icon(KHelper.notifications,
                color: KColors.of(context).accentColor),
            onPressed: () {
              MainViewBloc.of(context).navTaped(2);
            },
          ),
        ],
      ),
    );
  }
}

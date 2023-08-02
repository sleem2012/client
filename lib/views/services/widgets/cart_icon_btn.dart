import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../logic/cart/cart_bloc.dart';
import '../../../logic/cart/cart_state.dart';
import '../../../shared/theme/colors.dart';
import '../../cart/cart_screen.dart';
import '../../../packages/widgets/icon_button.dart';
import 'package:get/get.dart';

import '../../../packages/chat/view/widgets/un_readed_msg_badge.dart';
import '../../widgets/not_loggedin.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KNotLoggedInWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              KIconButton(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(color: KColors.of(context).bgItem, borderRadius: BorderRadius.circular(5)),
                  child: SvgPicture.asset('assets/images/Cart Icon 25x25.svg', width: 18),
                ),
                onPressed: () {
                  Get.to(() => const CartScreen());
                },
              ),
              Positioned(top: 7, left: 0, child: UnReadedCountBadge(count: CartBloc.of(context).itemCount)),
            ],
          );
        }),
      ),
    );
  }
}

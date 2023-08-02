import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cart/cart_bloc.dart';
import '../../logic/cart/cart_state.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';

class AmountChanger extends StatelessWidget {
  const AmountChanger({
    Key? key,
    required this.id,
    this.isVertical = false,
  }) : super(key: key);

  final int id;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    CartBloc cart = CartBloc.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Flex(
          direction: isVertical ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AmountBtn(
              iconData: Icons.add,
              onTap: () {
                if (cart.amountMap[id] != null) {
                  cart.increaseAmount(id);
                } else {
                  cart.addToCart(id, 1);
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 25,
                //width: 35,
                child: Center(
                  child: state.maybeWhen(
                    updateLoading: () => Visibility(
                      visible: (cart.amountMap[id] != cart.initAmountMap[id]),
                      replacement: Text(cart.amountMap[id]?.toString() ?? '0',
                          style: KTextStyle.of(context).boldTitle1),
                      child: SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                            color: KColors.of(context).accentColor,
                            strokeWidth: 2),
                      ),
                    ),
                    orElse: () => FittedBox(
                        child: Text(cart.amountMap[id]?.toString() ?? '0',
                            style: KTextStyle.of(context).boldTitle1)),
                  ),
                ),
              ),
            ),
            AmountBtn(
                iconData: Icons.remove, onTap: () => cart.decreaseAmount(id)),
          ],
        );
      },
    );
  }
}

class AmountBtn extends StatelessWidget {
  const AmountBtn({Key? key, required this.iconData, required this.onTap})
      : super(key: key);

  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: KColors.of(context).accentColor, shape: BoxShape.circle),
          child:  Icon(iconData, color: Colors.white, size: 14),
        ));
  }
}

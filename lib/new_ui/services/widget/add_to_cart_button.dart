import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../logic/cart/cart_bloc.dart';
import '../../../logic/cart/cart_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../views/services/widgets/schedule_picker.dart';
import '../../../views/widgets/custom_button.dart';
import '../../product_details/logic/details_cubit.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key,  this.btnTitle});
final String? btnTitle;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        state.whenOrNull(success: (_) => KHelper.showSnackBar(_?.message ?? ''));
      },
      builder: (context, state) {
        final cartBloc = CartBloc.of(context);
        final details = DetailsCubit.of(context);

        return state.maybeWhen(
          orElse: () => CustomBtn(
            onChange: () async {
              debugPrint(details.id.toString());
              if (details.hasTimePicker == true) {
                final dateFrom = details.isOneTime
                    ? await Get.bottomSheet<DateTime>(
                  SchedulePicker(pro_menu_id: details.id, duration: details.selectedProductMenu?.duration ?? 0),
                )
                    : await Get.bottomSheet<DateTime>(
                  ScheduleRangePicker(duration: details.selectedProductMenu?.duration ?? 0, pro_menu_id: details.id),
                );
                if (dateFrom == null) return;
                final dateTo = details.isOneTime
                    ? await Get.bottomSheet<DateTime>(
                  ScheduleRangePicker(
                    duration: details.selectedProductMenu?.duration ?? 0,
                    pro_menu_id: details.id,
                    firstDate: dateFrom..add(const Duration(days: 1)),
                  ),
                )
                    : null;
                if (dateTo == null && details.isOneTime) {
                  return;
                }
                String formattedDate = KHelper.apiDateFormatter(dateFrom);
                String? formattedDateTo = dateTo != null ? KHelper.apiDateFormatter(dateTo) : null;
                await cartBloc.addToCart(
                  details.id,
                  details.productAmount,
                  // extraIds: proBloc.extraIds.toSet().toList(),
                  // extraAmount: proBloc.extraAmountList,
                  date: formattedDate,
                  dateTo: formattedDateTo,
                );
              } else {
                await cartBloc.addToCart(
                  details.id,
                  details.productAmount,

                  // extraIds: proBloc.extraIds.toSet().toList(),
                  // extraAmount: proBloc.extraAmountList,
                );
              }
              if (context.mounted) {
                Nav.back();
              }
            },
            text: btnTitle??Tr.get.done,
          ),
          AddLoading: () => CircularProgressIndicator(color: KColors.of(context).accentColor),
        );
      },
    );
  }
}

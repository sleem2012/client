import 'package:flutter/material.dart';
import '../../../../../data/models/in_drive/trip_model.dart';
import '../../../../../logic/in_drive/update_trip/update_trip_cubit.dart';
import '../../../../../shared/localization/trans.dart';
import '../../../../../shared/theme/text_theme.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/slugs_drop_down.dart';
import 'package:get/get.dart';
import 'indrive_payment.dart';

class InDriverStateCases extends StatelessWidget {
  const InDriverStateCases({Key? key, required this.data}) : super(key: key);
  final TripModelData data;

  @override
  Widget build(BuildContext context) {
    switch (data.state) {
      case KSlugModel.waitingUser:
        return KButton(
          title: Tr.get.confirm,
          width: Get.width * 0.2,
          onPressed: () {
            UpdateTripCubit.of(context).updateTrip(context: context, State: KSlugModel.paymentNeeded, id: data.id);
          },
        );

      case KSlugModel.paymentNeeded:
        return KButton(
          title: Tr.get.pay,
          width: Get.width * 0.2,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => InDrivePayment(data: data),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            );
          },
        );
      default:
        return Text(
          data.state.toString(),
          style: KTextStyle.of(context).names,
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/hotels/hotel_extra_bloc.dart';
import '../../../logic/hotels/hotel_extra_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'extra_card.dart';
import 'package:get/get.dart';

class ExtraWidget extends StatelessWidget {
  const ExtraWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelExtraBloc, HotelExtraState>(
      builder: (context, state) {
        final extra = HotelExtraBloc.of(context);
        if ((extra.productMenu?.extras ?? []).isNotEmpty) {
          return Container(
            padding: const EdgeInsets.all(KHelper.hPadding),
            width: Get.width,
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Tr.get.extras,
                  style: KTextStyle.of(context).title2.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: Get.height / 5.6,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, i) => const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: (extra.productMenu?.extras?.length ?? 0),
                    itemBuilder: (c, i) {
                      return ExtraCard(
                        extras: (extra.productMenu?.extras ?? [])[i],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

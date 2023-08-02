import 'package:flutter/material.dart';
import '../../../../data/models/jobs/jobs_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import 'package:get/get.dart';

import '../../../../shared/theme/text_theme.dart';

class JobViews extends StatelessWidget {
  const JobViews({
    Key? key,
    required this.jobData,
  }) : super(key: key);
  final JobData jobData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_pin),
            const SizedBox(
              width: 5,
            ),
            SizedBox(width: Get.width / 1.5, child: Text('${jobData.addressId?.detailedAddress}')),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '${jobData.counter?.viewed}',
                  style: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(Tr.get.viewed),
              ],
            ),
            Container(
              height: 50,
              width: 2,
              color: KColors.of(context).accentColor,
            ),
            Column(
              children: [
                Text('${jobData.counter?.applied}', style: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold)),
                Text(Tr.get.applied_count),
              ],
            ),
            Container(
              height: 50,
              width: 2,
              color: KColors.of(context).accentColor,
            ),
            Column(
              children: [
                Text('${jobData.counter?.accepted}', style: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold)),
                Text(Tr.get.accepted),
              ],
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:forall_client/views/widgets/not_loggedin.dart';
import '../../../data/models/jobs/jobs_model.dart';
import '../../../packages/extensions.dart';

import 'job_bottom_sheet.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/services/jobs/widgets/skills_card.dart';
import '../../../views/widgets/custom_button.dart';
import 'package:get/get.dart';

class CompanyJobCard extends StatelessWidget {
  const CompanyJobCard({Key? key, required this.data}) : super(key: key);
  final JobData data;
  @override
  Widget build(BuildContext context) {
    final list = [
      Text(
        data.title ?? '',
        style: KTextStyle.of(context).black_grey_bold.S(1.4),
      ),
      Text(
        data.addressId?.detailedAddress ?? '',
        style: KTextStyle.of(context).black_grey.S(1.2),
      ),
      Text(
        data.closedAt ?? '',
        style: KTextStyle.of(context).green_txt.S(1.3),
      ),
      SkillsCard(),
      2.h,
      Text(
        data.description?.value ?? '',
        style: KTextStyle.of(context).black_grey.S(1.2),
      ),
      KNotLoggedInWidget(
        child: Align(
          alignment: Tr.isAr ? Alignment.topLeft : Alignment.bottomRight,
          child: CustomBtn(
            text: Tr.get.apply,
            onChange: () {
              Get.bottomSheet(
                JobBottomSheet(
                  job: data,
                ),
              );
            },
            width: Get.width * .25,
            height: 30,
          ),
        ),
      )
    ];

    return Container(
      decoration: KHelper.of(context).outSelectedBox,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (c, i) => list[i],
        separatorBuilder: (c, i) => 3.h,
        itemCount: list.length,
      ),
    );
  }
}

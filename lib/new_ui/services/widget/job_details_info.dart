import 'package:flutter/material.dart';

import '../../../packages/extensions.dart';
import '../../../logic/jobs/get_jobs/get_jobs_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/services/delivering/widgets/key_value_text.dart';
import '../../../views/services/jobs/widgets/skills_card.dart';

class JobDetailsInfo extends StatelessWidget {
  const JobDetailsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetJobsBloc job = GetJobsBloc.of(context);

    // final List<SkillsCollection>listType = job.skills;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    job.applicationsNumber.toString(),
                    style: KTextStyle.of(context).accent_txt_B.S(2.7),
                  ),
                  3.w,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Tr.get.applied_count,
                        style: KTextStyle.of(context).black_grey.S(1.2),
                      ),
                      Text(
                        "${job.positionNumber} ${Tr.get.open_position}",
                        style: KTextStyle.of(context).black_grey.S(1.2),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${job.positionNumber} \n ${Tr.get.viewed}', style: KTextStyle.of(context).black_grey.S(1.2), textAlign: TextAlign.center),
                    15.w,
                    Container(
                      height: 20,
                      width: 2,
                      color: Colors.black,
                    ),
                    15.w,
                    Text('${job.acceptedNumber} \n ${Tr.get.inconsideration}', style: KTextStyle.of(context).black_grey.S(1.2), textAlign: TextAlign.center),
                    15.w,
                    // Container(
                    //   height: 20,
                    //   width: 2,
                    //   color: Colors.black,
                    // ),
                    // 15.w,
                    // Text(
                    //   '0  \n ${Tr.get.not_selected}',
                    //   style: KTextStyle.of(context).black_grey.S(1.2),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
            ],
          ),
          21.h,
          Text(Tr.get.job_details, style: KTextStyle.of(context).black_grey_bold.S(1.4)),
          5.h,
          KeyValueText(title: Tr.get.experience_needed, value: job.experienceNeeded),
          5.h,
          KeyValueText(title: Tr.get.experience_level, value: job.experienceLevel),
          5.h,
          KeyValueText(title: Tr.get.salary, value: job.salary),
          5.h,
          KeyValueText(title: Tr.get.category, value: job.jobCategory),
          20.h,
          Text(
            Tr.get.skills,
            style: KTextStyle.of(context).black_grey_bold.S(1.4),
          ),
          5.h,
          SkillsCard(),
          20.h,
          Text(
            Tr.get.job_description,
            style: KTextStyle.of(context).black_grey_bold.S(1.4),
          ),
          5.h,
          Text(
            job.jobDesc,
            style: KTextStyle.of(context).black_grey.S(1.2),
          ),
          20.h,
          Text(
            Tr.get.job_requirement,
            style: KTextStyle.of(context).black_grey_bold.S(1.4),
          ),
          5.h,
          Text(
            job.jobRequirements,
            style: KTextStyle.of(context).black_grey.S(1.2),
          ),
        ],
      ),
    );
  }
}

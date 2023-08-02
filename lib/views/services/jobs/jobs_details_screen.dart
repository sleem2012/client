import 'package:flutter/material.dart';
import '../../../data/models/jobs/jobs_model.dart';
import '../../../shared/localization/trans.dart';
import 'widgets/job_header.dart';
import 'widgets/job_views.dart';
import 'widgets/jobs_requirement.dart';
import '../../widgets/appbar.dart';
import '../../widgets/new_bg_img.dart';

import 'widgets/job_details_card.dart';

class JobsDetailsScreen extends StatelessWidget {
  const JobsDetailsScreen({Key? key, required this.jobData}) : super(key: key);
  final JobData jobData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: ''),
      body: BgImg(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              JobHeader(jobData: jobData),
              JobViews(jobData: jobData),
              const SizedBox(
                height: 10,
              ),
              JobDetailsCard(
                jobData: jobData,
              ),
              // SkillsCard(
              // ),
              JobRequirement(title: Tr.get.job_description, content: '${jobData.description?.value}'),
              JobRequirement(title: Tr.get.job_requirement, content: '${jobData.requirements?.value}'),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

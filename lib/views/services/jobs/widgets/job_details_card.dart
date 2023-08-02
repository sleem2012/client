import 'package:flutter/material.dart';
import '../../../../data/models/jobs/jobs_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';

class JobDetailsCard extends StatelessWidget {
  const JobDetailsCard({Key? key, required this.jobData}) : super(key: key);
  final JobData jobData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
          child: Text(
            Tr.get.job_details,
            style: KTextStyle.of(context).title2.copyWith(fontSize: 11),
          ),
        ),
        Container(
          decoration: KHelper.of(context).elevatedBox,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        Tr.get.experience_needed,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text('${jobData.experienceYears}', style: const TextStyle(fontSize: 8))
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        Tr.get.salary,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text('${jobData.salary}', style: const TextStyle(fontSize: 8))
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        Tr.get.experience_level,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text('${jobData.experience}', style: const TextStyle(fontSize: 8))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        Tr.get.employment_type,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text('${jobData.employmentType}', style: const TextStyle(fontSize: 8))
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        Tr.get.work_place,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text('${jobData.workPlace}', style: const TextStyle(fontSize: 8))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}

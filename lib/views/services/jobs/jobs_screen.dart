import 'package:flutter/material.dart';
import '../../../data/models/jobs/jobs_model.dart';
import '../../../logic/jobs/get_jobs/get_jobs_bloc.dart';
import '../../../shared/localization/trans.dart';
import 'widgets/job_card.dart';
import '../../widgets/empty_widget.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key, required this.jobData}) : super(key: key);
  final List<JobData> jobData;

  @override
  Widget build(BuildContext context) {
    return  SizedBox (
      height: double.infinity,
      child: RefreshIndicator(
        onRefresh: () async{
          await  GetJobsBloc.of(context).getJobs();
        },
        child: EmptyWidget(
          list:jobData,
          imagePath: "assets/images/empty_job.svg",
          title: Tr.get.no_jobs,
          child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, i) =>  JobCard(data: jobData[i]),
              separatorBuilder: (context, i) => const SizedBox(height: 10),
              itemCount: jobData.length
          ),
        ),
      ),
    );
  }
}

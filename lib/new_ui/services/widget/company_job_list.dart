import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/theme/helper.dart';
import '../../../data/models/jobs/jobs_model.dart';
import '../../../logic/company/company_by_id/company_bloc_by_id.dart';
import '../../../logic/jobs/get_jobs/get_jobs_bloc.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../views/widgets/empty_widget.dart';
import '../../../views/widgets/error/error_widget.dart';
import '../../../views/widgets/shimmer_box.dart';
import 'package:get/get.dart';

import '../../../logic/jobs/get_jobs/get_jobs_state.dart';
import 'company_job_card.dart';
import 'job_details.dart';

class CompanyJobList extends StatefulWidget {
  const CompanyJobList({Key? key}) : super(key: key);

  @override
  State<CompanyJobList> createState() => _CompanyJobListState();
}

class _CompanyJobListState extends State<CompanyJobList> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    final id = CompanyBlocById.of(context).compId;
    GetJobsBloc.of(context).getJobs(company_id: id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final CompanyBlocById comp = CompanyBlocById.of(context);
    return BlocBuilder<GetJobsBloc, JobsState>(
      builder: (context, state) {
        final job = GetJobsBloc.of(context).jobModel?.data;
        return Padding(
          padding:  EdgeInsets.all(KHelper.hPadding),
          child: state.when(
            initial: () => ShimmerBox(width: Get.width),
            loading: () => ShimmerBox(width: Get.width),
            success: (jobModel) {
              return EmptyWidget(
                title: Tr.get.no_jobs,
                list: job ?? [],
                imagePath: 'assets/images/empty_job.svg',
                child: ListView.separated(
                  itemBuilder: (_, i) {
                    return InkWell(
                      onTap: () {
                        GetJobsBloc.of(context).selectJob(job?[i]);
                        Nav.to(BlocProvider.value(value: GetJobsBloc.of(context), child: const JobDetailsView()));
                      },
                      child: CompanyJobCard(data: job?[i] ?? JobData()),
                    );
                  },
                  itemCount: job?.length ?? 0,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
              );
            },
            error: (error) => KErrorWidget(
              error: state.whenOrNull(error: (error) => error),
              isError: true,
              onTryAgain: GetJobsBloc.of(context).getJobs(company_id: comp.compId),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => GetJobsBloc.of(context).jobModel?.data != null;
}

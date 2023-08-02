import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/jobs/job_state.dart';
import '../../../di.dart';
import '../../../logic/jobs/get_jobs/get_jobs_bloc.dart';
import '../../../logic/jobs/get_jobs/get_jobs_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/text_theme.dart';
import 'jobs_screen.dart';
import '../../widgets/appbar.dart';
import '../../widgets/city_selector.dart';
import '../../widgets/error/error_widget.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/not_loggedin.dart';
import 'package:get/get.dart';

class JobsTabView extends StatefulWidget {
  const JobsTabView({Key? key}) : super(key: key);

  @override
  State<JobsTabView> createState() => _JobsTabViewState();
}

class _JobsTabViewState extends State<JobsTabView> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.getJobsBloc..getJobs(),
      child: Scaffold(
        appBar: KAppBar(title: Tr.get.jobs),
        body: BgImg(
          child: KNotLoggedInView(
            child: BlocBuilder<GetJobsBloc, JobsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const KLoadingOverlay(isLoading: true),
                  loading: () => const KLoadingOverlay(isLoading: true),
                  success: (model) => Column(
                    children: [
                      TabBar(
                        padding: EdgeInsets.symmetric(horizontal: Get.height / 50, vertical: 15),
                        controller: tabController,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Text(Tr.get.offers, style: KTextStyle.of(context).tapBar),
                          Text(Tr.get.applied, style: KTextStyle.of(context).tapBar),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: CitySelector(
                                onChanged: (v) => GetJobsBloc.of(context).filterJobs(model: model, cityId: v.id ?? -1),
                              ),
                            ),
                            KIconButton(
                              child: const Icon(Icons.clear),
                              onPressed: () {
                                GetJobsBloc.of(context).filterJobs(model: model, cityId: 0, removeFilter: true);
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            ...KJobState.list.map((e) {
                              return JobsScreen(
                                jobData: model.data!.where((element) => element.isApplied == e.slug).toList(),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  error: (error) => KErrorWidget(
                    error: state.whenOrNull(error: (error) => error),
                    isError: true,
                    onTryAgain: GetJobsBloc.of(context).getJobs,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:forall_client/views/widgets/not_loggedin.dart';
import '../../../data/models/jobs/jobs_model.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../packages/extensions.dart';
import '../../../logic/jobs/get_jobs/get_jobs_bloc.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../product_details/widget/company_info.dart';
import '../../product_details/widget/sliver_app_bar.dart';
import '../company_details.dart';
import 'job_bottom_sheet.dart';
import '../../../views/widgets/custom_button.dart';
import '../../../packages/widgets/icon_button.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';

import '../../../views/widgets/new_bg_img.dart';
import 'package:get/get.dart';

import 'job_details_info.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = GetJobsBloc.of(context);
    return Scaffold(
        body: BgImg(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                KSLiverAppbar(img: details.jobCover),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(details.jobTitle, style: KTextStyle.of(context).black_grey_bold.S(1.5)),
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: KColors.of(context).activeIcons,
                                child: KIconButton(
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.ios_share,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Divider(
                        color: KColors.of(context).accentColor,
                      ),
                      InkWell(
                        onTap: () {
                          Nav.to(CompanyDetailsView(company: details.company ?? UserCompany()));
                        },
                        child: CompanyInfoWidget(company: details.company ?? UserCompany()),
                      ),
                      Divider(
                        color: KColors.of(context).accentColor,
                      ),
                      17.h,
                      const JobDetailsInfo(),
                    ],
                  ),
                )
              ],
            ),
          ),
          30.h,
          KNotLoggedInWidget(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
              child: CustomBtn(
                onChange: () {
                  Get.bottomSheet(JobBottomSheet(
                    job: details.selectedJob ?? JobData(),
                  ));
                },
                text: Tr.get.apply,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

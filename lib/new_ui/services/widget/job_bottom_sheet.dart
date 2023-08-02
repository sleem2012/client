import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/jobs/jobs_model.dart';
import '../../../data/models/jobs/my_cv_model.dart';
import '../../../di.dart';
import '../../../packages/extensions.dart';
import '../../../logic/jobs/apply_to_job/apply_to_job_cubit.dart';
import '../../../logic/jobs/apply_to_job/apply_to_job_state.dart';
import '../../../logic/jobs/getCv/get_cv_bloc.dart';
import '../../../logic/jobs/getCv/cv_state.dart';
import '../../../logic/jobs/uploadCv/upload_cv_cubit.dart';
import '../../../logic/jobs/uploadCv/upload_cv_state.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/widgets/drop_down.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../../views/widgets/on_success_view.dart';
import '../../../views/widgets/shimmer_box.dart';
import 'package:get/get.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../views/widgets/custom_button.dart';
import '../../../views/widgets/text_field.dart';

class JobBottomSheet extends StatelessWidget {
  const JobBottomSheet({Key? key, required this.job}) : super(key: key);
  final JobData job;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.cvBloc..get()),
        BlocProvider(create: (context) => Di.applyToJobCubit),
        BlocProvider(create: (context) => Di.uploadCvCubit),
      ],
      child: Container(
        decoration: KHelper.of(context).elevatedBox,
        padding: const EdgeInsets.all(KHelper.hScaffoldPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Tr.get.select_resume,
                style: KTextStyle.of(context).black_grey_bold.S(1.4),
              ),
              10.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 11,
                    child: BlocBuilder<GetCvsBloc, GetCvState>(
                      builder: (context, state) {
                        final myCvs = GetCvsBloc.of(context).myCvsModel?.cvData ?? [];

                        return KRequestOverlay(
                            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                            error: state.whenOrNull(error: (error) => error),
                            loadingWidget: ShimmerBox(
                              width: Get.width * .8,
                              height: 50,
                            ),
                            onTryAgain: state.whenOrNull(error: (error) => GetCvsBloc.of(context).get()),
                            child: myCvs.isNotEmpty
                                ? KDropdownBtn<CvData>(
                                    onChanged: GetCvsBloc.of(context).onCVSelected,
                                    items: myCvs.map((e) => KHelper.of(context).itemView<CvData>(itemText: "${e.cv}", value: e)).toList(),
                                    title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_resume,
                                  )
                                : const SizedBox());
                      },
                    ),
                  ),
                  const Spacer(flex: 1),
                  BlocConsumer<UploadCvCubit, UploadCvState>(
                    listener: (context, state) {
                      state.whenOrNull(
                          success: () => GetCvsBloc.of(context).get(),
                          loading: () => ShimmerBox(
                                width: Get.width * .8,
                                height: 50,
                              ));
                    },
                    builder: (context, state) {
                      final upload = UploadCvCubit.of(context);
                      return Expanded(
                        flex: 1,
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: KColors.of(context).activeIcons,
                            child: KIconButton(
                              onPressed: () {
                                upload.pick_file();
                              },
                              child: state is UploadCvStateLoading
                                  ? const CircularProgressIndicator()
                                  : const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                            )),
                      );
                    },
                  )
                ],
              ),
              10.h,
              Text(
                Tr.get.add_note_if_you_have,
                style: KTextStyle.of(context).black_grey_bold.S(1.4),
              ),
              10.h,
              KTextFormField(
                boxDecoration: KHelper.of(context).outSelectedBox,
                maxLines: 5,
                maxLength: 500,
                hintText: Tr.get.write_your_note,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Tr.get.field_required;
                  }

                  return null;
                },
              ),
              30.h,
              // if (GetCvsBloc.of(context).selectedCV != null)
              BlocConsumer<ApplyToJobCubit, ApplyToJobState>(
                listener: (context, state) {
                  Navigator.of(context);
                  state.whenOrNull(
                      success: () => Get.to(() => OnSuccessView(
                            msg: Tr.get.you_applied_to_job_successfully,
                            doubleBack: true,
                          )));
                },
                builder: (context, state) {
                  final apply = ApplyToJobCubit.of(context);

                  return KButton(
                    title: Tr.get.apply,
                    height: 40,
                    isLoading: state is ApplyToJobStateLoading,
                    onPressed: () {
                      apply.applyToJob(cvId: GetCvsBloc.of(context).selectedCV?.id ?? 0, jobId: job.id ?? -1);
                    },
                  );
                  // return state.maybeWhen(
                  //     orElse: () => CustomBtn(
                  //       text: Tr.get.apply,
                  //       onChange: () {
                  //         apply.applyToJob(
                  //             cvId: GetCvsBloc.of(context)
                  //                 .selectedCV
                  //                 ?.id ??
                  //                 0,
                  //             jobId: job.id??-1);
                  //       },
                  //       height: 40,
                  //     ),
                  //     loading: () => SizedBox(
                  //         width: 30,
                  //         height: 30,
                  //         child: Center(
                  //             child: CircularProgressIndicator(
                  //               color: KColors.of(context).accentColor,
                  //             ))));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

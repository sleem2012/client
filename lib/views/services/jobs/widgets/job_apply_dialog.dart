import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di.dart';
import '../../../../logic/jobs/apply_to_job/apply_to_job_cubit.dart';
import '../../../../logic/jobs/apply_to_job/apply_to_job_state.dart';
import '../../../../logic/jobs/getCv/get_cv_bloc.dart';
import '../../../../logic/jobs/getCv/cv_state.dart';
import '../../../../logic/jobs/uploadCv/upload_cv_cubit.dart';
import '../../../../logic/jobs/uploadCv/upload_cv_state.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import 'my_cvs_card.dart';
import '../../../widgets/action_dialog.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/error/error_widget.dart';
import '../../../widgets/on_success_view.dart';
import '../../../widgets/shimmer_box.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class JobApplyDialog extends StatelessWidget {
  const JobApplyDialog(
      {Key? key, required this.jobId, required this.companyImage})
      : super(key: key);
  final int jobId;
  final String companyImage;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider(create: (context) => Di.cvBloc..get()),
    BlocProvider(create: (context) => Di.applyToJobCubit),
    BlocProvider(create: (context) => Di.uploadCvCubit),
      ],
      child: Material(
    color: Colors.transparent,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // margin: MediaQuery.of(context).viewInsets,
          padding: const EdgeInsets.symmetric(
              horizontal: KHelper.hPadding, vertical: 20),
          decoration: KHelper.of(context)
              .elevatedBox
              .copyWith(color: KColors.of(context).background),
          child: BlocConsumer<GetCvsBloc, GetCvState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cvBloc = GetCvsBloc.of(context);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    Tr.get.select_resume,
                    style: KTextStyle.of(context).names,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  state.when(
                      loading: () => const SizedBox(
                            height: 58,
                            child: ShimmerBox(),
                          ),
                      success: (model) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: model?.cvData?.length ?? 0,
                          itemBuilder: (_, i) {
                            return MyCvsCard(
                              onPressed: () async {
                                debugPrint(model?.cvData![i].cv ?? '');
                                final String filePath =
                                    model?.cvData![i].cv ?? '';

                                await launchUrlString(
                                  filePath,
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              title: model?.cvData![i].createdAt ?? '',
                              value: model?.cvData![i],
                              groupValue: cvBloc.selectedCV,
                              onChanged: cvBloc.onCVSelected,
                              onDelete: () {
                                ActionDialog(
                                  title: Tr.get.remove_cv,
                                  approveAction: Tr.get.yes_message,
                                  cancelAction: Tr.get.no_message,
                                  onApproveClick: () {
                                    Navigator.pop(context);

                                    cvBloc.deleteCv(
                                        model?.cvData![i].id ?? 0);
                                  },
                                  onCancelClick: () {
                                    Navigator.pop(context);
                                  },
                                ).show<void>(context);
                              },
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        );
                      },
                      error: (error) => KErrorWidget(
                            error:
                                state.whenOrNull(error: (error) => error),
                            isError: true,
                            onTryAgain: cvBloc.get,
                          )),
                  BlocConsumer<UploadCvCubit, UploadCvState>(
                    listener: (context, state) {
                      state.whenOrNull(
                          success: () => GetCvsBloc.of(context).get(),
                          loading: () => const SizedBox(
                                height: 58,
                                child: ShimmerBox(),
                              ));
                    },
                    builder: (context, state) {
                      final uploadCv = UploadCvCubit.of(context);
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            uploadCv.pick_file();
                          },
                          child: state.maybeWhen(
                              loading: () => SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color:
                                        KColors.of(context).accentColor,
                                  ))),
                              orElse: () => Text(
                                    Tr.get.upload_resume,
                                    style: KTextStyle.of(context).names,
                                  )),
                        ),
                      );
                    },
                  ),
                  if (GetCvsBloc.of(context).selectedCV != null)
                    BlocConsumer<ApplyToJobCubit, ApplyToJobState>(
                      listener: (context, state) {
                        Navigator.of(context);
                        state.whenOrNull(
                            success: () => Get.to(() => OnSuccessView(
                                  msg: Tr.get
                                      .you_applied_to_job_successfully,
                                  doubleBack: true,
                                )));
                      },
                      builder: (context, state) {
                        final apply = ApplyToJobCubit.of(context);
                        return state.maybeWhen(
                            orElse: () => CustomBtn(
                                  text: Tr.get.apply,
                                  onChange: () {
                                    apply.applyToJob(
                                        cvId: GetCvsBloc.of(context)
                                                .selectedCV
                                                ?.id ??
                                            0,
                                        jobId: jobId);
                                  },
                                  height: 40,
                                ),
                            loading: () => SizedBox(
                                width: 30,
                                height: 30,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: KColors.of(context).accentColor,
                                ))));
                      },
                    ),
                ],
              );
            },
          ),
        ),
        Positioned(
          right: Get.width * .4,
          top: -Get.height * .038,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: CachedNetworkImageProvider(
              companyImage,
              maxHeight: Get.height.toInt(),
            ),
          ),
        ),
      ],
    ),
      ),
    );
  }
}

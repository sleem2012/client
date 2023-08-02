import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../app.dart';
import '../../di.dart';
import '../../logic/auth/logout/logout_bloc.dart';
import '../../logic/auth/logout/logout_state.dart';
import '../../logic/auth/update_user/update_user_bloc.dart';
import '../../logic/auth/update_user/update_user_state.dart';
import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/auth/user_info/user_info_state.dart';
import '../../logic/main_view/main_view_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/theme/theme_cubit.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/payment/view/payment_view.dart';
import '../../packages/shared/api_client/endpoints.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../Auth/login/login_screen.dart';
import '../orders/history_view.dart';
import '../widgets/action_dialog.dart';
import '../widgets/theme_toggle_btn.dart';
import 'change_password...dart';
import 'profile_widgets.dart';
import 'update_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120, left: 8, right: 8),
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            final user = UserInfoBloc.of(context).user;
            return Column(
              children: [
                ListTile(
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      backgroundImage: CachedNetworkImageProvider(user?.data?.image?.s128px?.toString() ?? dummyNetLogo),
                    ),
                    title: Text("${user?.data?.name}", style: KTextStyle.of(context).names),
                    subtitle: Text("${Tr.get.your_id.toString()}: ${user?.data?.id.toString()}", style: KTextStyle.of(context).tilePropsValues),
                    trailing: InkWell(
                        onTap: () {
                          Get.to(() => const UpdateProfile());
                        },
                        child: Icon(Icons.edit))),
                // Card(
                //   margin: EdgeInsets.zero,
                //   elevation: 5,
                //   color: KColors.of(context).elevatedBox,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 5),
                //     child: ProfileTile(
                //       leading: KHelper.person,
                //       title: '${Tr.get.your_balance}:',
                //       traling: Text('21.5 ${user?.data?.currency?.name?.key.toString()}', style: KTextStyle.of(context).body2),
                //     ),
                //   ),
                // ),
                ProfileSectionTitle(title: Tr.get.my_account),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).elevatedBox,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        ProfileTile(
                          leading: KHelper.phone,
                          title: Tr.get.phone_number,
                          traling: Text('${user?.data?.mobile}', style: KTextStyle.of(context).body3),
                        ),
                        ProfileTile(
                          leading: KHelper.email,
                          title: Tr.get.business_email,
                          traling: Text('${user?.data?.email}', style: KTextStyle.of(context).body3),
                        ),
                        ProfileTile(
                          leading: KHelper.location,
                          title: Tr.get.region,
                          traling: Text(
                            '${user?.data?.address?.cityId?.countryId?.name?.value} , ${user?.data?.address?.cityId?.name?.value}',
                            style: KTextStyle.of(context).body3,
                            softWrap: false,
                          ),
                        ),
                        ProfileTile(
                          leading: KHelper.favorite,
                          title: Tr.get.favorite,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () {
                            MainViewBloc.of(context).navTaped(0);
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.payment,
                          title: Tr.get.payment_information,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () => Nav.to(const PaymentView()),
                        ),
                        ProfileTile(
                          leading: KHelper.orders,
                          title: Tr.get.orders,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () => Nav.to(const HistoryView()),
                        ),
                      ],
                    ),
                  ),
                ),
                ProfileSectionTitle(title: Tr.get.my_settings),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).elevatedBox,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        ProfileTile(
                          leading: KHelper.passworrd,
                          title: Tr.get.change_password,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () => Get.to(() => const ChangePassword()),
                        ),
                        ProfileTile(
                          leading: KHelper.theme,
                          title: Tr.get.theme_mode,
                          traling: const ThemeToggleBtn(size: KHelper.iconSize2),
                          onTap: ThemeBloc.of(context).updateThemeMode,
                        ),
                        ProfileTile(
                          leading: KHelper.terms,
                          title: Tr.get.terms_and_conditions,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            await launchUrlString(KStorage.i.getSettings?.data?.first.termsContent?.client ?? '', );
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.privacyPolicy,
                          title: Tr.get.privacy_policy,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            await launchUrlString(KStorage.i.getSettings?.data?.first.privacyContent?.client ?? '',);
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.help,
                          title: Tr.get.help,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            String? encodeQueryParameters(Map<String, String> params) {
                              return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
                            }

                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'support@forallfa.com',
                              query: encodeQueryParameters(<String, String>{
                                'subject': 'I need Help , Please Contact Me',
                              }),
                            );
                            launchUrl(emailLaunchUri);
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.share,
                          title: Tr.get.share,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            shareTheApp(context);
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.join,
                          title: Tr.get.join_forall,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            await launchUrlString(KEndPoints.appStoreLinkVendor,mode: LaunchMode.externalApplication);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).elevatedBox,
                  child: BlocConsumer<LogoutBloc, LogoutState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          KStorage.i.delToken;
                          KStorage.i.delUserInfo;
                          Get.offAll(() => const Wrapper());
                        },
                      );
                    },
                    builder: (context, state) {
                      return ProfileTile(
                        leading: KHelper.logout,
                        title: state.maybeWhen(orElse: () => Tr.get.log_out, loading: () => Tr.get.loading),
                        traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                        onTap: () {
                          LogoutBloc.of(context).logout();
                        },
                      );
                    },
                  ),
                ),
                BlocProvider(
                  create: (context) => Di.updateUserBloc,
                  child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          Nav.offAll(const LoginScreen());
                          KStorage.i.delToken;
                          KStorage.i.delUserInfo;
                        },
                      );
                    },
                    builder: (context, state) {
                      return ProfileTile(
                        leading: Icons.person_remove_outlined,
                        title: Tr.get.deactivate_account,
                        traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                        onTap: () {
                          ActionDialog(
                            content: [
                              Text(
                                state.maybeWhen(orElse: () => Tr.get.deactivate_account, loading: () => Tr.get.loading),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                            approveAction: Tr.get.yes_message,
                            cancelAction: Tr.get.no_message,
                            onApproveClick: () async {
                              Navigator.pop(context);
                              UpdateUserBloc.of(context).blockAccount;
                              UpdateUserBloc.of(context).update();
                            },
                            onCancelClick: () {
                              Navigator.pop(context);
                            },
                          ).show<void>(context);
                        },
                      );
                    },
                  ),
                ),
                // const ServerSelect(),
              ],
            );
          },
        ),
      ),
    );
  }
}

shareTheApp(BuildContext context) async {
  final RenderBox box = context.findRenderObject() as RenderBox;

  await Share.share(KEndPoints.appStoreLinkClient, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}

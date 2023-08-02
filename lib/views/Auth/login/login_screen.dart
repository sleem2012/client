// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forall_client/packages/shared/error/failures.dart';
import 'package:get/get.dart';

import '../../../app.dart';
import '../../../di.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/extensions.dart';
import '../../../logic/auth/login/login_bloc.dart';
import '../../../logic/auth/login/login_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/shared/error/error_422_model.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../social_auth/logic/facebook/facebook_auth_cubit.dart';
import '../../../social_auth/logic/facebook/facebook_auth_state.dart';
import '../../../social_auth/logic/google/google_auth_cubit.dart';
import '../../../social_auth/logic/google/google_auth_state.dart';
import '../../main_screen/main_screen.dart';
import '../../widgets/custom_button.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/text_field.dart';
import '../forget_pass/forget_pass_screen.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? email, password;

  const LoginScreen({Key? key, this.email, this.password}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email_ctrl;
  late TextEditingController password_ctrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    String defaultMail= KStorage.i.getDefaultMail??'';

    email_ctrl = TextEditingController(text: widget.email ?? (defaultMail.isNotNullAndNotEmpty?defaultMail:  ''));
    password_ctrl = TextEditingController(text: widget.password ?? '');
  }

  String? error422Text(state, String key) {
    KFailure? failure = state?.maybeWhen(orElse: () => null, error: (value) => value);
    Error422Model? error422model = failure?.maybeWhen(orElse: () => null, error422: (error422model) => error422model);
    return error422model?.errors[key]?.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        img: "assets/images/login.jpg",
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(.35)),
          child: Center(
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (context) => Di.loginBloc,
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (userModel) async {
                        await Di.reset(context);
                        Get.offAll(() => const Wrapper());
                      },
                    );
                  },
                  builder: (context, state) {
                    final login = LoginBloc.of(context);
                    return KLoadingOverlay(
                      isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: KHelper.hScaffoldPadding),
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            SvgPicture.asset('assets/images/white logo.svg', color: Colors.white),
                            const SizedBox(height: 10),
                            Text(
                              Tr.get.welcome_back,
                              style: KTextStyle.of(context).btntitle.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              Tr.get.login_text,
                              style: KTextStyle.of(context).btntitle.copyWith(fontSize: 12),
                            ),
                            SizedBox(height: Get.height * .05),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  KTextFormField(
                                    controller: email_ctrl,
                                    hintText: Tr.get.email,
                                    enabled: true,
                                    errorText: error422Text(state, 'email'),
                                    keyboardType: TextInputType.emailAddress,
                                    prefixIcon: const Icon(Icons.email, size: 18, color: KColors.accentColorD),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.email_validation;
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: Get.height * .025),
                                  KTextFormField(
                                    obscureText: login.isVisible,
                                    controller: password_ctrl,
                                    maxLines: 1,
                                    hintText: Tr.get.password,
                                    prefixIcon: const Icon(Icons.lock, size: 18, color: KColors.accentColorD),
                                    errorText: error422Text(state, 'password'),
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.pass_validation;
                                      }
                                      return null;
                                    },
                                    suffixIcon: KIconButton(
                                      child: Icon(!login.isVisible ? KHelper.visibilityOff : KHelper.visibility, color: KColors.accentColorD),
                                      onPressed: () {
                                        login.togglePassV();
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.to(() => ForgetPassScreen());
                                      },
                                      child: Text(Tr.get.forget_pass_question, style: KTextStyle.of(context).reBody.copyWith(color: Colors.white)),
                                    ),
                                  ),
                                  CustomBtn(
                                    text: Tr.get.login.capitalized,
                                    onChange: () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        LoginBloc.of(context).login(email: email_ctrl.text, password: password_ctrl.text);
                                      }
                                    },
                                    height: 45,
                                    width: Get.width * 5,
                                  ),
                                  const SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.to(() => const SignUpScreen());
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(text: Tr.get.dont_have_acc, style: KTextStyle.of(context).reBody.copyWith(color: Colors.white)),
                                            TextSpan(
                                              text: Tr.get.sign_up,
                                              style: KTextStyle.of(context).reBody.copyWith(color: KColors.accentColorD, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    child: Text(
                                      Tr.get.join_as_guest,
                                      style: KTextStyle.of(context).reBody.copyWith(color: KColors.accentColorD, fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      Nav.offAll(const MainNavigationView());
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  if (kDebugMode)
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(child: Divider(color: Colors.white)),
                                            const SizedBox(width: 5),
                                            Text(Tr.get.or, style: const TextStyle(color: KColors.accentColorD)),
                                            const SizedBox(width: 5),
                                            const Expanded(child: Divider(color: Colors.white)),
                                          ],
                                        ),
                                        BlocProvider(
                                          create: (context) => GoogleAuthCubit(),
                                          child: BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
                                            builder: (context, state) {
                                              // final google = GoogleAuthCubit.of(context);
                                              return Container(
                                                padding: const EdgeInsets.all(10),
                                                decoration: KHelper.of(context).elevatedBox.copyWith(color: const Color(0xff6d7dea)),
                                                child: Row(
                                                  children: [
                                                    const Icon(FontAwesomeIcons.google, color: Colors.white),
                                                    Expanded(
                                                      child: Text(
                                                        Tr.get.sign_in_with_google,
                                                        textAlign: TextAlign.center,
                                                        style: KTextStyle.of(context).title3.copyWith(color: Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        BlocProvider(
                                          create: (context) => FacebookAuthCubit(),
                                          child: BlocConsumer<FacebookAuthCubit, FacebookAuthState>(
                                            listener: (context, state) {},
                                            builder: (context, state) {
                                              //final facebook = FacebookAuthCubit.of(context);
                                              return Container(
                                                padding: const EdgeInsets.all(10),
                                                decoration: KHelper.of(context).elevatedBox.copyWith(color: const Color(0xff5963ab)),
                                                child: Row(
                                                  children: [
                                                    const Icon(FontAwesomeIcons.facebookF, color: Colors.white),
                                                    Expanded(
                                                      child: Text(
                                                        Tr.get.sign_in_with_face,
                                                        textAlign: TextAlign.center,
                                                        style: KTextStyle.of(context).title3.copyWith(color: Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: KHelper.of(context).elevatedBox.copyWith(color: Colors.black),
                                          child: Row(
                                            children: [
                                              const Icon(FontAwesomeIcons.apple, color: Colors.white),
                                              Expanded(
                                                child: Text(
                                                  Tr.get.sign_in_with_apple,
                                                  textAlign: TextAlign.center,
                                                  style: KTextStyle.of(context).title3.copyWith(color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  const SizedBox(height: 50)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

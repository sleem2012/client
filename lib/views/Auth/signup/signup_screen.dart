
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_client/packages/widgets/nationality_drop_down.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../di.dart';
import '../../../logic/auth/register/register_bloc.dart';
import '../../../logic/auth/register/register_state.dart';
import '../../../logic/global/settings/settings_bloc.dart';
import '../../../logic/global/settings/settings_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/picker/data/country_search_model/address_result.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/widgets/custom_button.dart';
import '../../../views/widgets/text_field.dart';
import '../../widgets/country_code.dart';
import '../../widgets/drop_down.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/on_success_view.dart';
import '../../widgets/pick_image_widget.dart';
import '../../../packages/shared/picker/view/dialog_picker.dart';
import '../../widgets/slugs_drop_down.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        img: "assets/images/login.jpg",
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(.35)),
          child: SingleChildScrollView(
            child: Center(
              child: BlocProvider(
                create: (context) => Di.registerBloc,
                child: BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    final e = RegisterBloc.of(context).emailController.text;
                    final p = RegisterBloc.of(context).passwordController.text;
                    state.maybeWhen(
                      orElse: () => null,
                      success: () {
                        Nav.offAll(
                          OnSuccessView(
                            destination: LoginScreen(email: e, password: p),
                            msg: Tr.get.register_success,
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    final regBloc = RegisterBloc.of(context);
                    return KLoadingOverlay(
                      isLoading: state.maybeWhen(
                          orElse: () => false, loading: () => true),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: KHelper.hScaffoldPadding),
                        child: Column(
                          children: [
                            SizedBox(height: Get.height * .1),
                            SvgPicture.asset(
                              'assets/images/white logo.svg',
                              color: Colors.white,
                            ),
                            Text(
                              Tr.get.sign_up,
                              style: KTextStyle.of(context).btntitle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            // SizedBox(height: Get.height * .05),
                            // SvgPicture.asset('assets/images/registration.svg'),
                            const SizedBox(height: 25),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // Text(
                                  //   Tr.get.business_information,
                                  //   style: KTextStyle.of(context).topHint,
                                  // ),
                                  SizedBox(height: Get.height * .01),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: PickImageWidget(
                                          onSelect: regBloc.selectImage,
                                          hint: Tr.get.personal_photo,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      KTextFormField(
                                        controller: regBloc.nameController,
                                        hintText: Tr.get.name,
                                        enabled: true,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return Tr.get.name_validation;
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 5),
                                      KDropdownBtn<KSlugModel>(
                                        onChanged: regBloc.selectGender,
                                        items: KSlugModel.genders
                                            .map((e) => KHelper.of(context)
                                                .itemView<KSlugModel>(
                                                    itemText: e.translated,
                                                    value: e))
                                            .toList(),
                                        title: Tr.get.gender,
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Text(Tr.get.birthdate_title,
                                  //         style: KTextStyle.of(context).body),
                                  //   ],
                                  // ),
                                  const SizedBox(height: 5),
                                  InkWell(
                                    onTap: () {
                                      regBloc.selectDate(context);
                                    },
                                    child: KTextFormField(
                                      controller: regBloc.birthdateController,
                                      hintText: Tr.get.select_birthdate,
                                      enabled: false,
                                      autofocus: false,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  InkWell(
                                    onTap: () async {
                                      final AddressResult result =
                                          await Get.dialog(
                                              const AddLocationDetails(),
                                              barrierDismissible: false);
                                      setState(() {});
                                      regBloc.setLocationData(result);
                                    },
                                    child: Container(
                                      decoration: KHelper.of(context)
                                          .elevatedBox
                                          .copyWith(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: 45,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              regBloc.location ??
                                                  Tr.get.location_input,
                                              style: regBloc.location == null
                                                  ? KTextStyle.of(context).hint
                                                  : KTextStyle.of(context)
                                                      .title3,
                                            ),
                                          ),
                                          Icon(
                                            Icons.location_on_outlined,
                                            color:
                                                KColors.of(context).accentColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (regBloc.addressIsNull)
                                    Text(Tr.get.address_is_null,
                                        style: KTextStyle.of(context).error),
                                  const SizedBox(height: 5),
                                  NationalityDropDown(
                                    onChanged: (value) {
                                      regBloc.selectNationality(
                                          (value?.id ?? 1), value);
                                    },
                                  ),
                                  SizedBox(height: Get.height * .01),
                                  KTextFormField(
                                    controller: regBloc.phoneController,
                                    hintText: Tr.get.phone_number,
                                    enabled: true,
                                    keyboardType: TextInputType.phone,
                                    prefixIcon: CountryCodeWidget(
                                      onChanged: (p0) {
                                        regBloc.cCode =
                                            "(${p0?.dialCode ?? '+966'})"
                                                .replaceAll('+', '');
                                        debugPrint(
                                            '================= ${regBloc.cCode} : ');
                                      },
                                      onInit: (p0) {
                                        regBloc.cCode =
                                            "(${p0?.dialCode ?? '+966'})"
                                                .replaceAll('+', '');
                                        debugPrint(
                                            '================= ${regBloc.cCode} : ');
                                      },
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.phone_number_validation;
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 5),
                                  KTextFormField(
                                    hintText: Tr.get.email,
                                    controller: regBloc.emailController,
                                    enabled: true,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.email_validation;
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 5),
                                  KTextFormField(
                                    hintText: Tr.get.password,
                                    controller: regBloc.passwordController,
                                    obscureText: regBloc.passVisible,
                                    maxLines: 1,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr.get.pass_validation;
                                      }
                                      return null;
                                    },
                                    suffixIcon: KIconButton(
                                      onPressed: regBloc.togglePassV,
                                      child: Icon(
                                          !regBloc.passVisible
                                              ? KHelper.visibilityOff
                                              : KHelper.visibility,
                                          color: KColors.accentColorD),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  KTextFormField(
                                    hintText: Tr.get.confirm_password,
                                    obscureText: regBloc.passVisible,
                                    controller:
                                        regBloc.passwordConfirmController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return Tr
                                            .get.confirm_password_validation;
                                      }
                                      if (value !=
                                          regBloc.passwordController.text) {
                                        return Tr
                                            .get.confirm_password_validation;
                                      }
                                      if (value !=
                                          regBloc.passwordController.text) {
                                        return Tr.get
                                            .confirm_password_matching_validation;
                                      }
                                      return null;
                                    },
                                    suffixIcon: KIconButton(
                                      onPressed: regBloc.togglePassV,
                                      child: Icon(
                                          !regBloc.passVisible
                                              ? KHelper.visibilityOff
                                              : KHelper.visibility,
                                          color: KColors.accentColorD),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: regBloc.termsChecked,
                                        checkColor: Colors.white,
                                        activeColor: KColors.accentColorD,
                                        visualDensity: VisualDensity.compact,
                                        onChanged: (value) {
                                          regBloc.checkTerms(value!);
                                        },
                                      ),
                                      BlocBuilder<SettingsBloc, SettingsState>(
                                        builder: (context, state) {
                                          return InkWell(
                                            onTap: () async {
                                              final url = KStorage
                                                  .i
                                                  .getSettings
                                                  ?.data
                                                  ?.firstOrNull
                                                  ?.termsContent
                                                  ?.client;
                                              if (url != null) {
                                                await launchUrlString(url,
                                                    );
                                              }
                                            },
                                            child: Text(
                                              Tr.get.terms_and_conditions,
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.white),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: regBloc.privacyChecked,
                                        checkColor: Colors.white,
                                        activeColor: KColors.accentColorD,
                                        visualDensity: VisualDensity.compact,
                                        onChanged: (value) {
                                          regBloc.checkPrivacy(value!);
                                        },
                                      ),
                                      BlocBuilder<SettingsBloc, SettingsState>(
                                        builder: (context, state) {
                                          return InkWell(
                                            onTap: () async {
                                              final url = KStorage
                                                  .i
                                                  .getSettings
                                                  ?.data
                                                  ?.first
                                                  .privacyContent
                                                  ?.client;
                                              if (url != null) {
                                                await launchUrlString(url,
                                                 );
                                              }
                                            },
                                            child: Text(
                                              Tr.get.privacy_policy,
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.white),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  CustomBtn(
                                    text: Tr.get.submit,
                                    onChange: () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        regBloc.register();
                                      }
                                    },
                                    height: 45,
                                  ),
                                  const SizedBox(height: 50),
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

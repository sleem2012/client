// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/di.dart';
import 'package:forall_client/logic/auth/update_user/update_user_bloc.dart';
import 'package:forall_client/logic/auth/update_user/update_user_state.dart';
import 'package:forall_client/logic/auth/user_info/user_info_bloc.dart';
import 'package:forall_client/logic/global/currencies/currencies_bloc.dart';
import 'package:forall_client/logic/global/languages/langugese_bloc.dart';
import 'package:forall_client/logic/services/services_cubit.dart';
import 'package:forall_client/logic/theme/theme_cubit.dart';
import 'package:forall_client/packages/cache/locale_storage.dart';
import 'package:forall_client/packages/shared/error/failures.dart';
import 'package:forall_client/shared/localization/trans.dart';
import 'package:forall_client/shared/theme/helper.dart';
import 'package:forall_client/shared/theme/text_theme.dart';
import 'package:forall_client/views/widgets/currency_drop.dart';
import 'package:forall_client/views/widgets/custom_button.dart';
import 'package:forall_client/views/widgets/lang_dropdown.dart';
import 'package:forall_client/views/widgets/loading/loading_overlay.dart';
import 'package:forall_client/views/widgets/new_bg_img.dart';
import 'package:forall_client/views/widgets/pick_image_widget.dart';
import 'package:forall_client/views/widgets/slugs_drop_down.dart';
import 'package:forall_client/views/widgets/text_field.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: Center(
          child: BlocProvider(
            create: (context) => Di.updateUserBloc,
            child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (value) => KHelper.showSnackBar(KFailure.toError(value)),
                  success: () {
                    KHelper.showSnackBar(Tr.get.profile_update_succ);
                    UserInfoBloc.of(context).getUserInfo();
                  },
                );
              },
              builder: (context, state) {
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 50, bottom: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              Tr.get.update_profile,
                              style: KTextStyle.of(context).headers,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: PickImageWidget(
                              onSelect: UpdateUserBloc.of(context).selectImage,
                              initialImg: KStorage.i.getUserInfo?.data?.image?.s128px,
                              hint: Tr.get.personal_photo,
                            ),
                          ),
                          const SizedBox(height: 20),
                          KTextFormField(
                            hintText: Tr.get.name,
                            controller: UpdateUserBloc.of(context).nameCtrl,
                          ),
                          const SizedBox(height: 10),
                          KTextFormField(
                            controller: UpdateUserBloc.of(context).phoneCtrl,
                            hintText: Tr.get.phone_number,
                            enabled: true,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Tr.get.phone_number_validation;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          KTextFormField(
                            hintText: Tr.get.email,
                            controller: UpdateUserBloc.of(context).emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),

                          KSlugDropdown(
                            items: KSlugModel.genders,
                            onChanged: UpdateUserBloc.of(context).selectGender,
                            value: UpdateUserBloc.of(context).selectedGender?.slug,
                          ),
                          const SizedBox(height: 10),
                          // Text(Tr.get.birthdate_title, style: KTextStyle.of(context).body),
                          // const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              UpdateUserBloc.of(context).selectDate(context);
                            },
                            child: KTextFormField(
                              hintText: UpdateUserBloc.of(context).updateUserModel?.birthdate.toString(),
                              enabled: false,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(height: 10),
                          LanguageDropdown(
                            onSelect: (val) {
                              LanguagesBloc.of(context).selectLang(val!);
                              CurrenciesBloc.of(context).getCurrencies();
                              ThemeBloc.of(context).updateLocale(val.symbols);
                              ServicesCubit.of(context).getServices();
                            },
                          ),
                          const SizedBox(height: 20),
                          CurrenciesDropdown(
                            onSelect: (val) {
                              CurrenciesBloc.of(context).selectCurrency(val!);
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomBtn(
                            text: Tr.get.update,
                            onChange: UpdateUserBloc.of(context).update,
                            width: Get.width - 60,
                          ),
                        ],
                      ),
                    ),
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

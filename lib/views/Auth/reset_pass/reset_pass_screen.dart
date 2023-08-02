import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../di.dart';
import '../../../logic/auth/reset_pass/reset_pass_bloc.dart';
import '../../../logic/auth/reset_pass/reset_pass_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../login/login_screen.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/on_success_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/text_field.dart';
import 'package:get/get.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextEditingController _confirmController = TextEditingController();
  static final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: Center(
          child: BlocProvider(
            create: (context) => Di.resetPasswordBloc,
            child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () => Get.to(() => OnSuccessView(msg: Tr.get.pass_change_success, destination: const LoginScreen())),
                );
              },
              builder: (context, state) {
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/images/Logo Only.svg'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            Tr.get.reset_password,
                            style: TextStyle(color: KColors.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SvgPicture.asset('assets/images/login_img.svg'),
                        const SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              KTextFormField(
                                hintText: Tr.get.new_pass,
                                controller: _passController,
                                enabled: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.field_required;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: Get.height * .02),
                              KTextFormField(
                                hintText: Tr.get.confirm_password,
                                controller: _confirmController,
                                enabled: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.field_required;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: EdgeInsets.all(Get.width * .04),
                                child: CustomBtn(
                                  text: Tr.get.change_password,
                                  onChange: () {
                                    if (_formKey.currentState!.validate()) {
                                      ResetPasswordBloc.of(context).reset(password: _passController.text, passwordConf: _confirmController.text);
                                      FocusManager.instance.primaryFocus?.unfocus();
                                    }
                                  },
                                  height: Get.height * 0.05,
                                  width: Get.width * 5,
                                ),
                              ),
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
    );
  }
}

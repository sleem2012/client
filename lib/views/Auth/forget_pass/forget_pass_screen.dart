import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../di.dart';
import '../../../logic/auth/forget_pass/forget_pass_bloc.dart';
import '../../../logic/auth/forget_pass/forget_pass_state.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../pin_code/pin_code_screen.dart';
import '../reset_pass/reset_pass_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';
import '../../widgets/text_field.dart';
import 'package:get/get.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: Center(
          child: BlocProvider(
            create: (context) => Di.forgetPasswordBloc,
            child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PinCodeScreen(
                          email: emailController.text,
                          destination: ResetPassScreen(),
                        ),
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SvgPicture.asset('assets/images/Logo Only.svg'),
                        ),
                        Text(
                          Tr.get.forget_password,
                          style: TextStyle(color: KColors.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: Get.height * .05),
                        SvgPicture.asset('assets/images/login_img.svg'),
                        SizedBox(height: Get.height * .07),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              KTextFormField(
                                hintText: Tr.get.email,
                                controller: emailController,
                                enabled: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.please_enter_your_email;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: Get.height * .02),
                              Padding(
                                padding: EdgeInsets.all(Get.width * .04),
                                child: CustomBtn(
                                  text: Tr.get.send_code,
                                  onChange: () {
                                    if (_formKey.currentState!.validate()) {
                                      ForgetPasswordBloc.of(context).sendCode(email: emailController.text);

                                      FocusManager.instance.primaryFocus?.unfocus();
                                    }
                                  },
                                  height: 45,
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

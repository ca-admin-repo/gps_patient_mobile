import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gps_patient_mobile/login/widgets/app_button.widget.dart';
import 'package:gps_patient_mobile/login/widgets/app_input_underline_widget.dart';
import 'package:gps_patient_mobile/shared/translation_const.dart';

class SignUpPageContainer extends StatelessWidget {
  final TextEditingController signupEmailController;
  final TextEditingController signupPasswordController;
  final TextEditingController signupConfirmPasswordController;
  final TextEditingController signupMobileNumberController;
  final TextEditingController signupUserNameController;
  final GestureTapCallback onTap;
  final dynamic onPressed;

  const SignUpPageContainer({
    Key? key,
    required this.signupEmailController,
    required this.signupPasswordController,
    required this.signupUserNameController,
    required this.signupMobileNumberController,
    required this.signupConfirmPasswordController,
    required this.onTap,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xff0D47D1)),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LoginTranslationKeys.welcomeTextSignUp,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                AppInputUnderlineWidget(
                    inputController: signupUserNameController,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    labelText: SignUpTranslationKeys.signupUserName),
                AppInputUnderlineWidget(
                    inputController: signupEmailController,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    labelText: SignUpTranslationKeys.signupEmail),
                AppInputUnderlineWidget(
                    inputController: signupMobileNumberController,
                    isNumber: true,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    labelText: SignUpTranslationKeys.signupMobileNumber),
                AppInputUnderlineWidget(
                    inputController: signupPasswordController,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [LengthLimitingTextInputFormatter(6)],
                    labelText: SignUpTranslationKeys.signupPassword),
                AppInputUnderlineWidget(
                    inputController: signupConfirmPasswordController,
                    obscureText: true,
                    inputFormatters: [LengthLimitingTextInputFormatter(6)],
                    labelText: SignUpTranslationKeys.signupConfirmPassword),
                const SizedBox(height: 40),
                AppButtonWidget(
                  label: LoginTranslationKeys.signUp,
                  buttonWidth: 100,
                  buttonHeight: 40,
                  buttonType: AppButtonType.secondary,
                  onPressed: onPressed,
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      SignUpTranslationKeys.alreadyUser,
                      style: const TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Text(
                        SignUpTranslationKeys.signInHere,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

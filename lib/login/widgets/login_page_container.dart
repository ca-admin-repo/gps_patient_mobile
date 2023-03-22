import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gps_patient_mobile/login/widgets/app_button.widget.dart';
import 'package:gps_patient_mobile/login/widgets/app_input_underline_widget.dart';
import 'package:gps_patient_mobile/shared/translation_const.dart';

class LoginPageContainer extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapForgot;
  final dynamic onPressed;
  const LoginPageContainer({
    Key? key,
    required this.emailController,
    required this.passwordController,
    this.onTap,
    this.onTapForgot,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xff0D47D1)),
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LoginTranslationKeys.welcomeTextLogin,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              AppInputUnderlineWidget(
                inputController: emailController,
                labelText: LoginTranslationKeys.email,
                textInputAction: TextInputAction.next,
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
              ),
              AppInputUnderlineWidget(
                  inputController: passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [LengthLimitingTextInputFormatter(6)],
                  labelText: LoginTranslationKeys.password),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: InkWell(
                  onTap: onTapForgot,
                  child: Text(
                    LoginTranslationKeys.forgotPassword,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AppButtonWidget(
                  label: LoginTranslationKeys.signIn,
                  buttonWidth: 100,
                  buttonHeight: 40,
                  buttonType: AppButtonType.secondary,
                  onPressed: onPressed),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LoginTranslationKeys.newUser,
                    style: const TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: onTap,
                    child: Text(
                      LoginTranslationKeys.registerHere,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}

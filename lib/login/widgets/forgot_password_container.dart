import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gps_patient_mobile/login/widgets/app_button.widget.dart';
import 'package:gps_patient_mobile/login/widgets/app_input_underline_widget.dart';
import 'package:gps_patient_mobile/shared/translation_const.dart';

class ForgotPageContainer extends StatelessWidget {
  final TextEditingController forgotMobileNumberController;
  final dynamic onPressed;
  const ForgotPageContainer(
      {Key? key, required this.forgotMobileNumberController, this.onPressed})
      : super(key: key);

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
                  LoginTranslationKeys.troubleSignin,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                AppInputUnderlineWidget(
                    inputController: forgotMobileNumberController,
                    isNumber: true,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    labelText: SignUpTranslationKeys.forgotMobileNumber),
                const SizedBox(height: 40),
                AppButtonWidget(
                  label: LoginTranslationKeys.submit,
                  buttonWidth: 100,
                  buttonHeight: 40,
                  buttonType: AppButtonType.secondary,
                  onPressed: onPressed,
                )
              ]),
        ),
      ),
    );
  }
}

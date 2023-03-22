import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gps_patient_mobile/login/widgets/sign_up_page_container.dart';
import 'package:gps_patient_mobile/onboarding/pages/widgets/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupUserNameController = TextEditingController();
  TextEditingController signupMobileNumberController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xff0D47D1)),
          child: Column(
            children: [
              SignUpPageContainer(
                signupEmailController: signupEmailController,
                signupPasswordController: signupPasswordController,
                signupUserNameController: signupUserNameController,
                signupMobileNumberController: signupMobileNumberController,
                signupConfirmPasswordController:
                    signupConfirmPasswordController,
                onTap: onTap,
                onPressed: onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void onPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gps_patient_mobile/login/widgets/login_page_container.dart';
import 'package:gps_patient_mobile/onboarding/pages/widgets/forgot_password_page.dart';
import 'package:gps_patient_mobile/onboarding/pages/widgets/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          LoginPageContainer(
            emailController: emailController,
            passwordController: passwordController,
            onTap: onTap,
            onTapForgot: onTapForgot,
          ),
        ]),
      ),
    );
  }

  void onTapForgot() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
  }

  void onTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }
}

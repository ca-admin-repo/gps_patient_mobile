import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gps_patient_mobile/login/widgets/forgot_password_container.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController forgotController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgotPageContainer(
              forgotMobileNumberController: forgotController,
            )
          ],
        ),
      ),
    );
  }
}

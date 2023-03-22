import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gps_patient_mobile/shared/text_styles.dart';

enum AppInputOutlineType { authentication, profile }

class AppInputOutlineModel {
  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final TextStyle labelStyle;
  final TextStyle controllerStyle;
  final AppInputOutlineType inputOutlineType;

  AppInputOutlineModel(
      {required this.border,
      required this.focusedBorder,
      required this.enabledBorder,
      required this.labelStyle,
      required this.controllerStyle,
      required this.inputOutlineType});
}

List<AppInputOutlineModel> appInputOutlineModelType = [
  AppInputOutlineModel(
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white10, width: 2)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white10, width: 2)),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white10, width: 2)),
      labelStyle: controllerTextStyle,
      controllerStyle: controllerTextStyle,
      inputOutlineType: AppInputOutlineType.authentication),
  AppInputOutlineModel(
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white10, width: 2)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white10, width: 2)),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white10, width: 2)),
      labelStyle: profileLabelStyle,
      controllerStyle: profileControllerTextStyle,
      inputOutlineType: AppInputOutlineType.profile),
];

class AppInputUnderlineWidget extends StatelessWidget {
  final TextEditingController inputController;
  final String? hintText;
  final String labelText;
  final List<TextInputFormatter>? inputFormatters;
  final bool isNumber;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final AppInputOutlineType type;

  const AppInputUnderlineWidget(
      {Key? key,
      required this.inputController,
      required this.labelText,
      this.hintText,
      this.inputFormatters,
      this.isNumber = false,
      this.obscureText = false,
      this.textInputAction,
      this.type = AppInputOutlineType.authentication})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.7,
      constraints: const BoxConstraints(minHeight: 60),
      child: TextFormField(
        controller: inputController,
        textInputAction: textInputAction,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : null,
        inputFormatters: (isNumber && inputFormatters == null)
            ? [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ]
            : inputFormatters,
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: labelControllerStyle(),
        decoration: getInputOutlineDecoration(),
      ),
    );
  }

  TextStyle labelControllerStyle() {
    if (type == AppInputOutlineType.authentication) {
      return controllerTextStyle;
    } else if (type == AppInputOutlineType.profile) {
      return profileControllerTextStyle;
    }
    return controllerTextStyle;
  }

  AppInputOutlineModel _appInputOutlineModel(
      AppInputOutlineType appInputOutlineType) {
    return appInputOutlineModelType
        .where((element) => element.inputOutlineType == type)
        .first;
  }

  _getOutlineInputDecoration(AppInputOutlineModel outlineModel) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white),
      suffixStyle: const TextStyle(color: Colors.white),
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: outlineModel.enabledBorder,
      focusedBorder: outlineModel.focusedBorder,
      border: outlineModel.border,
    );
  }

  InputDecoration getInputOutlineDecoration() {
    AppInputOutlineModel getButtonType = _appInputOutlineModel(type);
    return _getOutlineInputDecoration(getButtonType);
  }
}

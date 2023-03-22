import 'package:flutter/material.dart';
import 'package:gps_patient_mobile/login/widgets/custom_loader_widget.dart';
import 'package:gps_patient_mobile/shared/text_styles.dart';

import '../../shared/util/constants.dart';

enum AppButtonType {
  primary,
  secondary,
  tertiary,
  tertiaryCustoms,
  sigInButton,
  cancelButton,
  shadowBox,
  doneStatus,
  orageButton
}

class AppButtonTypeModel {
  final Color labelColor;
  final Color disabledLabelColor;
  final Color borderColor;
  final Color disabledBorderColor;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final double borderRadius;
  final AppButtonType type;

  AppButtonTypeModel({
    required this.labelColor,
    required this.disabledLabelColor,
    required this.borderColor,
    required this.disabledBorderColor,
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.type,
    required this.borderRadius,
  });
}

List<AppButtonTypeModel> availableButtonTypes = [
  AppButtonTypeModel(
      labelColor: Constants.whiteStyleColor,
      borderColor: Constants.buttonPrimaryColor,
      backgroundColor: Constants.buttonPrimaryColor,
      disabledLabelColor: Constants.appDisabledColor,
      disabledBorderColor: Constants.appDisabledColor,
      disabledBackgroundColor: Constants.appDisabledColor,
      borderRadius: 6,
      type: AppButtonType.primary),
  AppButtonTypeModel(
      labelColor: Constants.buttonPrimaryColor,
      borderColor: Constants.buttonPrimaryColor,
      backgroundColor: Constants.whiteStyleColor,
      disabledLabelColor: Constants.appDisabledColor,
      disabledBorderColor: Constants.appDisabledColor,
      disabledBackgroundColor: Constants.appDisabledColor,
      borderRadius: 6,
      type: AppButtonType.secondary),
  AppButtonTypeModel(
      labelColor: Constants.blackStyleColor,
      borderColor: Constants.appDisabledColor,
      backgroundColor: Colors.grey.withOpacity(0.2),
      disabledLabelColor: Constants.appDisabledColor,
      disabledBorderColor: Constants.appDisabledColor,
      disabledBackgroundColor: Constants.appDisabledColor,
      borderRadius: 6,
      type: AppButtonType.tertiary),
  AppButtonTypeModel(
      labelColor: Constants.whiteStyleColor,
      borderColor: Colors.blueGrey,
      backgroundColor: Colors.blueGrey,
      disabledLabelColor: Constants.appDisabledColor,
      disabledBorderColor: Constants.appDisabledColor,
      disabledBackgroundColor: Constants.appDisabledColor,
      borderRadius: 6,
      type: AppButtonType.tertiaryCustoms),
  AppButtonTypeModel(
      labelColor: Constants.buttonPrimaryColor,
      borderColor: Constants.whiteStyleColor,
      backgroundColor: Constants.whiteStyleColor,
      disabledLabelColor: Constants.appDisabledColor,
      disabledBorderColor: Constants.appDisabledColor,
      disabledBackgroundColor: Constants.appDisabledColor,
      borderRadius: 29,
      type: AppButtonType.sigInButton),
  AppButtonTypeModel(
      labelColor: Constants.buttonPrimaryColor,
      borderColor: Constants.whiteStyleColor,
      backgroundColor: Constants.whiteStyleColor,
      disabledLabelColor: Constants.appDisabledColor,
      disabledBorderColor: Constants.appDisabledColor,
      disabledBackgroundColor: Constants.appDisabledColor,
      borderRadius: 6,
      type: AppButtonType.doneStatus),
];

class AppButtonWidget extends StatelessWidget {
  final dynamic onPressed;
  final String label;
  final Widget? suffix;
  final Widget? prefix;
  final Color labelColor;
  final double fontSize;
  final bool loading;
  final bool? disabled;
  final AppButtonType buttonType;
  final EdgeInsets textPadding;
  final double? buttonWidth;
  final double? buttonHeight;

  const AppButtonWidget(
      {Key? key,
      this.onPressed,
      required this.label,
      this.suffix,
      this.labelColor = Colors.black,
      this.fontSize = 20.0,
      this.loading = false,
      this.disabled = false,
      this.buttonType = AppButtonType.sigInButton,
      this.buttonWidth,
      this.textPadding = const EdgeInsets.all(8.0),
      this.prefix,
      this.buttonHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppButtonTypeModel currentModel = _getCurrentModel(buttonType);
    if (loading) {
      return const CustomLoader();
    } else {
      return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: Stack(alignment: Alignment.center, children: [
                getButtonType(),
                TextButton(
                    key: key,
                    style: TextButton.styleFrom(
                        padding: textPadding,
                        primary: Constants.whiteStyleColor,
                        textStyle: TextStyle(fontSize: fontSize)),
                    onPressed: () {
                      if (!disabled!) onPressed();
                    },
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (prefix != null)
                            Row(children: [
                              prefix!,
                              const SizedBox(width: 20),
                            ]),
                          Text(label,
                              style: appButtonTextStyle(
                                  labelColor: disabled == true
                                      ? currentModel.disabledLabelColor
                                      : currentModel.labelColor),
                              textAlign: TextAlign.center),
                          if (suffix != null)
                            Row(children: [const SizedBox(width: 20), suffix!])
                        ]))
              ])));
    }
  }

  AppButtonTypeModel _getCurrentModel(AppButtonType type) {
    return availableButtonTypes.where((element) => element.type == type).first;
  }

  _getButtonBorder(AppButtonTypeModel buttonModel) {
    return Positioned.fill(
        child: Container(
      decoration: BoxDecoration(
          color: buttonModel.backgroundColor,
          border: Border.all(color: buttonModel.borderColor),
          borderRadius:
              BorderRadius.all(Radius.circular(buttonModel.borderRadius))),
    ));
  }

  Widget getButtonType() {
    AppButtonTypeModel currentModel = _getCurrentModel(buttonType);
    return _getButtonBorder(currentModel);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:gps_patient_mobile/shared/util/constants.dart';

appButtonTextStyle({required Color labelColor}) {
  return TextStyle(
      color: labelColor,
      fontSize: 15,
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.w600);
}

const controllerTextStyle = TextStyle(
    color: Constants.whiteStyleColor,
    fontWeight: FontWeight.w400,
    fontSize: 15);

const profileLabelStyle = TextStyle(
    color: Constants.blackStyleColor,
    fontWeight: FontWeight.w500,
    fontSize: 18);
const profileControllerTextStyle = TextStyle(
    color: Constants.appDisabledColor,
    fontWeight: FontWeight.w700,
    fontSize: 16);

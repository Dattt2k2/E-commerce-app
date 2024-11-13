
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'reponsive_helper.dart';

class CustomTextStyle{
  static TextStyle headlineBig(BuildContext context){
    DeviceScreenType deviceType = ResponsiveHelper.getDeviceScreenType(context);
    double fontSize;


    switch (deviceType){
      case DeviceScreenType.mobile:
        fontSize = 24;
        break;
      case DeviceScreenType.tablet:
        fontSize = 28;
        break;
      case DeviceScreenType.web:
        fontSize = 32;
        break;
      default:
        fontSize  = 24;
    }

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle headlineMedium(BuildContext context){
    DeviceScreenType deviceType = ResponsiveHelper.getDeviceScreenType(context);
    double fontSize;

    switch (deviceType) {
      case DeviceScreenType.mobile:
        fontSize = 20;
        break;
      case DeviceScreenType.tablet:
        fontSize = 22;
        break;
      case DeviceScreenType.web:
        fontSize = 26;
        break;
      default:
        fontSize = 20;
    }
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle bodyText(BuildContext context){
    DeviceScreenType deviceType = ResponsiveHelper.getDeviceScreenType(context);
    double fontSize;

    switch (deviceType) {
      case DeviceScreenType.mobile:
        fontSize = 16;
        break;
      case DeviceScreenType.tablet:
        fontSize = 18;
        break;
      case DeviceScreenType.web:
        fontSize = 20;
        break;
      default:
        fontSize = 16;
    }

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle subtitle(BuildContext context) {
    DeviceScreenType deviceType = ResponsiveHelper.getDeviceScreenType(context);
    double fontSize;

    switch (deviceType) {
      case DeviceScreenType.mobile:
        fontSize = 14;
        break;
      case DeviceScreenType.tablet:
        fontSize = 16;
        break;
      case DeviceScreenType.web:
        fontSize = 18;
        break;
      default:
        fontSize = 14;
    }

    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }
}
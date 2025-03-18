import 'package:flutter/material.dart';

enum DeviceScreenType{
  mobile,
  tablet, 
  web,
}

// get screen width
class ResponsiveHelper{
  static DeviceScreenType getDeviceScreenType(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;

    if(screenWidth < 600){
      return DeviceScreenType.mobile;
    } else if(screenWidth < 1200){
      return DeviceScreenType.tablet;
    } else{
      return DeviceScreenType.web;
    }
  }

  static getResponsiveWitdh(BuildContext context, double mobile, double tablet, double web){
    switch (getDeviceScreenType(context)){
      case DeviceScreenType.mobile:
        return mobile;
      case DeviceScreenType.tablet:
        return tablet;
      case DeviceScreenType.web:
        return web;
      // default:
      //   return mobile;
    }
  }

  static double getResponsiveHeight(BuildContext context, double mobile, double tablet, double web){
    switch (getDeviceScreenType(context)){
      case DeviceScreenType.mobile:
        return mobile;
      case DeviceScreenType.tablet:
        return tablet;
      case DeviceScreenType.web:
        return web;
      // default:
      //   return mobile;
    }
  }
}


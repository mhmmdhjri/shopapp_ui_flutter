import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0.0;
  static double screenheight = 0.0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenheight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getPropotionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // from mobile default width 
  return (inputWidth / 375.0) * screenWidth;
}

double getPropotionateScreenHeight(double inputHeight) {
  double screenheight = SizeConfig.screenheight;
  // from mobile default height
  return (inputHeight / 812.0) * screenheight;
}

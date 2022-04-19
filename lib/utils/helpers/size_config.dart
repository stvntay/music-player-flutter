import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
  }
}

// Get the proportionate height as per presentations size
double getProportionateScreenHeight({required double inputHeight}) {
  double screenHeight = SizeConfig.screenHeight!;
  // 812 is the layouts height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per presentations size
double getProportionateScreenWidth({required double inputWidth}) {
  double screenWidth = SizeConfig.screenWidth!;
  // 375 is the layouts width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
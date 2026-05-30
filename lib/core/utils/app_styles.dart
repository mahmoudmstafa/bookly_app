import 'package:bookly_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle regular16Roboto(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 14,
      ),
      fontWeight: FontWeight.bold,
    );
  }
}

double responsiveFontSize(BuildContext context, {required double fontSize}) {
  final double responsiveFontSize = scaleFactor(context) * fontSize;

  final double lowerLimit = fontSize * .8;
  final double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double scaleFactor(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 700;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1300;
  }
}

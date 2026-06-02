import 'package:bookly_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle regular16Roboto(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 16,
      ),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle regular20Roboto(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 20,
      ),
    );
  }

  static TextStyle regular30Roboto(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 30,
      ),
    );
  }

  static TextStyle montserrat18Semibold(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 18,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    );
  }
 static TextStyle montserrat14Semibold(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 14,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    );
  }

  static TextStyle montserrat18Bold(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 18,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: 'Montserrat',
      color: Colors.black,
    );
  }

  static TextStyle montserrat14Regular(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 14,
      ),
      color: Colors.white.withOpacity(.5),
    );
  }

  static TextStyle montserrat16Medium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 16,
      ),
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
    );
  }

  static TextStyle montserrat18medium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 18,
      ),
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      color: Colors.white.withOpacity(0.7),
    );
  }

  static TextStyle montserrat20Bold(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 20,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: 'Montserrat',
    );
  }

  static TextStyle montserrat14Medium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 14,
      ),
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      color: Colors.white.withOpacity(.7),
    );
  }
  static TextStyle montserrat20Regular(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(
        context,
        fontSize: 20,
      ),
      fontFamily: 'Montserrat',
      color: Colors.white,
    );
  }
}

double responsiveFontSize(BuildContext context, {required double fontSize}) {
  final double responsiveFontSize = scaleFactor(context) * fontSize;

  final double lowerLimit = fontSize * .9;
  final double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double scaleFactor(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 1000;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1300;
  }
}

import 'package:flutter/material.dart';
import 'package:template_design/other/utils.dart';
import 'package:template_design/other/assets.dart';


class Styles {

  static TextStyle h1Plus({BuildContext context, Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: FontSize.h1Plus(context),
        color: textColor,
        fontFamily: FontFamily.montserrat
    );
  }

  static TextStyle h1({BuildContext context, Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: FontSize.h1(context),
        color: textColor,
        fontFamily: FontFamily.montserrat
    );
  }
  static TextStyle h2({BuildContext context, Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: FontSize.h2(context),
        color: textColor,
        fontFamily: FontFamily.montserrat
    );
  }

  static TextStyle h3({BuildContext context, Color textColor = Colors.black}) {
    return TextStyle(
      fontSize: FontSize.h3(context),
      color: textColor,
      fontFamily: FontFamily.montserrat
    );
  }

  static TextStyle h4({BuildContext context, Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: FontSize.h4(context),
        color: textColor,
        fontFamily: FontFamily.montserrat
    );
  }
  static TextStyle h5({BuildContext context, Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: FontSize.h5(context),
        color: textColor,
        fontFamily: FontFamily.montserrat
    );
  }
  static TextStyle h6({BuildContext context, Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: FontSize.h6(context),
        color: textColor,
        fontFamily: FontFamily.montserrat
    );
  }

  static TextStyle textFieldStyle({BuildContext context}) {
    return TextStyle(
      fontSize: FontSize.h3(context),
      color: Colors.white70,
      fontFamily: FontFamily.montserrat,
    );
  }

}

















class FontSize {

  static double h6(BuildContext context){
    return Utils.isPhone(context) ? 10 : 13;
  }
  static double h5(BuildContext context){
    return Utils.isPhone(context) ? 13 : 16;
  }
  static double h4(BuildContext context){
    return Utils.isPhone(context) ? 15 : 19;
  }
  static double h3(BuildContext context){
    return Utils.isPhone(context) ? 16 : 24;
  }
  static double h2(BuildContext context){
    return Utils.isPhone(context) ? 23 : 29;
  }
  static double h1(BuildContext context){
    return Utils.isPhone(context) ? 27 : 36;
  }
  static double h1Plus(BuildContext context){
    return Utils.isPhone(context) ? 55 : 75;
  }

}


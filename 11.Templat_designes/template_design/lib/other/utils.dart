import 'package:flutter/material.dart';


class Utils {
  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 600 ? true : false;
  }
}
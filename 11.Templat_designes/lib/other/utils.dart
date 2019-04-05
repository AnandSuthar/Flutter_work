import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Utils {
  static bool isPhone() {
    double deviceActualWidth = Utils.screenWidth();
    return deviceActualWidth < 600 ? true : false;
  }
  static double screenWidth() {
    return ui.window.physicalSize.width/ui.window.devicePixelRatio;
  }
}
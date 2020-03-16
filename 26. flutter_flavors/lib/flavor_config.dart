// https://medium.com/flutter-community/flutter-ready-to-go-e59873f9d7de

import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  QA,
  PRODUCTION
}


class FlavorValues {
  final String server;
  FlavorValues({@required this.server});
}


class FlavorConfiguration {
  final Flavor flavor;
  final FlavorValues flavorValues;
  static FlavorConfiguration _singletonInstance;
  Color bannerColor;

  FlavorConfiguration._internal(this.flavor, this.flavorValues, this.bannerColor);

  factory FlavorConfiguration({
    @required Flavor flavor,
    @required FlavorValues flavorValues,
    Color bannerColor
  }){

    _singletonInstance ??= FlavorConfiguration._internal(flavor, flavorValues, bannerColor);
     return _singletonInstance;
  }



  static FlavorConfiguration get singletonInstance {return _singletonInstance;}
  static bool isProduction() => _singletonInstance.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _singletonInstance.flavor == Flavor.DEV;
  static bool isQA() => _singletonInstance.flavor == Flavor.QA;

}
















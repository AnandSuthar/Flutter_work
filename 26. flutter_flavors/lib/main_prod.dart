import 'package:flutter/material.dart';
import 'package:flutter_flavors/flavor_config.dart';
import 'package:flutter_flavors/main.dart';

void main() {



  FlavorConfiguration(
    flavor: Flavor.PRODUCTION,
    flavorValues: FlavorValues(server: "Live server"),
    bannerColor: Colors.transparent
  );


  print('''
  --------------------------------------------------------------------------------------------------------
  
  ---------------------------------------------- ${FlavorConfiguration.singletonInstance.flavor.toString().split('.').last} ----------------------------------------------
  
  --------------------------------------------------------------------------------------------------------
  ''');


  runApp(MyApp());

}
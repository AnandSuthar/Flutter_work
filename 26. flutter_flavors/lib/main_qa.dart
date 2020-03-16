import 'package:flutter/material.dart';
import 'package:flutter_flavors/flavor_config.dart';
import 'package:flutter_flavors/main.dart';


void main() {


  FlavorConfiguration(
    flavor: Flavor.QA,
    flavorValues: FlavorValues(server: 'Staging server'),
    bannerColor: Colors.yellow
  );

  print('''
  --------------------------------------------------------------------------------------------------------
  
  ---------------------------------------------- ${FlavorConfiguration.singletonInstance.flavor.toString().split('.').last} ----------------------------------------------
  
  --------------------------------------------------------------------------------------------------------
  ''');


  runApp(MyApp());

}
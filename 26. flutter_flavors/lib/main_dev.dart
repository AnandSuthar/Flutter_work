import 'package:flutter/material.dart';
import 'package:flutter_flavors/flavor_config.dart';

import 'main.dart';

void main() {


  FlavorConfiguration(
    flavor: Flavor.DEV,
    flavorValues: FlavorValues(server: "Development server"),
    bannerColor: Colors.green
  );


  print('''
  --------------------------------------------------------------------------------------------------------
  
  ---------------------------------------------- ${FlavorConfiguration.singletonInstance.flavor.toString().split('.').last} ----------------------------------------------
  
  --------------------------------------------------------------------------------------------------------
  ''');


  runApp(MyApp());

}
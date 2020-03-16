import 'main.dart';
import 'package:flutter/material.dart';

const firstScreenRoute = "/first";
const secondScreenRoute = "/second";




class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case firstScreenRoute:
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case secondScreenRoute:

        var allFruits = args as List<String>;
        var fruit1 = allFruits[0];
        var fruit2 = allFruits[1];

        return MaterialPageRoute(builder: (_) => SecondScreen(message: fruit1, message2: fruit2));
    }


  }

}


import 'package:flutter/material.dart';
import 'package:theme/HomeScreen.dart';
import 'package:theme/theme.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
      theme: MaterialThemeData.lightTheme,
    );

  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'routeGenerator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: firstScreenRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: FirstScreen(),
    );
  }
}


class FirstScreen extends StatefulWidget {
  createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First screen"),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          Navigator.pushNamed(context,  secondScreenRoute, arguments: ["Apple", "Banana"]);
        }, child: Text("Go to second screen"),),
      ),
    );
  }
}


class SecondScreen extends StatefulWidget {

  String message;
  String message2;

  SecondScreen({this.message, this.message2});

  createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          Navigator.pop(context);
        },child: Text(widget.message + widget.message2),),
      ),
    );
  }
}

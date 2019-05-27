import 'package:flutter/material.dart';
import 'Animation1Controller.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeViewController(),
    );
  }
}

class HomeViewController extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero animations"),),
      body: Column(
        children: <Widget>[

          RaisedButton(onPressed: () {

            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __){
              return Animation1Controller();
            }));

          }, child: Text("Sample1"),),

          RaisedButton(onPressed: () {

          }, child: Text("Sample2"),)

        ],
      ),
    );
  }

}
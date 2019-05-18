import 'package:flutter/material.dart';
import 'ParameterInRoute.dart';

class HomeViewController extends StatefulWidget {
  createState() => HomeViewControllerState();
}


class HomeViewControllerState extends State<HomeViewController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[

              RaisedButton(onPressed: () {
                Navigator.pushNamed(context, "/first");
              }, child: Text("go to screen1"),),

              RaisedButton(onPressed: () {

                Navigator.pushNamed(
                  context,
                  ParameterInRoute.routeName,
                  arguments: "Bar title"
                );
              }, child: Text("Screen with parameter"),)

            ],
          )
        ),
      ),
    );

  }
}
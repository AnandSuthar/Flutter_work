import 'package:flutter/material.dart';

class ParameterInRoute extends StatefulWidget {

  static const routeName = '/parameterInRoute';

  @override
  createState() => ParameterInRouteState();
}

class ParameterInRouteState extends State<ParameterInRoute> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("titleee"),),
      body: Container(
        child: Center(
          child: RaisedButton(onPressed: () {

            Navigator.pop(context);

          }, child: Text("Pop"),),
        ),
      ),
    );


  }

}
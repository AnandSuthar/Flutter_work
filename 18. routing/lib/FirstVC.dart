import 'package:flutter/material.dart';

class FirstVC extends StatefulWidget {
  createState() => FirstVCState();
}

class FirstVCState extends State<FirstVC> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("First VC"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("pop"),),

              RaisedButton(onPressed: () {
                Navigator.pushNamed(context, "/second");
              }, child: Text("go to second"),)
            ],
          ),
        ),
      ),
    );

  }
}
import 'package:flutter/material.dart';

class SecondVC extends StatefulWidget {
  createState() => SecondVCState();
}

class SecondVCState extends State<SecondVC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second VC"),),
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
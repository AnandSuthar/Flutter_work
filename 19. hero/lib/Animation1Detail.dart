import 'package:flutter/material.dart';


class Animation1Detail extends StatefulWidget {
  @override
  createState() => Animation1DetailState();
}


class Animation1DetailState extends State<Animation1Detail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Animation 1 detail"),),
      body: Container(
        child: Hero(tag: "Print", child: Icon(Icons.print, size: 120, color: Colors.green,)),
      ),
    );


  }
}
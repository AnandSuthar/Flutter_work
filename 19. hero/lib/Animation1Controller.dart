import 'package:flutter/material.dart';
import 'Animation1Detail.dart';



class Animation1Controller extends StatefulWidget {
  @override
  createState() => Animartion1ControllerState();
}

class Animartion1ControllerState extends State<Animation1Controller> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Animation 1"),),
      body: Container(
        child: Center(
          child: InkWell(
            child: Hero(tag: "Print", child: Icon(Icons.print, size: 60, color: Colors.red,)),
            onTap: () {

              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __,){
                return Animation1Detail();
              }));

            },
          ),
        ),
      ),
    );

  }

}
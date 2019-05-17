import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class ShowActivityIndicator extends StatefulWidget {
  @override
  createState() => ShowActivityIndicatorState();
}

class ShowActivityIndicatorState extends State<ShowActivityIndicator> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Activity indicator"),),
      body: Container(
        child: Center(
          child: CupertinoActivityIndicator(animating: true, radius: 22,),
//          child: RaisedButton(onPressed: () {
//
//            showCupertinoModalPopup(context: context, builder: (BuildContext context) {
//
//              return CupertinoActivityIndicator(animating: true, radius: 25,);
//
//            });
//
//          }, child: Text("Press me"),),
        ),
      ),
    );

  }

}
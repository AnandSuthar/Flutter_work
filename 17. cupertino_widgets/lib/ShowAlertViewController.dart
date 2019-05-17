import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowAlertViewController extends StatefulWidget {
  @override
  createState() => ShowAlertViewControllerState();
}

class ShowAlertViewControllerState extends State<ShowAlertViewController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertViewController"),),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.blueAccent,
        child: RaisedButton(onPressed: () {

          showCupertinoDialog(context: context, builder: (BuildContext context) {

            return CupertinoAlertDialog(title: Text("Alert"), content: Text("Content"), actions: <Widget>[
              CupertinoDialogAction(child: Text("Close"), isDefaultAction: true, isDestructiveAction: true, onPressed: () {
                Navigator.pop(context);
              },),
              CupertinoDialogAction(child: Text("Done"), )
            ],);

          });


        }, child: Text("Press me"),),
      ),
    );
  }
}
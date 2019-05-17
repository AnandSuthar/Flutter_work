import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ShowActionSheet extends StatefulWidget {
  createState() => ShowActionSheetState();
}

class ShowActionSheetState extends State<ShowActionSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Action Sheet"),),
      body: Container(
        child: RaisedButton(onPressed: () {
          
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                
                title: Text("Title"), 
                message: Text("Message"), 
                actions: <Widget>[
                  CupertinoActionSheetAction(onPressed: () {}, child: Text("Action1")),
                  CupertinoActionSheetAction(onPressed: () {}, child: Text("Action2")),
                  CupertinoActionSheetAction(onPressed: () {}, child: Text("Action3")),
                ],
                cancelButton: CupertinoActionSheetAction(onPressed: () {}, child: Text("Cancel")),
              )
          );

        }, child: Center(
          child: Text("Press me"),
        ),),
      ),
    );
  }
}
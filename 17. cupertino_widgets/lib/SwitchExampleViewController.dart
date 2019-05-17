import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SwitchExampleViewController extends StatefulWidget {
  @override
  createState() => SwitchExampleViewControllerState();
}


class SwitchExampleViewControllerState extends State<SwitchExampleViewController> {

  bool switchValue = false;
  MaterialColor color = Colors.red;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch"),),
      body: Container(
        color: color,
        child: Center(
          child: Switch(value: switchValue, onChanged: (bool newValue) {

            color = newValue == true ? Colors.green : Colors.red;

            setState(() {
              switchValue = newValue;
            });

          },
            activeColor: Colors.red,
            inactiveTrackColor: Colors.green,
            activeTrackColor: Colors.red,
            inactiveThumbColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
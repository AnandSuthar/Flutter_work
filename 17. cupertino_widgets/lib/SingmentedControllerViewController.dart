import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SingmentedControllerViewController extends StatefulWidget {
  @override
  createState() => SingmentedControllerViewControllerState();
}

class SingmentedControllerViewControllerState extends State<SingmentedControllerViewController> {

  int selectedIndex = 0;
  final Map<int, Widget> segmentWidgets = const <int, Widget> {
    0: Text("Segment 1"),
    1: Text("Segment 2"),
    2: Text("   Segment 3   "),
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Sigmented control"),),
      body: Center(
        child: CupertinoSegmentedControl(
            children: segmentWidgets,
            onValueChanged: (int index) {
              selectedIndex = index;
              setState(() {
              });
            },
          groupValue: selectedIndex,
        ),
      ),
    );

  }

}
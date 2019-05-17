import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSliderViewController extends StatefulWidget {
  @override
  createState() => CupertinoSliderViewControllerState();
}

class CupertinoSliderViewControllerState extends State<CupertinoSliderViewController> {

  double thumbValue = 5;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Slider"),),
      body: Center(
        child: CupertinoSlider(value: thumbValue, min: 0, max: 50, onChanged: (currentValue) {

          print("currentValue = $currentValue");

          setState(() {
            thumbValue = currentValue;
          });


        }),
      ),
    );
    
  }
}
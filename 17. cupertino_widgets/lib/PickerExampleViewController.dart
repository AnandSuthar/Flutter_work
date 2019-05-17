import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PickerExampleViewController extends StatefulWidget {
  @override
  createState() => PickerExampleViewControllerState();
}

class PickerExampleViewControllerState extends State<PickerExampleViewController> {


  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 216.0,
//      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Picker"),),
      body: Column(
        children: <Widget>[
          RaisedButton(onPressed: () {


            showCupertinoModalPopup(context: context, builder: (BuildContext context) {
              return _buildBottomPicker(
                  CupertinoPicker(itemExtent: 35.0, onSelectedItemChanged: (int selectedIndex){
                    print("Index = $selectedIndex");
                  }, children: List<Widget>.generate(20, (int index) {

                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("index = $index"),
                    );

                  }))
              );
            });




          }, child: Text("Press me"),)
        ],
      ),
    );

  }
}
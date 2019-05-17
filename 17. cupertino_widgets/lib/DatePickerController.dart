import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DatePickerController extends StatefulWidget {
  @override
  createState() => DatePickerControllerState();
}

class DatePickerControllerState extends State<DatePickerController> {
  @override
  Widget build(BuildContext context) {

    Widget _buildBottomPicker(Widget picker) {
      return Container(
        height: 216.0,
        padding: const EdgeInsets.only(top: 6.0),
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

    return Scaffold(
      appBar: AppBar(title: Text("DatePicker"),),
      body: Container(
        child: Column(
          children: <Widget>[

          RaisedButton(onPressed: () {

            showCupertinoModalPopup(context: context, builder: (BuildContext context){

              return _buildBottomPicker(
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 12),
                  onDateTimeChanged: (DateTime newDateTime) {

                  },
                )
              );
            });
          }, child: Text("Time"),),


          RaisedButton(onPressed: () {
            showCupertinoModalPopup(context: context, builder: (BuildContext context){

              return _buildBottomPicker(
                CupertinoDatePicker(mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime){
                  })
              );

            });
          }, child: Text("Date"),),


          ],
        ),
      ),
    );

  }
}
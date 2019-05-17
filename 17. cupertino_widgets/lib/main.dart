import 'package:flutter/material.dart';
import 'package:cupertino_widgets/ShowActionSheet.dart';
import 'ShowActivityIndicator.dart';
import 'ShowAlertViewController.dart';
import 'DatePickerController.dart';
import 'PickerExampleViewController.dart';
import 'CupertinoScrollbarViewController.dart';
import 'SingmentedControllerViewController.dart';
import 'CupertinoSliderViewController.dart';
import 'SwitchExampleViewController.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new CupertinoWidgets());
  }
}

class CupertinoWidgets extends StatelessWidget {

  Widget widgetsItem(String title, BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Text(title),
      ),
      onTap: () {

        switch(title) {
          case "Action sheet":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return  ShowActionSheet();
            }));
            break;
          case "Activity indicator":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return ShowActivityIndicator();
            }));
            break;
          case "Alert dialog":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return ShowAlertViewController();
            }));
            break;
          case "Date picker":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return DatePickerController();
            }));
            break;
          case "picker":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return PickerExampleViewController();
            }));
            break;
          case "Scrollbars":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return CupertinoScrollbarViewController();
            }));
            break;
          case "Segmented control":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return SingmentedControllerViewController();
            }));
            break;
          case "Slider":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return CupertinoSliderViewController();
            }));
            break;
          case "Switch":
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return SwitchExampleViewController();
            }));
            break;


        }

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Widgets"),
      ),
      body: ListView(
        children: <Widget>[
          widgetsItem("Action sheet", context),
          widgetsItem("Activity indicator", context),
          widgetsItem("Alert dialog", context),
          widgetsItem("Date picker", context),
          //widgetsItem("Fullscreen dialog", context),
          //widgetsItem("Page scaffold", context),
          //widgetsItem("picker", context),
          widgetsItem("Scrollbars", context),
          widgetsItem("Segmented control", context),
          widgetsItem("Slider", context),
          widgetsItem("Switch", context),
          //widgetsItem("Navigation bar", context),
          //widgetsItem("Tabbar", context),
          //widgetsItem("text field", context),
          //widgetsItem("Tabview", context),
          //widgetsItem("Tab scaffold", context),
          //widgetsItem("Time picker", context),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:template_design/other/styles.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/utils.dart';



class UserProfileViewController extends StatefulWidget {
  @override
  createState() => UserProfileViewControllerState();
}

class UserProfileViewControllerState extends State<UserProfileViewController> {



  List<Widget> allWidgets = [
    Container(
      color: Const.colorGreen,
      height: Utils.screenWidth()/1.7,
    ),
    _simpleRow(title: "Get help"),
  ];



  static Widget _emailAddressRow({String title, String email}) {

  }

  static Widget _telephoneRow({String title, String telephoneNo}) {

  }

  static Widget _notificationRow({String title}) {

  }

  static Widget _simpleRow({String title, Color titleColor = Colors.black, Widget accessoryWidget}) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(title, style: Responsive.textStyle(sizeInPhone: 12),)
          ),
          (accessoryWidget != null) ? accessoryWidget : Container()
        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: allWidgets,
        ),
      ),
    );


  }
}
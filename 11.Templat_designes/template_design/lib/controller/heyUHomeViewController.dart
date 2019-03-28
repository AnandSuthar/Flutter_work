import 'package:flutter/material.dart';
import 'package:template_design/other/bottombar.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/styles.dart';
import 'dart:math' as math;


class HeyUHomeViewController extends StatefulWidget {
  @override
  createState() => HeyUHomeViewControllerState();
}




class HeyUHomeViewControllerState extends State<HeyUHomeViewController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
            "Message",
            style: Styles.h4(context: context, textColor: Colors.black)
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          width: 200,
          child: Text(
              "Edit",
              style: Styles.h5(context: context, textColor: Const.colorRedStart)
          ),
          padding: EdgeInsets.only(left: 20, top: 20),
        ),
        bottom: PreferredSize(
            child: Container(color: Colors.grey, height: 1.0,),
            preferredSize: Size.fromHeight(1.0)
        ),
        actions: <Widget>[
          Container(
            child: Icon(Icons.search, color: Const.colorRedStart, size: 28,),
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),


      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Const.colorRedStart,
          elevation: 13.0,
        ),
      ),

      floatingActionButtonLocation: _CenterFloatFabLocation2(),
      bottomNavigationBar: Bottombar(
        height: 60,
        iconSize: 28,
        color: Colors.grey,
        selectedColor: Const.colorRedStart,
        items:[
          BottombarItem(iconData: Icons.message),
          BottombarItem(iconData: Icons.supervisor_account),
          BottombarItem(iconData: Icons.menu),
          BottombarItem(iconData: Icons.perm_identity),
        ],
      ),



    );

  }
}






























class _CenterFloatFabLocation2 extends FloatingActionButtonLocation {
  const _CenterFloatFabLocation2();

  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight / 2.0;
    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0)
      fabY = math.min(fabY, contentBottom - snackBarHeight - fabHeight - kFloatingActionButtonMargin);
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0)
      fabY = math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return math.min(maxFabY, fabY);
  }


  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width) / 2.0;
    return Offset(fabX, (getDockedY(scaffoldGeometry)+23));
  }
}

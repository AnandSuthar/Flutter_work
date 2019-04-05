import 'package:flutter/material.dart';
import 'package:template_design/other/Customization/bottombar.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/utils.dart';
import 'dart:math' as math;
import 'usersViewController.dart';
import 'groupsViewController.dart';




class HeyUHomeViewController extends StatefulWidget {

  UsersViewController usersVC = UsersViewController();
  GroupsViewController groupsVC = GroupsViewController();
  UsersViewController vc3 = UsersViewController();
  UsersViewController vc4 = UsersViewController();

  @override
  createState() => HeyUHomeViewControllerState();

}




class HeyUHomeViewControllerState extends State<HeyUHomeViewController> {

  Widget currentViewController;
  var floatingButtonLocation = _CenterFloatFabLocation2();

  @override
  void initState() {
    super.initState();
    currentViewController = widget.usersVC;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: currentViewController,
      floatingActionButton: Container(
        height: (Utils.isPhone() ? 50 : 65),
        width: (Utils.isPhone() ? 50 : 65),
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Const.colorRedStart,
          elevation: 13.0,
        ),
      ),

      floatingActionButtonLocation: floatingButtonLocation,
      bottomNavigationBar: Bottombar(
        height: (Utils.isPhone() ? 45 : 60),
        iconSize: (Utils.isPhone() ? 23 : 28),
        color: Colors.grey,
        selectedColor: Const.colorRedStart,
        items:[
          BottombarItem(iconData: Icons.message),
          BottombarItem(iconData: Icons.supervisor_account),
          BottombarItem(iconData: Icons.menu),
          BottombarItem(iconData: Icons.perm_identity),
        ],
        onTabSelected: (index) {
          setState(() {

            switch (index) {
              case 0: {
                currentViewController = widget.usersVC;
                break;
              }
              case 1: {
                currentViewController = widget.groupsVC;
                break;
              }
              case 2: {
                currentViewController = widget.vc3;
                break;
              }
              case 3: {
                currentViewController = widget.vc4;
                break;
              }
            }


          });
        },
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
    return Offset(fabX, (getDockedY(scaffoldGeometry)+(Utils.isPhone() ? 16 : 23 )));
  }
}

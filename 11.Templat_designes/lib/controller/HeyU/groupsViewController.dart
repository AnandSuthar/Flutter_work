import 'package:flutter/material.dart';
import 'package:template_design/other/styles.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/utils.dart';




class GroupsViewController extends StatefulWidget {
  @override
  createState() => GroupViewControllerState();
}


class GroupViewControllerState extends State<GroupsViewController> {






  // List of members images
  List<Widget> _membersImages(List<String> groupMembers) {

    final double profileImageSize = Utils.isPhone() ? 26 : 40;
    final double marginInBetweenPics = Utils.isPhone() ? 2 : 4;

    List<Widget> members = new List<Widget>();
    for(var index=0; index<groupMembers.length; index++) {
      members.add(Container(
        margin: EdgeInsets.all(marginInBetweenPics),
        width: profileImageSize,
        height: profileImageSize,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(profileImageSize/2),
            image: DecorationImage(
                image: NetworkImage(groupMembers[index])
            )
        ),
      ));
    }

    return members;

  }







  Widget _groupCell({String groupName, String recentUpdate, List<String> groupMembers}) {

    final double marginCellItem = Utils.isPhone() ? 14 : 20;

    return Container(
      margin: EdgeInsets.only(left: marginCellItem, right: marginCellItem, top: marginCellItem),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey[350],
          blurRadius: Utils.isPhone() ? 10 : 15
        )
      ]),

      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[


            // Popup menu icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                PopupMenuButton(
                  icon: Icon(Icons.more_vert, color: Colors.grey,),
                  itemBuilder: (BuildContext context) => <PopupMenuItem>[

                    PopupMenuItem(child: Container(child: Text("Mute notifications", style: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.grey[700]),),)),
                    PopupMenuItem(child: Container(child: Text("Report", style: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.grey[700])),)),
                    PopupMenuItem(child: Container(child: Text("Exit group", style: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.grey[700])),)),

                  ]
                )
              ],
            ),


            // Group name
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 2),
              child: Text(groupName, style: Responsive.textStyle(sizeInPhone: 15),),
            ),


            // Recent update
            Container(
              child: Text(recentUpdate, style: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.grey),),
            ),


            // members images
            Container(
              margin: EdgeInsets.only(top: Utils.isPhone() ? 10 : 15, bottom: Utils.isPhone() ? 30 : 40),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _membersImages(groupMembers),
                ),
              ),

            )


          ],
        ),
      ),
    );

  }











  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Groups",
          style: Responsive.textStyle(sizeInPhone: 17),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          width: 200,
          child: Text(
            "Edit",
            style: Responsive.textStyle(sizeInPhone: 13, textColor: Const.colorRedStart),
          ),
          padding: EdgeInsets.only(left: 20, top: 20),
        ),
        bottom: PreferredSize(
            child: Container(color: Colors.grey[400], height: 1.0,),
            preferredSize: Size.fromHeight(1.0)
        ),
        actions: <Widget>[
          Container(
            child: Icon(Icons.add, color: Const.colorRedStart, size: Responsive.iconSize(sizeInPhone: 25),),
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),


      body: ListView(
        children: <Widget>[

          _groupCell(groupName: "Gotham City Police Department", recentUpdate: "5 minutes ago - 4 members", groupMembers: [
            "https://htmlstream.com/preview/unify-v2.6.2/assets/img-temp/400x450/img5.jpg",
            "http://aacd.com/proxy.php?filename=images/Continuing%20Education/Residency/caroline.png",
            "http://profilepicturesdp.com/wp-content/uploads/2018/07/profile-picture-demo-7.jpg",
            "https://bdthemes.net/demo/joomla/kirion/images/sampledata/team/team17.jpg"
          ]),

          _groupCell(groupName: "Wayne Enterprises", recentUpdate: "2 days ago - 5 members", groupMembers: [
            "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
            "https://www.bootdey.com/img/Content/avatar/avatar1.png",
            "https://www.koddex.com/images/team-member-1.jpg",
            "http://diss.com.qa/wp-content/uploads/2018/04/john-doe.jpg",
            "http://demo.solwininfotech.com/wordpress/veriyas-pro/wp-content/uploads/2016/05/John-Doe.jpg"
          ]),
          
          _groupCell(groupName: "Falcone Crime Family", recentUpdate: "Saturday - 7 members", groupMembers: [
            "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg",
            "https://htmlstream.com/preview/unify-v2.6.2/assets/img-temp/400x450/img5.jpg",
            "http://aacd.com/proxy.php?filename=images/Continuing%20Education/Residency/caroline.png",
            "http://profilepicturesdp.com/wp-content/uploads/2018/07/profile-picture-demo-7.jpg",
            "https://bdthemes.net/demo/joomla/kirion/images/sampledata/team/team17.jpg",
            "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
            "https://www.bootdey.com/img/Content/avatar/avatar1.png"
          ]),
          
          _groupCell(groupName: "Arkham Asylum", recentUpdate: "Saturday - 2 members", groupMembers: [
            "https://htmlstream.com/preview/unify-v2.6.2/assets/img-temp/400x450/img5.jpg",
            "http://aacd.com/proxy.php?filename=images/Continuing%20Education/Residency/caroline.png",
          ])

        ],
      ),



    );
  }
}
















import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:template_design/other/styles.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/utils.dart';



class ContactsViewController extends StatefulWidget {
  @override
  createState() => ContactsViewControllerState();
}

class ContactsViewControllerState extends State<ContactsViewController> {

  
  
  Widget _contactCell({ContactUser contactUser}) {
    
    return Container(
      child: Row(
        children: <Widget>[

          // profile pic
          Container(
            margin: EdgeInsets.all(10),
            width: Utils.isPhone() ? 45 : 50,
            height: Utils.isPhone() ? 45 : 50,
            child: Stack(
              children: <Widget>[
                Container(
                  width: Utils.isPhone() ? 45 : 50,
                  height: Utils.isPhone() ? 45 : 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Utils.isPhone() ? 22.5 : 25,),
                      image: DecorationImage(
                          image: NetworkImage(contactUser.profilePic)
                      )
                  ),
                ),

                Visibility(
                  child: Align(
                    alignment: Alignment(0.95, 0.95),
                    child: Container(
                      height: Utils.isPhone() ? 10 : 12,
                      width: Utils.isPhone() ? 10 : 12,
                      decoration: BoxDecoration(
                          color: Const.colorRedStart,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white, width: 2.0)
                      ),
                    ),
                  ),
                  visible: contactUser.status,
                )
              ],
            ),
          ),

          // user name
          Expanded(
              child: Text(contactUser.name, style: Responsive.textStyle(sizeInPhone: 14),)
          ),

          // accessory
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(Icons.info_outline, color: Colors.grey[500], size: Responsive.iconSize(sizeInPhone: 28),),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                ),
                Container(
                  child: Icon(Icons.message, color: Colors.grey[500], size: Responsive.iconSize(sizeInPhone: 28)),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                )
              ],
            ),
          )
          
        ],
      ),
    );

  }

  Widget _cellWithStickyHeader({String headerTitle, List<ContactUser> contactUsers, bool needToShowUserCount = false}) {


    List<Widget> widgetsForColumn = List<Widget>();
    for(var index = 0; index<contactUsers.length; index++) {
      widgetsForColumn.add(_contactCell(contactUser: contactUsers[index]));
      if(index != contactUsers.length-1) {
        widgetsForColumn.add(Divider(color: Colors.grey[400], height: 0,));
      }
    }


    return StickyHeader(

        header: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: double.maxFinite,
          color: Colors.grey[200],
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[

                // Header name
                Text(
                  headerTitle + ((needToShowUserCount) ? "[" : ""),
                  style: Responsive.textStyle(sizeInPhone: 13, textColor: Colors.grey[500]),
                ),


                // Count's start bracket
                (needToShowUserCount)
                    ?
                Text("${contactUsers.length}", style: Responsive.textStyle(sizeInPhone: 15, textColor: Const.colorRedStart),)
                    :
                Container(),


                // Count's end bracket
                (needToShowUserCount)
                    ?
                Text("]", style: Responsive.textStyle(sizeInPhone: 13, textColor: Colors.grey[500]),)
                    :
                Container()

              ],
            ),
          ),
        ),

        content:Column(
          children: widgetsForColumn,
//          children: contactUsers.map((user) => _contactCell(contactUser: user)).toList(),
        ),

    );

  }


  
  
  
  

  @override
  Widget build(BuildContext context) {

    final List<ContactUser> onlineUsers = [
      ContactUser(
          profilePic: "http://diss.com.qa/wp-content/uploads/2018/04/john-doe.jpg",
          name: "Oswald Cobblepot",
          status: true
      ),
      ContactUser(
          profilePic: "http://aacd.com/proxy.php?filename=images/Continuing%20Education/Residency/caroline.png",
          name: "Fish Mooney",
          status: true
      ),
      ContactUser(
          profilePic: "http://profilepicturesdp.com/wp-content/uploads/2018/07/profile-picture-demo-7.jpg",
          name: "Bruce Wayne",
          status: true
      ),
      ContactUser(
          profilePic: "https://bdthemes.net/demo/joomla/kirion/images/sampledata/team/team17.jpg",
          name: "Barbra Kean",
          status: true
      ),
      ContactUser(
          profilePic: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
          name: "Edward Nygma",
          status: true
      ),
    ];
    
    final List<ContactUser> offlineUsers = [
      ContactUser(
        profilePic: "https://www.bootdey.com/img/Content/avatar/avatar1.png",
        name: "Selina Kyle",
      ),
      ContactUser(
        profilePic: "https://www.koddex.com/images/team-member-1.jpg",
        name: "Harvey Bullock",
      ),
      ContactUser(
        profilePic: "https://htmlstream.com/preview/unify-v2.6.2/assets/img-temp/400x450/img5.jpg",
        name: "Jim Gordon",
      ),
    ];

    return Scaffold(


      appBar: AppBar(
        title: Text(
          "Contacts",
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



      body: Column(
        children: <Widget>[

          // Search box
          Container(
            height: 60,
            color: Colors.grey[300],
            child: Container(
              margin: EdgeInsets.all(12),
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search friends",
                    hintStyle: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.grey),
                    prefixIcon: Icon(Icons.search, size: Responsive.iconSize(sizeInPhone: 14),),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),


          // List View
          Expanded(
              child: ListView(
                children: <Widget>[
                  _cellWithStickyHeader(headerTitle: "Online", contactUsers: onlineUsers, needToShowUserCount: true),
                  _cellWithStickyHeader(headerTitle: "Others", contactUsers: offlineUsers)
                ],
              )
          )



        ],
      ),




    );
  }

}



















class ContactUser {
  final String profilePic;
  final String name;
  final bool status;
  ContactUser({this.profilePic, this.name, this.status = false});
}
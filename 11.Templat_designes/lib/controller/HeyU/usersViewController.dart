import 'package:flutter/material.dart';
import 'package:template_design/other/styles.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/Customization/slideMenu.dart';
import 'package:template_design/other/utils.dart';
import 'package:template_design/controller/HeyU/chatViewController.dart';






class UsersViewController extends StatefulWidget {

  @override
  createState() => UsersViewControllerState();
}





class UsersViewControllerState extends State<UsersViewController> {


  int currentDraggingRow;
  int selectedRow;

  Widget _userCell({BuildContext context,int index, String imageUrl, String name, String lastMsg, String lastSeen, bool isOnline}) {

    return SlideMenu(
      index: index,

      needToHideMenu: (currentDraggingRow == index ? false : (selectedRow == index ?  false :  true )),

      onItemTap: (index) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatViewController()));
      },

      onItemDrage: (index) {
        setState(() {
          currentDraggingRow = index;
        });
      },

      onItemSelected: (index){
        setState(() {
          selectedRow = index;
        });
      },

      child: Container(
        height: Utils.isPhone() ? 75 : 100 ,
        color: (currentDraggingRow == index) ? Colors.grey[200] : Colors.transparent,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15),
              width: Utils.isPhone() ? 50 : 70,
              height: Utils.isPhone() ? 50 : 70,
              child: Stack(
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(Utils.isPhone() ? 25 : 35),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl)
                        )
                    ),
                  ),

                  Visibility(
                    child: Align(
                      alignment: Alignment(.65, 1),
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
                    visible: isOnline,
                  )

                ],
              ),
            ),


            Container(width: 15,),

            Container(
              child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name, style: Responsive.textStyle(sizeInPhone: 16),),
                      Text(
                        lastMsg,
                        style: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
              ),
            ),



            Container(
              margin: EdgeInsets.only(right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(lastSeen, style: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.grey),),
                  Text(""),
                  Text(""),
                ],
              ),
            )



          ],
        ),
      ),
      menuItems: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.more_horiz, size: Responsive.iconSize(sizeInPhone: 25),), onPressed: (){
                print("index = $index");
              }),
              Text(
                "More",
                style: Responsive.textStyle(sizeInPhone: 10),
                overflow: TextOverflow.fade,
                maxLines: 1,
              )
            ] ,
          ),

        ),
        Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.delete, color: Colors.white, size: Responsive.iconSize(sizeInPhone: 25),), onPressed: (){
                print("index = $index");
              }),
              Text(
                "Delete",
                style: Responsive.textStyle(sizeInPhone: 10, textColor: Colors.white),
                overflow: TextOverflow.fade,
                maxLines: 1,
              )
            ] ,
          ),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
            "Messages",
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
            child: Icon(Icons.search, color: Const.colorRedStart, size: Responsive.iconSize(sizeInPhone: 25),),
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),



      body: ListView(
        children: <Widget>[
          _userCell(
              context: context,
              name: "Oswald Cobblepot",
              lastMsg: "I'm the king of Cotham!",
              imageUrl: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg",
              isOnline: false,
              index: 0,
              lastSeen: "7:03 PM",
          ),
          _userCell(
              context: context,
              name: "Fish Mooney",
              lastMsg: "Please don't call me \"Bobes\"",
              imageUrl: "http://demo.solwininfotech.com/wordpress/veriyas-pro/wp-content/uploads/2016/05/John-Doe.jpg",
              isOnline: true,
              index: 1,
              lastSeen: "5:35 PM"
          ),
          _userCell(
              context: context,
              name: "Barbara Kean",
              lastMsg: "it's Gotham, baby. We've all got flair!",
              imageUrl: "http://diss.com.qa/wp-content/uploads/2018/04/john-doe.jpg",
              isOnline: false,
              index: 2,
              lastSeen: "Yesterday"
          ),
          _userCell(
              context: context,
              name: "Edward Nygma",
              lastMsg: "No body, no crime",
              imageUrl: "https://www.koddex.com/images/team-member-1.jpg",
              isOnline: false,
              index: 3,
              lastSeen: "Yesterday"
          ),
          _userCell(
              context: context,
              name: "Selina Kyle",
              lastMsg: "Cat got your tounge?",
              imageUrl: "https://www.bootdey.com/img/Content/avatar/avatar1.png",
              isOnline: false,
              index: 4,
              lastSeen: "Sunday"
          ),
          _userCell(
              context: context,
              name: "Harvey Bullock",
              lastMsg: "I thought I was supported to be the bad guy here?",
              imageUrl: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
              isOnline: true,
              index: 5,
              lastSeen: "Saturday"
          ),
          _userCell(
              context: context,
              name: "Jim cordon",
              lastMsg: "Hiiiii",
              imageUrl: "https://bdthemes.net/demo/joomla/kirion/images/sampledata/team/team17.jpg",
              isOnline: true,
              index: 6,
              lastSeen: "Saturday"
          ),
          _userCell(
              context: context,
              name: "Carla Houston",
              lastMsg: "I'm the king of Cotham!",
              imageUrl: "http://profilepicturesdp.com/wp-content/uploads/2018/07/profile-picture-demo-7.jpg",
              isOnline: false,
              index: 7,
              lastSeen: "Friday"
          ),
          _userCell(
              context: context,
              name: "Samantha Smith",
              lastMsg: "Please don't call me \"Bobes\"",
              imageUrl: "http://aacd.com/proxy.php?filename=images/Continuing%20Education/Residency/caroline.png",
              isOnline: false,
              index: 8,
              lastSeen: "Friday"
          ),
          _userCell(
              context: context,
              name: "Emma Megan",
              lastMsg: "it's Gotham, baby. We've all got flair!",
              imageUrl: "https://htmlstream.com/preview/unify-v2.6.2/assets/img-temp/400x450/img5.jpg",
              isOnline: true,
              index: 9,
              lastSeen: "Friday"
          ),
          _userCell(
              context: context,
              name: "Oswald Cobblepot",
              lastMsg: "I'm the king of Cotham!",
              imageUrl: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg",
              isOnline: false,
              index: 10,
              lastSeen: "7:03 PM"
          ),
          _userCell(
              context: context,
              name: "Fish Mooney",
              lastMsg: "Please don't call me \"Bobes\"",
              imageUrl: "http://demo.solwininfotech.com/wordpress/veriyas-pro/wp-content/uploads/2016/05/John-Doe.jpg",
              isOnline: false,
              index: 11,
              lastSeen: "5:35 PM"
          ),
          _userCell(
              context: context,
              name: "Barbara Kean",
              lastMsg: "it's Gotham, baby. We've all got flair!",
              imageUrl: "http://diss.com.qa/wp-content/uploads/2018/04/john-doe.jpg",
              isOnline: true,
              index: 12,
              lastSeen: "Yesterday"
          ),
          _userCell(
              context: context,
              name: "Edward Nygma",
              lastMsg: "No body, no crime",
              imageUrl: "https://www.koddex.com/images/team-member-1.jpg",
              isOnline: false,
              index: 13,
              lastSeen: "Yesterday"
          ),
          _userCell(
              context: context,
              name: "Selina Kyle",
              lastMsg: "Cat got your tounge?",
              imageUrl: "https://www.bootdey.com/img/Content/avatar/avatar1.png",
              isOnline: true,
              index: 14,
              lastSeen: "Sunday"
          ),
          _userCell(
              context: context,
              name: "Harvey Bullock",
              lastMsg: "I thought I was supported to be the bad guy here?",
              imageUrl: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg",
              isOnline: true,
              index: 15,
              lastSeen: "Saturday"
          ),
          _userCell(
              context: context,
              name: "Jim cordon",
              lastMsg: "Hiiiii",
              imageUrl: "https://bdthemes.net/demo/joomla/kirion/images/sampledata/team/team17.jpg",
              isOnline: true,
              index: 16,
              lastSeen: "Saturday"
          ),
          _userCell(
              context: context,
              name: "Carla Houston",
              lastMsg: "I'm the king of Cotham!",
              imageUrl: "http://profilepicturesdp.com/wp-content/uploads/2018/07/profile-picture-demo-7.jpg",
              isOnline: false,
              index: 17,
              lastSeen: "Friday"
          ),
          _userCell(
              context: context,
              name: "Samantha Smith",
              lastMsg: "Please don't call me \"Bobes\"",
              imageUrl: "http://aacd.com/proxy.php?filename=images/Continuing%20Education/Residency/caroline.png",
              isOnline: false,
              index: 18,
              lastSeen: "Friday"
          ),
          _userCell(
              context: context,
              name: "Emma Megan",
              lastMsg: "it's Gotham, baby. We've all got flair!",
              imageUrl: "https://htmlstream.com/preview/unify-v2.6.2/assets/img-temp/400x450/img5.jpg",
              isOnline: true,
              index: 19,
              lastSeen: "Friday"
          ),


        ],
      )


    );

  }


}
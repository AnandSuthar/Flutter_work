import 'package:flutter/material.dart';
import 'package:template_design/other/styles.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/utils.dart';



class ChatViewController extends StatefulWidget {
  @override
  createState() => ChatViewControllerState();
}

class ChatViewControllerState extends State<ChatViewController> {



  Widget rightChatCell({String profileImage, String message}) {


    double profilePicWidth = 10.0 + 38.0;
    double spaceForMSG = ((Utils.screenWidth() - profilePicWidth)/1.35)-44;


    return Container(
      padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[




          Container(

            padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)
              ),
              border: Border.all(color: Colors.grey[600], width: 0.25)
            ),


            child: ConstrainedBox(constraints: BoxConstraints(
                maxWidth: spaceForMSG
            ),
              child: Text(message,
                style: Responsive.textStyle(sizeInPhone: 12,),
                overflow: TextOverflow.ellipsis,
                maxLines: 500,
              ),
            ),
          ),


          Container(height: 6,),

          (profileImage != null) ?
          Container(
            width: Utils.isPhone() ? 10 : 16,
            height: Utils.isPhone() ? 10 : 16,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(Utils.isPhone() ? 8 : 35),
                image: DecorationImage(
                    image: NetworkImage(profileImage)
                )
            ),
          ) : Container()




        ],
      ),
    );

  }


  Widget leftChatCell({String profileImage, String message, String time = ""}) {

    double profilePicWidth = 10.0 + 38.0;
    double spaceForMSG = ((Utils.screenWidth() - profilePicWidth)/1.35)-36;
    double spaceForTimeStamp = Utils.screenWidth() - (profilePicWidth + spaceForMSG + 44);


    return Container(
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[


          // 38 width
          Container(
            margin: EdgeInsets.only(right: 10),
            width: Utils.isPhone() ? 20 : 28,
            height: Utils.isPhone() ? 20 : 28,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(Utils.isPhone() ? 14 : 35),
                image: DecorationImage(
                    image: NetworkImage(profileImage)
                )
            ),
          ),



          Container(

            padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Const.colorRedStart,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)
              )
            ),


            child: ConstrainedBox(constraints: BoxConstraints(
                    maxWidth: spaceForMSG
                  ),
              child: Text(message,
                style: Responsive.textStyle(sizeInPhone: 12, textColor: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 500,
              ),
            ),
          ),
          

          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ConstrainedBox(constraints: BoxConstraints(
              maxWidth: spaceForTimeStamp,
            ), child: Text(time,
              style: Responsive.textStyle(sizeInPhone: 10, textColor: Colors.grey[500]),
              overflow: TextOverflow.ellipsis,
              maxLines: 500,),),
          ),


        ],
      ),
    );
  }




  Widget _messageBox() {

    return Container(
      color: Const.colorRedStart,
      child: Row(
        children: <Widget>[


          Expanded(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 48,
                  maxHeight: 100
                ),
              child: Scrollbar(
                  child: Container(
                    color: Colors.grey[200],
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: TextField(
                        decoration: InputDecoration.collapsed(hintText: "Your message..."),
                        maxLines: null,
                      ),
                    ),
                  )
              ),
            )
          ),

          Container(
            child: IconButton(icon: Icon(Icons.send, color: Colors.white,), onPressed: () {}),
          )



        ],
      ),
    );

  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(

//      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Oswald Cobblepot", style: Responsive.textStyle(sizeInPhone: 17),),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(color: Colors.grey, height: 1.0,),
            preferredSize: Size.fromHeight(1.0)
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Const.colorRedStart,), onPressed: () {
          Navigator.pop(context);
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.info_outline, color: Const.colorRedStart,), onPressed: null)
        ],
      ),

      body: Column(
        children: <Widget>[

          Flexible(
              child: Scrollbar(
                  child: ListView(
                    children: <Widget>[

                      rightChatCell(
                        message: "Mr. Cobblepot. Nice to meet you!",
                      ),
                      leftChatCell(
                        message: "Call me Penguin.",
                        profileImage: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg",
                        time: "7:00 PM"
                      ),
                      rightChatCell(
                        message: "I thought I hear you hated that name.",
                      ),
                      leftChatCell(
                        message: "It grew on me  😝",
                        profileImage: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg",
                        time: "7:03 PM"
                      ),
                      rightChatCell(
                        message: "Penguin",
                        profileImage: "http://demo.solwininfotech.com/wordpress/veriyas-pro/wp-content/uploads/2016/05/John-Doe.jpg"
                      ),
                      leftChatCell(
                        message: "...",
                        profileImage: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg",
                      )


                    ],
                  )
              )
          ),

          Divider(height: 1.0,),

          _messageBox()

        ],
      ),

    );
  }
}
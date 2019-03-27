import 'package:flutter/material.dart';
import 'package:template_design/other/styles.dart';
import 'package:template_design/other/utils.dart';
import 'package:template_design/other/const.dart';








class HomeViewController extends StatefulWidget {
  @override
  createState() => HomeViewControllerState();
}

class HomeViewControllerState extends State<HomeViewController> {


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: FlutterLogo(
          colors: Colors.green,
        ),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey,), onPressed: () {
          Navigator.pop(context);
        }),

        actions: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.menu, color: Colors.grey))
        ],
      ),


      body: ListView(
        shrinkWrap: true,
        children: <Widget>[


          Stack(
            children: <Widget>[


              Container(
                height: screenSize.width / 7,
                width: screenSize.width,
                color: Colors.grey[50],
                child: Align(
                  child: Text(
                    "Get coaching",
                    style: Styles.h3(context: context),
                  ),
                  alignment: Alignment(0, -0.5),
                ),
              ),


              Container(
                margin: EdgeInsets.only(
                    left: 20, right: 20, top: screenSize.width / 10),
                width: screenSize.width,
                height: screenSize.width / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white),
                child: Row(
                  children: <Widget>[


                    Expanded(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "YOU HAVE",
                                    style: Styles.h6(
                                        context: context, textColor: Colors.grey),
                                  ),
                                  padding: EdgeInsets.only(bottom: 5),
                                ),
                                Text(
                                  "206",
                                  style: Styles.h1(
                                      context: context, textColor: Colors.black),
                                )
                              ],
                            ),
                          ),
                        )
                    ),

                    Expanded(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: screenSize.width / 20,
                                right: screenSize.width / 20,
                                top: screenSize.width / 30,
                                bottom: screenSize.width / 30),
                            decoration: BoxDecoration(
                                color: Colors.greenAccent[100].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(9)),
                            child: Text(
                              "Buy more",
                              style: Styles.h5(
                                  context: context, textColor: Const.colorGreen),
                            ),
                          ),
                        )
                    )



                  ],
                ),
              )


            ],
          ),



          Container(
            margin: EdgeInsets.only(
                top: screenSize.width / 12, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "MY COACHES",
                  style: Styles.h6(context: context, textColor: Colors.grey),
                ),
                Text(
                  "VIEW PAST SESSIONS",
                  style: Styles.h6(context: context, textColor: Colors.green),
                )
              ],
            ),
          ),


          SizedBox(
            height: 10.0,
          ),


          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: GridView.count(
              crossAxisCount: Utils.isPhone(context) ? 2 : 3,
              shrinkWrap: true,
              crossAxisSpacing: (Utils.isPhone(context)) ? 3 : 10,
              mainAxisSpacing: (Utils.isPhone(context)) ? 3 : 10,
              primary: false,
              childAspectRatio: 1 / 1.4,
              children: <Widget>[
                _cardCell(context, true, 0),
                _cardCell(context, false, 1),
                _cardCell(context, true, 2),
                _cardCell(context, false, 3),
                _cardCell(context, true, 4),
                _cardCell(context, false, 5),
                _cardCell(context, true, 6),
                _cardCell(context, false, 7),
                _cardCell(context, false, 8),
                _cardCell(context, false, 9),
                _cardCell(context, false, 10),
                _cardCell(context, false, 11),
                _cardCell(context, false, 12),
              ],
            ),
          )


        ],
      ),
    );
  }































  Widget _cardCell(BuildContext context, bool isAvailable, int index) {
    final screenSize = MediaQuery.of(context).size;
    final double profileImageSize =
        screenSize.width / ((Utils.isPhone(context) ? 7 : 10));


    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[


          SizedBox(
            height: 20,
          ),

          Container(
            child: Stack(
              children: <Widget>[


                Center(
                  child: Container(
                    width: profileImageSize,
                    height: profileImageSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(profileImageSize / 2),
                        color: Colors.green,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg"))),
                  ),
                ),


                Container(
                  height: profileImageSize / 2,
                  child: Align(
                    alignment: Alignment(0.30, 0),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Const.colorGreen,
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2.0)),
                    ),
                  ),
                ),


              ],
            ),
          ),


          Container(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: Center(
              child: Text(
                "Francisco",
                style: Styles.h4(context: context, textColor: Colors.black),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Center(
              child: Text(
                "Away for the",
                style: Styles.h6(context: context, textColor: Colors.grey),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "next 2 hours",
                style: Styles.h6(context: context, textColor: Colors.grey),
              ),
            ),
          ),

          Container(
            height: Utils.isPhone(context) ? 35 : 55,
            color: Const.colorGreen,
            child: Center(
              child: Text(
                "Request",
                style: Styles.h5(context: context, textColor: Colors.white),
              ),
            ),
          )


        ],
      ),
    );
  }










}

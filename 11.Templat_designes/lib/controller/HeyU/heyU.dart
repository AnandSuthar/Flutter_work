import 'package:flutter/material.dart';
import 'package:template_design/other/const.dart';
import 'package:template_design/other/styles.dart';
import 'package:template_design/other/utils.dart';
import 'package:template_design/controller/HeyU/heyUHomeViewController.dart';




//https://symu.co/freebies/mobile-apps/heyu-mobile-app-psd/

class HeyStateController extends StatefulWidget {
  @override
  createState() => HeyStateControllerState();
}

class HeyStateControllerState extends State<HeyStateController> {


  Widget _signupButton({BuildContext context}) {

    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HeyUHomeViewController()));
      },
      child: Container(
        height: Utils.isPhone() ? 40 : 50,
        width: screenSize.width/(Utils.isPhone() ? 1.5 : 2),
        child: Center(
          child: Text("Sign up", style: Styles.h3(context: context, textColor: Const.colorRedStart),),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget inputViews({BuildContext context, String placeholderText}) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: Utils.isPhone() ? 40 : 50,
      width: screenSize.width/(Utils.isPhone() ? 1.5 : 2),
      decoration: BoxDecoration(
        color: Const.colorDarkRed,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: placeholderText,
          hintStyle: Styles.textFieldStyle(context: context),
          border: InputBorder.none,
        ),
      ),
    );
  }









  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(


      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Const.colorRedStart, Const.colorRedEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
        ),


        child: ListView(
          shrinkWrap: true,
          children: <Widget>[

            AspectRatio(
              aspectRatio: 1/0.5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HeyU", style: Styles.h1Plus(context: context, textColor: Colors.white)),
                    SizedBox(height: 15,),
                    Text("Free chat app template", style: Styles.h3(context: context, textColor: Colors.white70),)
                  ],
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
                inputViews(context: context, placeholderText: "johndoe@symu.co"),
                SizedBox(height: (Utils.isPhone() ? 30 : 50),),
                inputViews(context: context, placeholderText: "*****************"),
                SizedBox(height: 100,),
                _signupButton(context: context),
                SizedBox(height: 25,),
                Center(
                  child: Container(
                    child: Text("Already have an account? Sign in", style: Styles.h6(context: context, textColor: Colors.white70),),
                  ),
                ),
                SizedBox(height: 50,),


              ],
            )

          ],
        ),


      ),


    );
  }
}
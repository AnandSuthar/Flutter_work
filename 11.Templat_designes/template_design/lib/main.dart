import 'package:flutter/material.dart';
import 'package:template_design/controller/homeViewController.dart';
import 'package:template_design/controller/heyU.dart';


void main() {

  runApp(
      MaterialApp(
        title: "Template design",
        home: ListOfLayoutsViewController(),
        debugShowCheckedModeBanner: false,
      )
  );

}












class ListOfLayoutsViewController extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout designs"),
      ),
      body: ListView(
        children: <Widget>[

          GestureDetector(
            child: Center(
              child: Container(
                height: 50,
                color: Colors.green,
                child: Text("Get Coaching"),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeViewController()));
            },
          ),


          GestureDetector(
            child: Center(
              child: Container(
                height: 50,
                color: Colors.green,
                child: Text("HeyU"),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HeyStateController()));
            },
          ),


//          GestureDetector(
//            child: Center(
//              child: Container(
//                height: 50,
//                color: Colors.green,
//                child: Text("Bottom Navigation"),
//              ),
//            ),
//            onTap: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavController()));
//            },
//          ),



        ],
      ),
    );
  }

}






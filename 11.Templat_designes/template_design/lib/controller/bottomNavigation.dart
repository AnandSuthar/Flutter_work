import 'package:flutter/material.dart';

//https://medium.com/coding-with-flutter/flutter-bottomappbar-navigation-with-fab-8b962bb55013


class BottomNavController extends StatefulWidget {
  @override
  createState() => BottomNavControllerState();
}

class BottomNavControllerState extends State<BottomNavController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Nav bar"),),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Icon(Icons.add, color: Colors.red,),
              height: 50.0,
            ),
            Icon(Icons.add, color: Colors.red,),
            Icon(Icons.add, color: Colors.red,),
            Icon(Icons.add, color: Colors.red,),
          ],
        ),
        color: Colors.yellow,
      ),

    );

//    return Scaffold(
//      appBar: AppBar(title: Text("Bottom nav bar"),),
//      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add),),
////      floatingActionButton: Container(width: 100, height: 100, color: Colors.red,),
////      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      bottomNavigationBar: BottomNavigationBar(
////          type: BottomNavigationBarType.fixed,
//          items: [
//            BottomNavigationBarItem(icon: Icon(Icons.star, color: Colors.red,), title: Container(height: 0,)),
//            BottomNavigationBarItem(icon: Container(height: 50, color: Colors.black,), title: Container(height: 0,)),
////            BottomNavigationBarItem(icon: Icon(Icons.star, color: Colors.red,), title: Container(height: 0,)),
////            BottomNavigationBarItem(icon: Icon(Icons.star, color: Colors.red,), title: Container(height: 0,)),
//          ]
//      ),
//    );
  }
}
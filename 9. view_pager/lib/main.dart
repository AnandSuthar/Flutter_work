import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ViewPagerController(),
    )
  );
}


class ViewPagerController extends StatefulWidget {
  @override
  createState() => ViewPagerState();
}

class ViewPagerState extends State<ViewPagerController> {

  var pageController = PageController();
  var currentPageValue = 0.0;






  Widget _controllerTitles() {

    return GridView.builder(itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

      itemBuilder: (BuildContext context, int index) {
        return Text('Item $index');
      },
    );
        
  }



  @override
  Widget build(BuildContext context) {


    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page;

//        print("currentPageValue = ${currentPageValue.floor()}");

      });
    });


    // TODO: implement build
    return Material(
      child: Column(
        children: <Widget>[
          _controllerTitles(),
//          Container(
//            height: 60,
//            color: Colors.red,
//          ),
          Expanded(
              child: PageView(
                controller: pageController,
                children: <Widget>[
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.cyan,
                  ),
                  Container(
                    color: Colors.deepPurple,
                  ),
                ],
              ),

          )
        ],
      )
    );
  }

}
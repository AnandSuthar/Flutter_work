import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoScrollbarViewController extends StatefulWidget {
  @override
  createState() => CupertinoScrollbarViewControllerState();
}

class CupertinoScrollbarViewControllerState extends State<CupertinoScrollbarViewController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Cupoertino scrollbars"),),
      body: Column(
        children: <Widget>[


          RaisedButton(onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return AndroidScrollBars();
            }));
          }, child: Text("Android"),),

          RaisedButton(onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return CupertinoScrollBars();
            }));
          }, child: Text("Cupertino"),)


        ],
      )
    );

  }
}









class AndroidScrollBars extends StatefulWidget {
  createState() => AndroidScrollBarsState();
}

class AndroidScrollBarsState extends State<AndroidScrollBars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Android"),),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(50),),
            Container(child: Text("Android"), padding: EdgeInsets.all(100),),
            Container(child: Text("Android"), padding: EdgeInsets.all(10),),
            Container(child: Text("Android"), padding: EdgeInsets.all(70),),
            Container(child: Text("Android"), padding: EdgeInsets.all(30),),
            Container(child: Text("Android"), padding: EdgeInsets.all(200),),
            Container(child: Text("Android"), padding: EdgeInsets.all(150),),
            Container(child: Text("Android"), padding: EdgeInsets.all(220),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(50),),
            Container(child: Text("Android"), padding: EdgeInsets.all(100),),
            Container(child: Text("Android"), padding: EdgeInsets.all(10),),
            Container(child: Text("Android"), padding: EdgeInsets.all(70),),
            Container(child: Text("Android"), padding: EdgeInsets.all(30),),
            Container(child: Text("Android"), padding: EdgeInsets.all(200),),
            Container(child: Text("Android"), padding: EdgeInsets.all(150),),
            Container(child: Text("Android"), padding: EdgeInsets.all(220),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
          ],
        )
      ),
    );

  }
}










class CupertinoScrollBars extends StatefulWidget {
  createState() => CupertinoScrollBarsState();
}

class CupertinoScrollBarsState extends State<CupertinoScrollBars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("iOS"),),
      body: CupertinoScrollbar(
        child: ListView(
          children: <Widget>[
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(50),),
            Container(child: Text("Android"), padding: EdgeInsets.all(100),),
            Container(child: Text("Android"), padding: EdgeInsets.all(10),),
            Container(child: Text("Android"), padding: EdgeInsets.all(70),),
            Container(child: Text("Android"), padding: EdgeInsets.all(30),),
            Container(child: Text("Android"), padding: EdgeInsets.all(200),),
            Container(child: Text("Android"), padding: EdgeInsets.all(150),),
            Container(child: Text("Android"), padding: EdgeInsets.all(220),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(50),),
            Container(child: Text("Android"), padding: EdgeInsets.all(100),),
            Container(child: Text("Android"), padding: EdgeInsets.all(10),),
            Container(child: Text("Android"), padding: EdgeInsets.all(70),),
            Container(child: Text("Android"), padding: EdgeInsets.all(30),),
            Container(child: Text("Android"), padding: EdgeInsets.all(200),),
            Container(child: Text("Android"), padding: EdgeInsets.all(150),),
            Container(child: Text("Android"), padding: EdgeInsets.all(220),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
            Container(child: Text("Android"), padding: EdgeInsets.all(20),),
          ],
        )
      ),
    );

  }
}
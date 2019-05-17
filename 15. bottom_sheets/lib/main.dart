import 'package:flutter/material.dart';

//https://www.youtube.com/watch?v=KpR5fQx_V2c

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  createState() => MyHomePageState(); 
}

class MyHomePageState extends State<MyHomePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  VoidCallback _showPersistanceCallBack;


  @override
  void initState() {
    super.initState();
    _showPersistanceCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {

    setState(() {
      _showPersistanceCallBack = null;
    });

    _scaffoldKey.currentState.showBottomSheet((context) {
      return Container(
        margin: EdgeInsets.all(50),
        height: 800,
        color: Colors.greenAccent,
        child: Center(
          child: Text("Hi botomsheet"),
        ),
      );
    }).closed.whenComplete(() {
      setState(() {
        _showPersistanceCallBack = _showBottomSheet;
      });
    });

  }

  void _showModelSheet() {
    showModalBottomSheet(context: context, builder: (builder) {
      return Container(
        height: 200,
        color: Colors.greenAccent,
        child: Center(
          child: Text("Hi botomsheet"),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("App bar"), automaticallyImplyLeading: false,),
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _showPersistanceCallBack,
              child: Text("Pres"),
            ),
            Padding(padding: EdgeInsets.all(50)),
            RaisedButton(
              onPressed: _showModelSheet,
              child: Text("Model"),
            )
          ],
        ),
      ),
    );
    
  }
}
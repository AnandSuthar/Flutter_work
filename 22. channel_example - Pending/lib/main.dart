import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';


// https://medium.com/flutter/flutter-platform-channels-ce7f540a104e
// https://github.com/flutter/flutter/issues/19968



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeViewController(),
    );
  }
}




class HomeViewController extends StatefulWidget {
  @override
  createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {

  static const channel = const MethodChannel('samples.flutter.dev/channel');
  String _batteryLevel = "0";
  int _addedTowNumber = 0;
  String messageFromiOS = "I am in Flutter";




  @override
  void initState() {
    super.initState();

    BinaryMessages.setMessageHandler('foo', (ByteData message) async {
      final ReadBuffer readBuffer = ReadBuffer(message);
      final double x = readBuffer.getFloat64();
      final int n = readBuffer.getInt32();
      print('Received $x and $n');
      return null;
    });


  }


  Future<void> _addToNumber() async {
    int added;
    try {
      _addedTowNumber = await channel.invokeMethod('addToNumbers');
    } on PlatformException catch (e) {
    }
    setState(() {
    });
  }
  
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await channel.invokeMethod('getBatteryLevel');
      batteryLevel = '$result';
    } on PlatformException catch (e) {
      batteryLevel = '${e.message}';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });

  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Channel example"),),
      body: Center(
        child: Column(
          children: <Widget>[


            Text("battery level = ${_batteryLevel}"),
            RaisedButton(onPressed: () {
              _getBatteryLevel();
            }, child: Text("get battery level"),),

            Text("6+5 = $_addedTowNumber"),
            RaisedButton(onPressed: () {
              _addToNumber();
            }, child: Text('Add tow numbers'),),

            RaisedButton(onPressed: (){


              final WriteBuffer buffer = WriteBuffer()
                  ..putFloat64(3.1415)
                  ..putInt32(12345678);
              final ByteData message = buffer.done();
              BinaryMessages.send('foo', message);
              print('message sent, reply ignored');


            }, child: Text("Pass binary msf"),),

            Text(messageFromiOS)

          ],
        ),
      ),
    );
  }
}

// https://fireship.io/lessons/flutter-push-notifications-fcm-guide/

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;


  @override
  void initState() {
    super.initState();

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage = $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch = $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume = $message");
      },
//      onBackgroundMessage: (Map<String, dynamic> message) async {
//        print("onBackgroundMessage = $message");
//      }



    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Notificationz"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[


            RaisedButton(
              child: Text("Request for permission"),
              onPressed: () async{

                iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
                });
                _fcm.requestNotificationPermissions(IosNotificationSettings(alert: true, badge: true, sound: true));

              },
            ),
            RaisedButton(
              child: Text("Get Token"),
              onPressed: () async {
                String fcmToken = await _fcm.getToken();
                print("fcmToken = $fcmToken");
              },
            )


          ],
        )
      ),
    );
  }
}

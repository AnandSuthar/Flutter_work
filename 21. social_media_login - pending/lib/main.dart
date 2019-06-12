import 'package:flutter/material.dart';
import 'package:social_login/social_login.dart';

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
      home: SocialMediaLogin(),
    );
  }
}

class SocialMediaLogin extends StatefulWidget {
  @override
  createState() => SocialMediaLoginState();
}

class SocialMediaLoginState extends State<SocialMediaLogin> {

  final socialLogin = SocialLogin();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Social media login"),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: () {

              socialLogin.setConfig(SocialConfig(
                facebookAppId: "979462882253711",
              ));

              socialLogin.logInFacebookWithPermissions(FacebookPermissions.DEFAULT);

//              socialLogin.logInFacebookWithPermissions(FacebookPermissions.DEFAULT).then((facebookUser) {
//                print("Name = ${facebookUser.name}");
//              });

            }, child: Text("Facebook"),),

            RaisedButton(onPressed: () {

            }, child: Text("Goodle"),),

            RaisedButton(onPressed: () {

            }, child: Text("Twitter"),),


          ],
        ),
      ),
    );
  }
}
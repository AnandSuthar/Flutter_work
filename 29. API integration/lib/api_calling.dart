import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'User.dart';
import 'network.dart';


class ApiCalling extends StatefulWidget {
  @override
  _ApiCallingState createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {

  bool showLoader = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    Network();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Stack(
          children: <Widget>[


            Center(
              child: RaisedButton(
                child: Text("Call API"),
                onPressed: () {

                  setState(() => showLoader = true);

                  UserExt.getUserInfo((user){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("${user.userId}"),));
                    setState(() => showLoader = false);
                  }, (error){
                    if(error != null) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("$error"),));
                      setState(() => showLoader = false);
                    }
                  });

                },
              ),
            ),
            Visibility(child: CircularProgressIndicator(backgroundColor: Colors.pink,), visible: showLoader,),


          ],
        ),
      ),
    );
  }
}
